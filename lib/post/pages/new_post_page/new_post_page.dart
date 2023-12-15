import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mewtwo/base/widgets/post_image.dart';
import 'package:mewtwo/post/pages/new_post_page/new_post_page_store.dart';
import 'package:detectable_text_field/widgets/detectable_text_field.dart';

class NewPostPage extends ConsumerWidget {
  final ImagePicker picker = ImagePicker();
  NewPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final store = ref.watch(newPostPageStoreProvider);
    return Observer(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("New Post"),
          actions: [
            if (store.displayImagePath.isNotEmpty)
              TextButton(
                  onPressed: () {
                    selectPhoto(context: context, store: store);
                  },
                  child: const Text("Choose another"))
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  AspectRatio(
                      aspectRatio: PostImage.aspectRatio,
                      child: (store.displayImagePath.isEmpty)
                          ? GestureDetector(
                              onTap: () async {
                                selectPhoto(context: context, store: store);
                              },
                              child: Container(
                                color: Colors.grey,
                                alignment: Alignment.center,
                                child: const Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(Icons.add_a_photo),
                                    Text("Tap here to upload a new photo for your post")
                                  ],
                                ),
                              ),
                            )
                          : Image.file(File(store.displayImagePath))),
                  const SizedBox(height: 18),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      shopMyLook(store),
                      DetectableTextField(
                        maxLines: 5,
                        style: const TextStyle(fontSize: 14),
                        controller: store.controller,
                        decoration: const InputDecoration(
                            contentPadding: EdgeInsets.symmetric(horizontal: 8),
                            hintText:
                                "Write your caption here...\n🔥Tip: Include the size, price and hyperlinks of your clothes for better content creation on miromie!",
                            hintStyle: TextStyle(fontSize: 14, color: Color(0xFF7D7878)),
                            border: InputBorder.none,
                            enabledBorder: InputBorder.none
                            ),
                      ),
                    ]),
                  )
                ],
              ),
            ))
          ],
        ),
      );
    });
  }

  Widget shopMyLook(NewPostPageStore store) {
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

  void selectPhoto({required BuildContext context, required NewPostPageStore store}) async {
    final imageFile = await showOtherProfileOptions(context);
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

  Future<XFile?> showOtherProfileOptions(BuildContext context) {
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
