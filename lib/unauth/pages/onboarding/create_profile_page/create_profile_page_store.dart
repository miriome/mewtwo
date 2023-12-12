// @dart = 2.12
// ignore_for_file: import_of_legacy_library_into_null_safe
import 'dart:io';

import 'package:mewtwo/mew.dart';
import 'package:mewtwo/unauth/api/api.dart';
import 'package:mobx/mobx.dart';

part 'create_profile_page_store.g.dart';

class CreateProfilePageStore extends _CreateProfilePageStore with _$CreateProfilePageStore {}

abstract class _CreateProfilePageStore with Store {
  @observable
  String cropppedImageFilePath = "";

  @observable
  String name = "";

  @action
  Future<bool> editProfile() async {
    List<int>? fileBytes;
    if (cropppedImageFilePath.isNotEmpty) {
      fileBytes = File(cropppedImageFilePath).readAsBytesSync();
    }
    final editProfileProvider = EditProfileApiProvider(displayName: name, fileBytes: fileBytes);
    return await Mew.pc.read(editProfileProvider.future);
  }
}
