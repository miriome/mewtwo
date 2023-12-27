// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upsert_post_base_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$upsertPostBaseStoreHash() =>
    r'9e8e00b2db981edb07970d05b40e76be54cb2689';

/// See also [upsertPostBaseStore].
@ProviderFor(upsertPostBaseStore)
final upsertPostBaseStoreProvider =
    AutoDisposeProvider<UpsertPostBaseStore>.internal(
  upsertPostBaseStore,
  name: r'upsertPostBaseStoreProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$upsertPostBaseStoreHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UpsertPostBaseStoreRef = AutoDisposeProviderRef<UpsertPostBaseStore>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ImageEditModel on _ImageEditModel, Store {
  late final _$hasBeenCroppedAtom =
      Atom(name: '_ImageEditModel.hasBeenCropped', context: context);

  @override
  bool get hasBeenCropped {
    _$hasBeenCroppedAtom.reportRead();
    return super.hasBeenCropped;
  }

  @override
  set hasBeenCropped(bool value) {
    _$hasBeenCroppedAtom.reportWrite(value, super.hasBeenCropped, () {
      super.hasBeenCropped = value;
    });
  }

  @override
  String toString() {
    return '''
hasBeenCropped: ${hasBeenCropped}
    ''';
  }
}

mixin _$UpsertPostBaseStore on _UpsertPostBaseStore, Store {
  Computed<bool>? _$canPostComputed;

  @override
  bool get canPost => (_$canPostComputed ??= Computed<bool>(() => super.canPost,
          name: '_UpsertPostBaseStore.canPost'))
      .value;

  late final _$_editableImagesAtom =
      Atom(name: '_UpsertPostBaseStore._editableImages', context: context);

  ObservableList<ImageEditModel> get editableImages {
    _$_editableImagesAtom.reportRead();
    return super._editableImages;
  }

  @override
  ObservableList<ImageEditModel> get _editableImages => editableImages;

  @override
  set _editableImages(ObservableList<ImageEditModel> value) {
    _$_editableImagesAtom.reportWrite(value, super._editableImages, () {
      super._editableImages = value;
    });
  }

  late final _$shopMyLookAtom =
      Atom(name: '_UpsertPostBaseStore.shopMyLook', context: context);

  @override
  bool get shopMyLook {
    _$shopMyLookAtom.reportRead();
    return super.shopMyLook;
  }

  @override
  set shopMyLook(bool value) {
    _$shopMyLookAtom.reportWrite(value, super.shopMyLook, () {
      super.shopMyLook = value;
    });
  }

  late final _$imagePagePositionAtom =
      Atom(name: '_UpsertPostBaseStore.imagePagePosition', context: context);

  @override
  double get imagePagePosition {
    _$imagePagePositionAtom.reportRead();
    return super.imagePagePosition;
  }

  @override
  set imagePagePosition(double value) {
    _$imagePagePositionAtom.reportWrite(value, super.imagePagePosition, () {
      super.imagePagePosition = value;
    });
  }

  late final _$_isImageEditingAtom =
      Atom(name: '_UpsertPostBaseStore._isImageEditing', context: context);

  bool get isImageEditing {
    _$_isImageEditingAtom.reportRead();
    return super._isImageEditing;
  }

  @override
  bool get _isImageEditing => isImageEditing;

  @override
  set _isImageEditing(bool value) {
    _$_isImageEditingAtom.reportWrite(value, super._isImageEditing, () {
      super._isImageEditing = value;
    });
  }

  late final _$postAsyncAction =
      AsyncAction('_UpsertPostBaseStore.post', context: context);

  @override
  Future<bool> post() {
    return _$postAsyncAction.run(() => super.post());
  }

  late final _$_UpsertPostBaseStoreActionController =
      ActionController(name: '_UpsertPostBaseStore', context: context);

  @override
  void toggleEdit() {
    final _$actionInfo = _$_UpsertPostBaseStoreActionController.startAction(
        name: '_UpsertPostBaseStore.toggleEdit');
    try {
      return super.toggleEdit();
    } finally {
      _$_UpsertPostBaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateDisplayImagePathAtIndex(
      {required String path, required int index}) {
    final _$actionInfo = _$_UpsertPostBaseStoreActionController.startAction(
        name: '_UpsertPostBaseStore.updateDisplayImagePathAtIndex');
    try {
      return super.updateDisplayImagePathAtIndex(path: path, index: index);
    } finally {
      _$_UpsertPostBaseStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
shopMyLook: ${shopMyLook},
imagePagePosition: ${imagePagePosition},
canPost: ${canPost}
    ''';
  }
}
