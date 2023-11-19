// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getPostsApiHash() => r'8ad4dbc37db37fdd2b9147530c4f19e61d63ad14';

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
class GetPostsApiFamily extends Family<AsyncValue<GetPostsApiModel?>> {
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
class GetPostsApiProvider extends AutoDisposeFutureProvider<GetPostsApiModel?> {
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
    FutureOr<GetPostsApiModel?> Function(GetPostsApiRef provider) create,
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
  AutoDisposeFutureProviderElement<GetPostsApiModel?> createElement() {
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

mixin GetPostsApiRef on AutoDisposeFutureProviderRef<GetPostsApiModel?> {
  /// The parameter `pageIndex` of this provider.
  int get pageIndex;
}

class _GetPostsApiProviderElement
    extends AutoDisposeFutureProviderElement<GetPostsApiModel?>
    with GetPostsApiRef {
  _GetPostsApiProviderElement(super.provider);

  @override
  int get pageIndex => (origin as GetPostsApiProvider).pageIndex;
}

String _$likePostApiHash() => r'c5fb6f786edd31620bf3ed330cf4e0fe25623409';

/// See also [likePostApi].
@ProviderFor(likePostApi)
const likePostApiProvider = LikePostApiFamily();

/// See also [likePostApi].
class LikePostApiFamily extends Family<AsyncValue<bool>> {
  /// See also [likePostApi].
  const LikePostApiFamily();

  /// See also [likePostApi].
  LikePostApiProvider call({
    required int postId,
    required bool setLikeTo,
  }) {
    return LikePostApiProvider(
      postId: postId,
      setLikeTo: setLikeTo,
    );
  }

  @override
  LikePostApiProvider getProviderOverride(
    covariant LikePostApiProvider provider,
  ) {
    return call(
      postId: provider.postId,
      setLikeTo: provider.setLikeTo,
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
  String? get name => r'likePostApiProvider';
}

/// See also [likePostApi].
class LikePostApiProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [likePostApi].
  LikePostApiProvider({
    required int postId,
    required bool setLikeTo,
  }) : this._internal(
          (ref) => likePostApi(
            ref as LikePostApiRef,
            postId: postId,
            setLikeTo: setLikeTo,
          ),
          from: likePostApiProvider,
          name: r'likePostApiProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$likePostApiHash,
          dependencies: LikePostApiFamily._dependencies,
          allTransitiveDependencies:
              LikePostApiFamily._allTransitiveDependencies,
          postId: postId,
          setLikeTo: setLikeTo,
        );

  LikePostApiProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.postId,
    required this.setLikeTo,
  }) : super.internal();

  final int postId;
  final bool setLikeTo;

  @override
  Override overrideWith(
    FutureOr<bool> Function(LikePostApiRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: LikePostApiProvider._internal(
        (ref) => create(ref as LikePostApiRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        postId: postId,
        setLikeTo: setLikeTo,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _LikePostApiProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is LikePostApiProvider &&
        other.postId == postId &&
        other.setLikeTo == setLikeTo;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, postId.hashCode);
    hash = _SystemHash.combine(hash, setLikeTo.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin LikePostApiRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `postId` of this provider.
  int get postId;

  /// The parameter `setLikeTo` of this provider.
  bool get setLikeTo;
}

class _LikePostApiProviderElement extends AutoDisposeFutureProviderElement<bool>
    with LikePostApiRef {
  _LikePostApiProviderElement(super.provider);

  @override
  int get postId => (origin as LikePostApiProvider).postId;
  @override
  bool get setLikeTo => (origin as LikePostApiProvider).setLikeTo;
}

String _$searchApiHash() => r'4234648ea28f3c3dec713f1f68b629c49ebc0236';

/// See also [searchApi].
@ProviderFor(searchApi)
const searchApiProvider = SearchApiFamily();

/// See also [searchApi].
class SearchApiFamily extends Family<AsyncValue<SearchApiModel?>> {
  /// See also [searchApi].
  const SearchApiFamily();

  /// See also [searchApi].
  SearchApiProvider call({
    required int pageIndex,
    required String keyword,
  }) {
    return SearchApiProvider(
      pageIndex: pageIndex,
      keyword: keyword,
    );
  }

  @override
  SearchApiProvider getProviderOverride(
    covariant SearchApiProvider provider,
  ) {
    return call(
      pageIndex: provider.pageIndex,
      keyword: provider.keyword,
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
  String? get name => r'searchApiProvider';
}

/// See also [searchApi].
class SearchApiProvider extends AutoDisposeFutureProvider<SearchApiModel?> {
  /// See also [searchApi].
  SearchApiProvider({
    required int pageIndex,
    required String keyword,
  }) : this._internal(
          (ref) => searchApi(
            ref as SearchApiRef,
            pageIndex: pageIndex,
            keyword: keyword,
          ),
          from: searchApiProvider,
          name: r'searchApiProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$searchApiHash,
          dependencies: SearchApiFamily._dependencies,
          allTransitiveDependencies: SearchApiFamily._allTransitiveDependencies,
          pageIndex: pageIndex,
          keyword: keyword,
        );

  SearchApiProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.pageIndex,
    required this.keyword,
  }) : super.internal();

  final int pageIndex;
  final String keyword;

  @override
  Override overrideWith(
    FutureOr<SearchApiModel?> Function(SearchApiRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SearchApiProvider._internal(
        (ref) => create(ref as SearchApiRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        pageIndex: pageIndex,
        keyword: keyword,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<SearchApiModel?> createElement() {
    return _SearchApiProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SearchApiProvider &&
        other.pageIndex == pageIndex &&
        other.keyword == keyword;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, pageIndex.hashCode);
    hash = _SystemHash.combine(hash, keyword.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin SearchApiRef on AutoDisposeFutureProviderRef<SearchApiModel?> {
  /// The parameter `pageIndex` of this provider.
  int get pageIndex;

  /// The parameter `keyword` of this provider.
  String get keyword;
}

class _SearchApiProviderElement
    extends AutoDisposeFutureProviderElement<SearchApiModel?>
    with SearchApiRef {
  _SearchApiProviderElement(super.provider);

  @override
  int get pageIndex => (origin as SearchApiProvider).pageIndex;
  @override
  String get keyword => (origin as SearchApiProvider).keyword;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
