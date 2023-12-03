// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getPostDetailsApiHash() => r'582cfe39ac44dd477f66519bab8e32740fae57f4';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [getPostDetailsApi].
@ProviderFor(getPostDetailsApi)
const getPostDetailsApiProvider = GetPostDetailsApiFamily();

/// See also [getPostDetailsApi].
class GetPostDetailsApiFamily extends Family<AsyncValue<PostModel?>> {
  /// See also [getPostDetailsApi].
  const GetPostDetailsApiFamily();

  /// See also [getPostDetailsApi].
  GetPostDetailsApiProvider call({
    required int postId,
  }) {
    return GetPostDetailsApiProvider(
      postId: postId,
    );
  }

  @override
  GetPostDetailsApiProvider getProviderOverride(
    covariant GetPostDetailsApiProvider provider,
  ) {
    return call(
      postId: provider.postId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'getPostDetailsApiProvider';
}

/// See also [getPostDetailsApi].
class GetPostDetailsApiProvider extends AutoDisposeFutureProvider<PostModel?> {
  /// See also [getPostDetailsApi].
  GetPostDetailsApiProvider({
    required int postId,
  }) : this._internal(
          (ref) => getPostDetailsApi(
            ref as GetPostDetailsApiRef,
            postId: postId,
          ),
          from: getPostDetailsApiProvider,
          name: r'getPostDetailsApiProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getPostDetailsApiHash,
          dependencies: GetPostDetailsApiFamily._dependencies,
          allTransitiveDependencies:
              GetPostDetailsApiFamily._allTransitiveDependencies,
          postId: postId,
        );

  GetPostDetailsApiProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.postId,
  }) : super.internal();

  final int postId;

  @override
  Override overrideWith(
    FutureOr<PostModel?> Function(GetPostDetailsApiRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetPostDetailsApiProvider._internal(
        (ref) => create(ref as GetPostDetailsApiRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        postId: postId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<PostModel?> createElement() {
    return _GetPostDetailsApiProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetPostDetailsApiProvider && other.postId == postId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, postId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetPostDetailsApiRef on AutoDisposeFutureProviderRef<PostModel?> {
  /// The parameter `postId` of this provider.
  int get postId;
}

class _GetPostDetailsApiProviderElement
    extends AutoDisposeFutureProviderElement<PostModel?>
    with GetPostDetailsApiRef {
  _GetPostDetailsApiProviderElement(super.provider);

  @override
  int get postId => (origin as GetPostDetailsApiProvider).postId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
