import 'dart:io';

import 'package:detectable_text_field/widgets/detectable_text_editing_controller.dart';
import 'package:flutter/material.dart';
import 'package:mewtwo/home/api/api.dart';
import 'package:mewtwo/home/model/user_model.dart';
import 'package:mewtwo/mew.dart';
import 'package:mewtwo/post/widgets/user_mention_search/user_mention_search_store.dart';
import 'package:mobx/mobx.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

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
   List<int>? fileBytes;
   final displayImagePath = displayImagePaths.first;
    if (displayImagePath.isNotEmpty && !displayImagePath.startsWith("http")) {
      fileBytes = File(displayImagePath).readAsBytesSync();
    }
    final upsertPostProvider = AddPostApiProvider(caption: controller.text, chatEnabled: shopMyLook, photoFileBytes: fileBytes);
    final res = await Mew.pc.read(upsertPostProvider.future);
    return res;
  }
}
