import 'dart:io';

import 'package:dartx/dartx.dart';
import 'package:detectable_text_field/widgets/detectable_text_editing_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_nude_detector/flutter_nude_detector.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mewtwo/base/widgets/post_image.dart';
import 'package:mewtwo/home/model/user_model.dart';
import 'package:mewtwo/mew.dart';
import 'package:mewtwo/post/api/api.dart';
import 'package:mewtwo/post/widgets/user_mention_search/user_mention_search_store.dart';
import 'package:mewtwo/profile/profile_page/profile_page_store.dart';
import 'package:mobx/mobx.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:image/image.dart' as img;

part 'upsert_post_base_store.g.dart';

@riverpod
UpsertPostBaseStore upsertPostBaseStore(UpsertPostBaseStoreRef ref) {
  final store = UpsertPostBaseStore();
  ref.onDispose(() {
    store.dispose();
  });
  return store;
}

class UpsertPostBaseStore extends _UpsertPostBaseStore with _$UpsertPostBaseStore {}

abstract class _UpsertPostBaseStore with Store {
  final controller = DetectableTextEditingController();

  final portalController = OverlayPortalController();

  final userMentionStore = UserMentionSearchStore();

  final imagePageController = PageController();

  _UpsertPostBaseStore() {
    controller.addListener(() async {
      if (userMentionStore.userResults.isEmpty) {
        portalController.hide();
      }
      final cursorBasePosition = controller.selection.baseOffset;
      if (cursorBasePosition == -1) {
        // base position becomes -1 when changing text.
        return;
      }

      if (cursorBasePosition != controller.selection.extentOffset) {
        // Is cursor selection, ignore
        return;
      }
      final splitString = controller.selection.textBefore(controller.text).split(" ");
      if (splitString.isEmpty) {
        return;
      }
      String currentlyEditingText = splitString.last;
      // Only @, need user to give filter, so dont show.
      if (!currentlyEditingText.startsWith("@") || (currentlyEditingText.length < 2)) {
        portalController.hide();
        return;
      }
      userMentionStore.search(currentlyEditingText.substring(1));
      if (userMentionStore.isLoading) {
        portalController.show();
      }
    });
    imagePageController.addListener(() {
      imagePagePosition = imagePageController.page ?? 0;
    });
  }

  @observable
  ObservableList<String> displayImagePaths = ObservableList.of([]);

  @observable
  bool shopMyLook = false;

  @observable
  double imagePagePosition = 0;

  @action
  void updateDisplayImagePathAtIndex({required String path, required int index}) {
    displayImagePaths.removeAt(index);
    displayImagePaths.insert(index, path);
  }

  void dispose() {
    controller.dispose();
    imagePageController.dispose();
  }

  void onMentionUserSearchTap(UserModel user) {
    final cursorBasePosition = controller.selection.baseOffset;

    if (cursorBasePosition != controller.selection.extentOffset) {
      // Is cursor selection, ignore
      return;
    }
    final splitString = controller.selection.textBefore(controller.text).split(" ");
    if (splitString.isEmpty) {
      return;
    }
    splitString[splitString.length - 1] = "@${user.username} ";
    final mentionedString = splitString.join(" ");
    controller.text = mentionedString + controller.text.substring(controller.selection.baseOffset);
  }

  @action
  Future<bool> post() async {
    final imagesIndexThatHaveNudity = (await Future.wait(displayImagePaths.mapIndexed((index, path) async {
      if (!path.startsWith("http")) {
        final hasNudity = await FlutterNudeDetector.detect(path: path);
        return hasNudity ? index : null;
      }
      return null;
    }))).whereNotNull();

    if (imagesIndexThatHaveNudity.isNotEmpty) {
      Fluttertoast.showToast(msg: "Images ${imagesIndexThatHaveNudity.joinToString(separator: ", ")} are inappropriate");
      return false;
    }
    
    
    final photosToPostFutures = displayImagePaths.mapIndexed<Future<PostPhoto?>>((index, path) async {
      if (!path.startsWith("http")) {
        //  final jpegImage = await img.decodeImageFile(path);
        
        //  final resizedImage = img.copyResize(jpegImage!, width: PostImage.maxWidth.toInt());
        final cmd = img.Command()
          // Decode the image file at the given path
          ..decodeImageFile(path)
          // Resize the image to a width of 64 pixels and a height that maintains the aspect ratio of the original.
          ..copyResize(width: PostImage.maxWidth.toInt());

        await cmd.executeThread();
        
        if (cmd.outputImage == null) {
          return null;
        }
        final output = img.encodeNamedImage(path, cmd.outputImage!);
        if (output == null) {
          return null;
        }
        
        
        return PostPhoto(index: index, photoFileBytes: output);
      }
      return null;
    });
    
    final photosToPost = (await Future.wait(photosToPostFutures));
    if (photosToPost.contains(null)) {
      return false;
    }
    
    final upsertPostProvider =
        AddPostApiProvider(caption: controller.text, chatEnabled: shopMyLook, photos: photosToPost.whereNotNull().toList());
    final res = await Mew.pc.read(upsertPostProvider.future);
    if (res) {
      Future.delayed(const Duration(milliseconds: 250), () {
        Mew.pc.read(currentUserProfilePageStoreProvider).load();
      });
    }
    return res;
  }
}
