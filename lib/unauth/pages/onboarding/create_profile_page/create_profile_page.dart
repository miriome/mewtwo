import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mewtwo/routes/routes.dart';
import 'package:mewtwo/unauth/pages/onboarding/create_profile_page/create_profile_page_store.dart';
import 'package:mewtwo/unauth/routes/routes.dart';

class CreateProfilePage extends StatelessWidget {
  final ImagePicker picker = ImagePicker();
  final store = CreateProfilePageStore();
  CreateProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Observer(builder: (context) {
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              actions: [
                TextButton(
                    onPressed: () {
                      MeasurementsRoute().push(context);
                    },
                    child: const Text(
                      "Skip",
                      style: TextStyle(color: Color(0xFF7D7878)),
                    )),
              ],
              title: const Text(
                "Mirror me",
                style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
              ),
              automaticallyImplyLeading: false,
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 24,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 100),
                  child: Text(
                    "Mirror, mirror on the wall, who's the fairest of them all? ",
                    style: TextStyle(
                      fontSize: 16,
                      color: Color(0xFF7D7878),
                    ),
                    maxLines: 2,
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                GestureDetector(
                  onTap: () async {
                    final imageFile = await picker.pickImage(source: ImageSource.gallery);
                    if (imageFile != null) {
                      final croppedFile = await ImageCropper().cropImage(
                        sourcePath: imageFile.path,
                        cropStyle: CropStyle.circle,
                      );
                      if (croppedFile != null) {
                        store.cropppedImageFilePath = croppedFile.path;
                      }
                    }
                  },
                  child: Center(
                    child: Stack(
                      children: [
                        Container(
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: store.cropppedImageFilePath.isEmpty ? Theme.of(context).primaryColor : null),
                          child: store.cropppedImageFilePath.isNotEmpty
                              ? ClipOval(child: Image.file(File(store.cropppedImageFilePath)))
                              : null,
                        ),
                        if (store.cropppedImageFilePath.isEmpty)
                          const PositionedDirectional(
                              bottom: 0,
                              end: 8,
                              child: Icon(
                                Icons.add_a_photo,
                                size: 28,
                              ))
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextFormField(
                      onChanged: (text) => store.name = text,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      maxLength: 15,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      decoration: InputDecoration(
                        labelText: "Name",
                        helperText: "No more than 15 characters",
                        helperStyle: const TextStyle(color: Color(0xFF7D7878)),
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Color(0xFF8474A1)),
                            borderRadius: BorderRadius.circular(12)),
                      )),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  child: FilledButton(
                      onPressed: store.name.isEmpty ? null : () {},
                      child: const Text(
                        "Next",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
