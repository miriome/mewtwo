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

String _$deleteCommentApiHash() => r'b751d96d823b3bb35f52da5ad011ebee9cc37b3f';

/// See also [deleteCommentApi].
@ProviderFor(deleteCommentApi)
const deleteCommentApiProvider = DeleteCommentApiFamily();

/// See also [deleteCommentApi].
class DeleteCommentApiFamily extends Family<AsyncValue<bool>> {
  /// See also [deleteCommentApi].
  const DeleteCommentApiFamily();

  /// See also [deleteCommentApi].
  DeleteCommentApiProvider call({
    required int commentId,
  }) {
    return DeleteCommentApiProvider(
      commentId: commentId,
    );
  }

  @override
  DeleteCommentApiProvider getProviderOverride(
    covariant DeleteCommentApiProvider provider,
  ) {
    return call(
      commentId: provider.commentId,
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
  String? get name => r'deleteCommentApiProvider';
}

/// See also [deleteCommentApi].
class DeleteCommentApiProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [deleteCommentApi].
  DeleteCommentApiProvider({
    required int commentId,
  }) : this._internal(
          (ref) => deleteCommentApi(
            ref as DeleteCommentApiRef,
            commentId: commentId,
          ),
          from: deleteCommentApiProvider,
          name: r'deleteCommentApiProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$deleteCommentApiHash,
          dependencies: DeleteCommentApiFamily._dependencies,
          allTransitiveDependencies:
              DeleteCommentApiFamily._allTransitiveDependencies,
          commentId: commentId,
        );

  DeleteCommentApiProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.commentId,
  }) : super.internal();

  final int commentId;

  @override
  Override overrideWith(
    FutureOr<bool> Function(DeleteCommentApiRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: DeleteCommentApiProvider._internal(
        (ref) => create(ref as DeleteCommentApiRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        commentId: commentId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _DeleteCommentApiProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is DeleteCommentApiProvider && other.commentId == commentId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, commentId.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin DeleteCommentApiRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `commentId` of this provider.
  int get commentId;
}

class _DeleteCommentApiProviderElement
    extends AutoDisposeFutureProviderElement<bool> with DeleteCommentApiRef {
  _DeleteCommentApiProviderElement(super.provider);

  @override
  int get commentId => (origin as DeleteCommentApiProvider).commentId;
}

String _$addCommentApiHash() => r'39f08c1d78cbcf5da28b17304e20fc83c49b7960';

/// See also [addCommentApi].
@ProviderFor(addCommentApi)
const addCommentApiProvider = AddCommentApiFamily();

/// See also [addCommentApi].
class AddCommentApiFamily extends Family<AsyncValue<bool>> {
  /// See also [addCommentApi].
  const AddCommentApiFamily();

  /// See also [addCommentApi].
  AddCommentApiProvider call({
    required int postId,
    required String comment,
  }) {
    return AddCommentApiProvider(
      postId: postId,
      comment: comment,
    );
  }

  @override
  AddCommentApiProvider getProviderOverride(
    covariant AddCommentApiProvider provider,
  ) {
    return call(
      postId: provider.postId,
      comment: provider.comment,
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
  String? get name => r'addCommentApiProvider';
}

/// See also [addCommentApi].
class AddCommentApiProvider extends AutoDisposeFutureProvider<bool> {
  /// See also [addCommentApi].
  AddCommentApiProvider({
    required int postId,
    required String comment,
  }) : this._internal(
          (ref) => addCommentApi(
            ref as AddCommentApiRef,
            postId: postId,
            comment: comment,
          ),
          from: addCommentApiProvider,
          name: r'addCommentApiProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$addCommentApiHash,
          dependencies: AddCommentApiFamily._dependencies,
          allTransitiveDependencies:
              AddCommentApiFamily._allTransitiveDependencies,
          postId: postId,
          comment: comment,
        );

  AddCommentApiProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.postId,
    required this.comment,
  }) : super.internal();

  final int postId;
  final String comment;

  @override
  Override overrideWith(
    FutureOr<bool> Function(AddCommentApiRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: AddCommentApiProvider._internal(
        (ref) => create(ref as AddCommentApiRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        postId: postId,
        comment: comment,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<bool> createElement() {
    return _AddCommentApiProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is AddCommentApiProvider &&
        other.postId == postId &&
        other.comment == comment;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, postId.hashCode);
    hash = _SystemHash.combine(hash, comment.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin AddCommentApiRef on AutoDisposeFutureProviderRef<bool> {
  /// The parameter `postId` of this provider.
  int get postId;

  /// The parameter `comment` of this provider.
  String get comment;
}

class _AddCommentApiProviderElement
    extends AutoDisposeFutureProviderElement<bool> with AddCommentApiRef {
  _AddCommentApiProviderElement(super.provider);

  @override
  int get postId => (origin as AddCommentApiProvider).postId;
  @override
  String get comment => (origin as AddCommentApiProvider).comment;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
