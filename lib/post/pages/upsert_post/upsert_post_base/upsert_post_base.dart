import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:detectable_text_field/widgets/detectable_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mewtwo/base/widgets/post_image.dart';
import 'package:mewtwo/post/pages/upsert_post/upsert_post_base/upsert_post_base_store.dart';
import 'package:mewtwo/post/widgets/user_mention_search/user_mention_search.dart';

class UpsertPostBase extends ConsumerWidget {
  final ImagePicker picker = ImagePicker();
  final link = LayerLink();
  final UpsertPostBaseStore store;
  final String titleText;
  UpsertPostBase({Key? key, required this.store, required this.titleText}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Observer(builder: (context) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(titleText),
            actions: [
              if (store.displayImagePath.isNotEmpty)
                TextButton(
                    onPressed: () {
                      selectPhoto(context: context);
                    },
                    child: const Text("Choose another"))
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  children: [
                    AspectRatio(
                        aspectRatio: PostImage.aspectRatio,
                        
                        child: (store.displayImagePath.isEmpty)
                            ? GestureDetector(
                                onTap: () async {
                                  selectPhoto(context: context);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  decoration:
                                      const BoxDecoration(border: Border(bottom: BorderSide(style: BorderStyle.solid))),
                                  child: const Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(Icons.add_a_photo),
                                      Text("Tap here to upload a new photo for your post")
                                    ],
                                  ),
                                ),
                              )
                            : postImage),
                    const SizedBox(height: 18),
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
                ),
              )),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: FilledButton(
                    onPressed: () async {
                      EasyLoading.show();
                      final res = await store.post();
                      EasyLoading.dismiss();
                      if (res && context.mounted) {
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
      );
    });
  }

  Widget get postImage {
    final image = store.displayImagePath.startsWith("http")
        ? CachedNetworkImage(imageUrl: store.displayImagePath, fit: PostImage.fit,)
        : Image.file(File(store.displayImagePath), fit: PostImage.fit,);
    return image;
  }

  Widget shopMyLook() {
    return Row(
      children: [
        Checkbox(
            value: store.shopMyLook,
            onChanged: (toggle) => store.shopMyLook = toggle ?? false,
            fillColor: MaterialStateProperty.resolveWith((states) {
              if (states.contains(MaterialState.selected)) {
                return const Color(0xFF8474A1);
              }
              return null;
            })),
        const Text(
          "Shop My Look",
          style: TextStyle(fontSize: 16, color: Color(0xFF8474A1), fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          width: 12,
        ),
        const Flexible(
            child: Text(
          "Enable this if you are selling any items",
          maxLines: 2,
          style: TextStyle(color: Color(0xFF7D7878)),
        ))
      ],
    );
  }

  void selectPhoto({required BuildContext context}) async {
    final imageFile = await showOtherProfilePostOptions(context);
    if (imageFile != null) {
      final croppedFile = await ImageCropper().cropImage(
          sourcePath: imageFile.path,
          cropStyle: CropStyle.rectangle,
          aspectRatio: const CropAspectRatio(ratioX: 184, ratioY: 242));
      if (croppedFile != null) {
        store.displayImagePath = croppedFile.path;
      }
    }
  }

  Future<XFile?> showOtherProfilePostOptions(BuildContext context) {
    return showCupertinoModalPopup<XFile?>(
      context: context,
      builder: (BuildContext modalContext) => CupertinoActionSheet(
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(modalContext);
          },
          child: const Text('Cancel', style: TextStyle(color: Color(0xFF7D7878))),
        ),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            onPressed: () async {
              final image = await picker.pickImage(source: ImageSource.camera);
              if (modalContext.mounted) {
                Navigator.pop(modalContext, image);
              }
            },
            child: const Text(
              'Select from camera',
              style: TextStyle(color: Color(0xFF7D7878)),
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () async {
              final image = await picker.pickImage(source: ImageSource.gallery);
              if (modalContext.mounted) {
                Navigator.pop(modalContext, image);
              }
            },
            child: const Text('Select from library', style: TextStyle(color: Color(0xFF7D7878))),
          ),
        ],
      ),
    );
  }
}
