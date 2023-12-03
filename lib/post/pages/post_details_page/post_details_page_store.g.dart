// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_details_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PostDetailsPageStore on _PostDetailsPageStore, Store {
  Computed<List<CommentModel>>? _$commentsComputed;

  @override
  List<CommentModel> get comments =>
      (_$commentsComputed ??= Computed<List<CommentModel>>(() => super.comments,
              name: '_PostDetailsPageStore.comments'))
          .value;
  Computed<bool>? _$isMyPostComputed;

  @override
  bool get isMyPost =>
      (_$isMyPostComputed ??= Computed<bool>(() => super.isMyPost,
              name: '_PostDetailsPageStore.isMyPost'))
          .value;

  late final _$_selfUserIdAtom =
      Atom(name: '_PostDetailsPageStore._selfUserId', context: context);

  @override
  int? get _selfUserId {
    _$_selfUserIdAtom.reportRead();
    return super._selfUserId;
  }

  @override
  set _selfUserId(int? value) {
    _$_selfUserIdAtom.reportWrite(value, super._selfUserId, () {
      super._selfUserId = value;
    });
  }

  late final _$_isLoadingAtom =
      Atom(name: '_PostDetailsPageStore._isLoading', context: context);

  bool get isLoading {
    _$_isLoadingAtom.reportRead();
    return super._isLoading;
  }

  @override
  bool get _isLoading => isLoading;

  @override
  set _isLoading(bool value) {
    _$_isLoadingAtom.reportWrite(value, super._isLoading, () {
      super._isLoading = value;
    });
  }

  late final _$_postAtom =
      Atom(name: '_PostDetailsPageStore._post', context: context);

  PostModel? get post {
    _$_postAtom.reportRead();
    return super._post;
  }

  @override
  PostModel? get _post => post;

  @override
  set _post(PostModel? value) {
    _$_postAtom.reportWrite(value, super._post, () {
      super._post = value;
    });
  }

  late final _$isMeasurementsVisibleAtom = Atom(
      name: '_PostDetailsPageStore.isMeasurementsVisible', context: context);

  @override
  bool get isMeasurementsVisible {
    _$isMeasurementsVisibleAtom.reportRead();
    return super.isMeasurementsVisible;
  }

  @override
  set isMeasurementsVisible(bool value) {
    _$isMeasurementsVisibleAtom.reportWrite(value, super.isMeasurementsVisible,
        () {
      super.isMeasurementsVisible = value;
    });
  }

  @override
  String toString() {
    return '''
isMeasurementsVisible: ${isMeasurementsVisible},
comments: ${comments},
isMyPost: ${isMyPost}
    ''';
  }
}
