// GENERATED CODE - DO NOT MODIFY BY HAND
// @dart=2.12

part of 'create_profile_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateProfilePageStore on _CreateProfilePageStore, Store {
  late final _$cropppedImageFilePathAtom = Atom(
      name: '_CreateProfilePageStore.cropppedImageFilePath', context: context);

  @override
  String get cropppedImageFilePath {
    _$cropppedImageFilePathAtom.reportRead();
    return super.cropppedImageFilePath;
  }

  @override
  set cropppedImageFilePath(String value) {
    _$cropppedImageFilePathAtom.reportWrite(value, super.cropppedImageFilePath,
        () {
      super.cropppedImageFilePath = value;
    });
  }

  late final _$nameAtom =
      Atom(name: '_CreateProfilePageStore.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$editProfileAsyncAction =
      AsyncAction('_CreateProfilePageStore.editProfile', context: context);

  @override
  Future<bool> editProfile() {
    return _$editProfileAsyncAction.run(() => super.editProfile());
  }

  @override
  String toString() {
    return '''
cropppedImageFilePath: ${cropppedImageFilePath},
name: ${name}
    ''';
  }
}
