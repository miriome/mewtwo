// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getPostsApiHash() => r'71fd39063ed826895382bec3401224d5151c7ac1';

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

/// See also [getPostsApi].
@ProviderFor(getPostsApi)
const getPostsApiProvider = GetPostsApiFamily();

/// See also [getPostsApi].
class GetPostsApiFamily extends Family<AsyncValue<List<PostModel>>> {
  /// See also [getPostsApi].
  const GetPostsApiFamily();

  /// See also [getPostsApi].
  GetPostsApiProvider call({
    required int pageIndex,
  }) {
    return GetPostsApiProvider(
      pageIndex: pageIndex,
    );
  }

  @override
  GetPostsApiProvider getProviderOverride(
    covariant GetPostsApiProvider provider,
  ) {
    return call(
      pageIndex: provider.pageIndex,
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
  String? get name => r'getPostsApiProvider';
}

/// See also [getPostsApi].
class GetPostsApiProvider extends AutoDisposeFutureProvider<List<PostModel>> {
  /// See also [getPostsApi].
  GetPostsApiProvider({
    required int pageIndex,
  }) : this._internal(
          (ref) => getPostsApi(
            ref as GetPostsApiRef,
            pageIndex: pageIndex,
          ),
          from: getPostsApiProvider,
          name: r'getPostsApiProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$getPostsApiHash,
          dependencies: GetPostsApiFamily._dependencies,
          allTransitiveDependencies:
              GetPostsApiFamily._allTransitiveDependencies,
          pageIndex: pageIndex,
        );

  GetPostsApiProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.pageIndex,
  }) : super.internal();

  final int pageIndex;

  @override
  Override overrideWith(
    FutureOr<List<PostModel>> Function(GetPostsApiRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: GetPostsApiProvider._internal(
        (ref) => create(ref as GetPostsApiRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        pageIndex: pageIndex,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<PostModel>> createElement() {
    return _GetPostsApiProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is GetPostsApiProvider && other.pageIndex == pageIndex;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pageIndex.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin GetPostsApiRef on AutoDisposeFutureProviderRef<List<PostModel>> {
  /// The parameter `pageIndex` of this provider.
  int get pageIndex;
}

class _GetPostsApiProviderElement
    extends AutoDisposeFutureProviderElement<List<PostModel>>
    with GetPostsApiRef {
  _GetPostsApiProviderElement(super.provider);

  @override
  int get pageIndex => (origin as GetPostsApiProvider).pageIndex;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
