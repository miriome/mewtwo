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

mixin _$UpsertPostBaseStore on _UpsertPostBaseStore, Store {
  late final _$displayImagePathAtom =
      Atom(name: '_UpsertPostBaseStore.displayImagePath', context: context);

  @override
  String get displayImagePath {
    _$displayImagePathAtom.reportRead();
    return super.displayImagePath;
  }

  @override
  set displayImagePath(String value) {
    _$displayImagePathAtom.reportWrite(value, super.displayImagePath, () {
      super.displayImagePath = value;
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

  late final _$postAsyncAction =
      AsyncAction('_UpsertPostBaseStore.post', context: context);

  @override
  Future<bool> post() {
    return _$postAsyncAction.run(() => super.post());
  }

  @override
  String toString() {
    return '''
displayImagePath: ${displayImagePath},
shopMyLook: ${shopMyLook}
    ''';
  }
}
