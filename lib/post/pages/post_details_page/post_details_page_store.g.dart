// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_details_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PostDetailsPageStore on _PostDetailsPageStore, Store {
  Computed<int>? _$commentsLengthComputed;

  @override
  int get commentsLength =>
      (_$commentsLengthComputed ??= Computed<int>(() => super.commentsLength,
              name: '_PostDetailsPageStore.commentsLength'))
          .value;
  Computed<List<CommentModel>>? _$visibleCommentsComputed;

  @override
  List<CommentModel> get visibleComments => (_$visibleCommentsComputed ??=
          Computed<List<CommentModel>>(() => super.visibleComments,
              name: '_PostDetailsPageStore.visibleComments'))
      .value;
  Computed<bool>? _$isMyPostComputed;

  @override
  bool get isMyPost =>
      (_$isMyPostComputed ??= Computed<bool>(() => super.isMyPost,
              name: '_PostDetailsPageStore.isMyPost'))
          .value;
  Computed<bool>? _$canAddCommentComputed;

  @override
  bool get canAddComment =>
      (_$canAddCommentComputed ??= Computed<bool>(() => super.canAddComment,
              name: '_PostDetailsPageStore.canAddComment'))
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

  late final _$_commentsAtom =
      Atom(name: '_PostDetailsPageStore._comments', context: context);

  @override
  ObservableList<CommentModel> get _comments {
    _$_commentsAtom.reportRead();
    return super._comments;
  }

  @override
  set _comments(ObservableList<CommentModel> value) {
    _$_commentsAtom.reportWrite(value, super._comments, () {
      super._comments = value;
    });
  }

  late final _$showAllCommentsAtom =
      Atom(name: '_PostDetailsPageStore.showAllComments', context: context);

  @override
  bool get showAllComments {
    _$showAllCommentsAtom.reportRead();
    return super.showAllComments;
  }

  @override
  set showAllComments(bool value) {
    _$showAllCommentsAtom.reportWrite(value, super.showAllComments, () {
      super.showAllComments = value;
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

  late final _$isShopableDescriptionVisibleAtom = Atom(
      name: '_PostDetailsPageStore.isShopableDescriptionVisible',
      context: context);

  @override
  bool get isShopableDescriptionVisible {
    _$isShopableDescriptionVisibleAtom.reportRead();
    return super.isShopableDescriptionVisible;
  }

  @override
  set isShopableDescriptionVisible(bool value) {
    _$isShopableDescriptionVisibleAtom
        .reportWrite(value, super.isShopableDescriptionVisible, () {
      super.isShopableDescriptionVisible = value;
    });
  }

  late final _$currentEditingCommentAtom = Atom(
      name: '_PostDetailsPageStore.currentEditingComment', context: context);

  @override
  String get currentEditingComment {
    _$currentEditingCommentAtom.reportRead();
    return super.currentEditingComment;
  }

  @override
  set currentEditingComment(String value) {
    _$currentEditingCommentAtom.reportWrite(value, super.currentEditingComment,
        () {
      super.currentEditingComment = value;
    });
  }

  late final _$interactiveViewStateAtom = Atom(
      name: '_PostDetailsPageStore.interactiveViewState', context: context);

  @override
  Matrix4 get interactiveViewState {
    _$interactiveViewStateAtom.reportRead();
    return super.interactiveViewState;
  }

  @override
  set interactiveViewState(Matrix4 value) {
    _$interactiveViewStateAtom.reportWrite(value, super.interactiveViewState,
        () {
      super.interactiveViewState = value;
    });
  }

  late final _$togglePostLikeAsyncAction =
      AsyncAction('_PostDetailsPageStore.togglePostLike', context: context);

  @override
  Future<void> togglePostLike() {
    return _$togglePostLikeAsyncAction.run(() => super.togglePostLike());
  }

  late final _$deletePostAsyncAction =
      AsyncAction('_PostDetailsPageStore.deletePost', context: context);

  @override
  Future<bool> deletePost() {
    return _$deletePostAsyncAction.run(() => super.deletePost());
  }

  late final _$markPostSoldAsyncAction =
      AsyncAction('_PostDetailsPageStore.markPostSold', context: context);

  @override
  Future<bool> markPostSold() {
    return _$markPostSoldAsyncAction.run(() => super.markPostSold());
  }

  @override
  String toString() {
    return '''
showAllComments: ${showAllComments},
isMeasurementsVisible: ${isMeasurementsVisible},
isShopableDescriptionVisible: ${isShopableDescriptionVisible},
currentEditingComment: ${currentEditingComment},
interactiveViewState: ${interactiveViewState},
commentsLength: ${commentsLength},
visibleComments: ${visibleComments},
isMyPost: ${isMyPost},
canAddComment: ${canAddComment}
    ''';
  }
}
