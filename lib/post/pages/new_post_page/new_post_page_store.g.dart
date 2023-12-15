// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'new_post_page_store.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$newPostPageStoreHash() => r'05fa9e281c16281d58215175c3ff7cab145b373e';

/// See also [newPostPageStore].
@ProviderFor(newPostPageStore)
final newPostPageStoreProvider = AutoDisposeProvider<NewPostPageStore>.internal(
  newPostPageStore,
  name: r'newPostPageStoreProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$newPostPageStoreHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NewPostPageStoreRef = AutoDisposeProviderRef<NewPostPageStore>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$NewPostPageStore on _NewPostPageStore, Store {
  late final _$displayImagePathAtom =
      Atom(name: '_NewPostPageStore.displayImagePath', context: context);

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

  @override
  String toString() {
    return '''
displayImagePath: ${displayImagePath}
    ''';
  }
}
