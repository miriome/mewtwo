import 'dart:io';

import 'package:dartx/dartx.dart';
import 'package:detectable_text_field/widgets/detectable_text_editing_controller.dart';
import 'package:extended_image/extended_image.dart';
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

class _ImageEditModel {
  final String displayImagePath;
  final GlobalKey<ExtendedImageEditorState> editorStateKey;
  Rect? cropRect;

  _ImageEditModel({required this.displayImagePath, required this.editorStateKey});
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

  @readonly
  ObservableList<_ImageEditModel> _editableImages = ObservableList.of([]);

  @observable
  bool shopMyLook = false;

  @observable
  double imagePagePosition = 0;

  @observable
  bool isImageEditing = false;

  void setEditableImages(Iterable<String> imagePaths) {
    _editableImages = ObservableList.of(imagePaths
        .map((path) => _ImageEditModel(displayImagePath: path, editorStateKey: GlobalKey<ExtendedImageEditorState>())));
  }

  @action
  void updateDisplayImagePathAtIndex({required String path, required int index}) {
    _editableImages.removeAt(index);
    _editableImages.insert(
        index, _ImageEditModel(displayImagePath: path, editorStateKey: GlobalKey<ExtendedImageEditorState>()));
  }

  void nextEditingImage() {
    if (!_updateCropRect()) {
      return;
    }
    imagePageController.nextPage(duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
  }

  void previousEditingImage() {
    if (!_updateCropRect()) {
      return;
    }
    imagePageController.previousPage(duration: const Duration(milliseconds: 250), curve: Curves.easeOut);
  }

  bool _updateCropRect() {
    final page = imagePageController.page?.toInt();
    if (page == null) {
      return false; // Shouldnt
    }
    _editableImages[page].cropRect = _editableImages[page].editorStateKey.currentState?.getCropRect();
    return true;
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
    if (!_updateCropRect()) {
      return false;
    }
    final imagesIndexThatHaveNudity = (await Future.wait(_editableImages.mapIndexed((index, image) async {
      final path = image.displayImagePath;
      if (!path.startsWith("http")) {
        final hasNudity = await FlutterNudeDetector.detect(path: path);
        return hasNudity ? index : null;
      }
      return null;
    })))
        .whereNotNull();

    if (imagesIndexThatHaveNudity.isNotEmpty) {
      Fluttertoast.showToast(
          msg: "Images ${imagesIndexThatHaveNudity.joinToString(separator: ", ")} are inappropriate");
      return false;
    }

    final photosToPostFutures = _editableImages.mapIndexed<Future<PostPhoto?>>((index, image) async {
      final cropRect = image.cropRect;
      if (cropRect == null) {
        return null;
      }

      final path = image.displayImagePath;
      if (!path.startsWith("http")) {
        //  final jpegImage = await img.decodeImageFile(path);

        //  final resizedImage = img.copyResize(jpegImage!, width: PostImage.maxWidth.toInt());
        final cmd = img.Command()
          // Decode the image file at the given path
          ..decodeImageFile(path)
          ..copyCrop(
              x: cropRect.left.toInt(),
              y: cropRect.top.toInt(),
              width: cropRect.width.toInt(),
              height: cropRect.height.toInt());

        await cmd.executeThread();
        // img.copyCrop(src, x: x, y: y, width: width, height: height)
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
      Fluttertoast.showToast(
          msg: "Images failed to be processed. Please try again.");
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
