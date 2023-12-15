import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mewtwo/base/widgets/post_image.dart';
import 'package:mewtwo/post/pages/new_post_page/new_post_page_store.dart';

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
            if(store.displayImagePath.isNotEmpty)
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
                          : Image.file(File(store.displayImagePath)))
                ],
              ),
            ))
          ],
        ),
      );
    });
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
