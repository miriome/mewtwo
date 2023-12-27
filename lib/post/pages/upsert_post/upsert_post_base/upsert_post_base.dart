import 'dart:io';

import 'package:detectable_text_field/widgets/detectable_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mewtwo/base/widgets/post_image.dart';
import 'package:mewtwo/base/widgets/shoppable_icon.dart';
import 'package:extended_image/extended_image.dart';
import 'package:mewtwo/post/pages/upsert_post/upsert_post_base/upsert_post_base_store.dart';
import 'package:mewtwo/post/widgets/user_mention_search/user_mention_search.dart';
import 'package:mewtwo/utils.dart';

class UpsertPostBase extends StatelessWidget {
  final ImagePicker picker = ImagePicker();
  final link = LayerLink();
  final UpsertPostBaseStore store;
  final String titleText;
  UpsertPostBase({Key? key, required this.store, required this.titleText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(titleText),
            actions: [
              if (store.editableImages.isNotEmpty) ...[
                IconButton(
                    onPressed: () {
                      store.toggleEdit();
                    },
                    icon: const Icon(Icons.edit)),
                IconButton(
                    onPressed: () {
                      selectPhoto(context: context);
                    },
                    icon: const Icon(Icons.restart_alt))
              ]
            ],
          ),
          body: SingleChildScrollView(
            physics: store.isImageEditing ? const NeverScrollableScrollPhysics() : null,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                (store.editableImages.isEmpty)
                    ? AspectRatio(
                        aspectRatio: PostImage.aspectRatio,
                        child: GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () async {
                            selectPhoto(context: context);
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: const Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [Icon(Icons.add_a_photo), Text("Tap here to upload a new photo for your post")],
                            ),
                          ),
                        ))
                    : postImageSection,
                const SizedBox(height: 18),
                if (store.editableImages.isNotEmpty) ...[
                  CompositedTransformTarget(
                    link: link,
                    child: OverlayPortal(
                      controller: store.portalController,
                      overlayChildBuilder: (context) => PositionedDirectional(
                        height: 200,
                        start: 0,
                        end: 0,
                        child: CompositedTransformFollower(
                          link: link,
                          targetAnchor: Alignment.bottomLeft,
                          followerAnchor: Alignment.bottomLeft,
                          child: UserMentionSearch(
                              onUserResultsTap: (user) {
                                store.onMentionUserSearchTap(user);
                                store.portalController.hide();
                              },
                              store: store.userMentionStore),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: shopMyLook(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: DetectableTextField(
                      onTapOutside: (_) => FocusScope.of(context).unfocus(),
                      maxLines: 5,
                      style: const TextStyle(fontSize: 16),
                      controller: store.controller,
                      decoration: const InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 8),
                          hintText:
                              "Write your caption here...\n🔥Tip: Include the size, price and hyperlinks of your clothes for better content creation on miromie!",
                          hintStyle: TextStyle(fontSize: 14, color: Color(0xFF7D7878)),
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none),
                    ),
                  ),
                ],
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                  child: FilledButton(
                      onPressed: !store.canPost
                          ? null
                          : () async {
                              EasyLoading.show(maskType: EasyLoadingMaskType.clear);
                              final res = await store.post();
                              EasyLoading.dismiss();
                              if (res && context.mounted) {
                                Fluttertoast.showToast(msg: "Post uploaded", gravity: ToastGravity.CENTER);
                                Navigator.of(context).pop();
                              }
                            },
                      child: const Text(
                        "Post",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget buildPostImage(ImageEditModel image) {
    // if (!store.isImageEditing) {
    //   return PostImage(imageUrl: image.displayImagePath);
    // }
    return Stack(
      children: [
        Positioned.fill(
          child: image.displayImagePath.contains("http")
              ? ExtendedImage.network(
                  image.displayImagePath,
                  enableLoadState: true,
                  extendedImageEditorKey: image.editorStateKey,
                  fit: store.isImageEditing ? BoxFit.contain : BoxFit.cover,
                  mode: store.isImageEditing ? ExtendedImageMode.editor : ExtendedImageMode.none,
                  cacheRawData: true,
                  initEditorConfigHandler: (state) {
                    return EditorConfig(
                        initialCropAspectRatio: PostImage.aspectRatio,
                        initCropRectType: InitCropRectType.layoutRect,
                        cropAspectRatio: PostImage.aspectRatio,
                        cropRectPadding: EdgeInsets.zero,
                        hitTestBehavior: HitTestBehavior.opaque);
                  },
                )
              : ExtendedImage.file(
                  File(image.displayImagePath),
                  extendedImageEditorKey: image.editorStateKey,
                  fit: store.isImageEditing ? BoxFit.contain : BoxFit.cover,
                  mode: store.isImageEditing ? ExtendedImageMode.editor : ExtendedImageMode.none,
                  cacheRawData: true,
                  initEditorConfigHandler: (state) {
                    return EditorConfig(
                        initialCropAspectRatio: PostImage.aspectRatio,
                        initCropRectType: InitCropRectType.layoutRect,
                        cropAspectRatio: PostImage.aspectRatio,
                        cropRectPadding: EdgeInsets.zero,
                        hitTestBehavior: HitTestBehavior.opaque);
                  },
                ),
        ),
        if (store.shopMyLook)
          const PositionedDirectional(
            bottom: 8,
            start: 8,
            child: ShoppableIcon(
              size: 24,
            ),
          ),
      ],
    );
  }

  Widget get postImageSection {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AspectRatio(
          aspectRatio: PostImage.aspectRatio,
          child: PageView(
              physics: store.isImageEditing ? const NeverScrollableScrollPhysics() : null,
              controller: store.imagePageController,
              children: store.editableImages.map((image) => buildPostImage(image)).toList()),
        ),
        const SizedBox(
          height: 8,
        ),
        if (store.editableImages.length > 1)
          Row(
            children: [
              Flexible(
                flex: 1,
                fit: FlexFit.tight,
                child: DotsIndicator(
                  dotsCount: store.editableImages.length,
                  position: store.imagePagePosition,
                ),
              ),
            ],
          ),
      ],
    );
  }

  Widget shopMyLook() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 24,
          child: Checkbox(
              value: store.shopMyLook,
              onChanged: (toggle) => store.shopMyLook = toggle ?? false,
              fillColor: MaterialStateProperty.resolveWith((states) {
                if (states.contains(MaterialState.selected)) {
                  return const Color(0xFF8474A1);
                }
                return null;
              })),
        ),
        const Text(
          "Shop My Look",
          style: TextStyle(fontSize: 16, color: Color(0xFF8474A1), fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 12,
        ),
        Flexible(
            child: Text(
          store.shopMyLook
              ? "Others can chat with you to purchase your item(s)"
              : "Enable this if you are selling any items",
          maxLines: 2,
          style: const TextStyle(color: Color(0xFF7D7878)),
        ))
      ],
    );
  }

  void selectPhoto({required BuildContext context}) async {
    final imageFiles = await showOtherProfilePostOptions(context);
    store.setEditableImages(imageFiles.map((e) => e.path), false);
  }

  Future<List<XFile>> showOtherProfilePostOptions(BuildContext context) async {
    return await showCupertinoModalPopup<List<XFile>>(
          context: context,
          builder: (BuildContext modalContext) => CupertinoActionSheet(
            cancelButton: CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(modalContext, <XFile>[]);
              },
              child: const Text('Cancel', style: TextStyle(color: Color(0xFF7D7878))),
            ),
            actions: <CupertinoActionSheetAction>[
              CupertinoActionSheetAction(
                onPressed: () async {
                  final image = await picker.pickImage(source: ImageSource.camera, maxWidth: PostImage.maxWidth);

                  if (modalContext.mounted) {
                    Navigator.pop(modalContext, image != null ? [image] : <XFile>[]);
                  }
                },
                child: const Text(
                  'Select from camera',
                  style: TextStyle(color: Color(0xFF7D7878)),
                ),
              ),
              CupertinoActionSheetAction(
                onPressed: () async {
                  final images = await picker.pickMultiImage();
                  if (modalContext.mounted) {
                    Navigator.pop(modalContext, images);
                  }
                },
                child: const Text('Select from library', style: TextStyle(color: Color(0xFF7D7878))),
              ),
            ],
          ),
        ) ??
        [];
  }
}
