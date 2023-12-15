// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_section_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CommentsSectionStore on _CommentsSectionStore, Store {
  Computed<int>? _$commentsLengthComputed;

  @override
  int get commentsLength =>
      (_$commentsLengthComputed ??= Computed<int>(() => super.commentsLength,
              name: '_CommentsSectionStore.commentsLength'))
          .value;
  Computed<bool>? _$canAddCommentComputed;

  @override
  bool get canAddComment =>
      (_$canAddCommentComputed ??= Computed<bool>(() => super.canAddComment,
              name: '_CommentsSectionStore.canAddComment'))
          .value;
  Computed<List<CommentModel>>? _$visibleCommentsComputed;

  @override
  List<CommentModel> get visibleComments => (_$visibleCommentsComputed ??=
          Computed<List<CommentModel>>(() => super.visibleComments,
              name: '_CommentsSectionStore.visibleComments'))
      .value;

  late final _$_commentsAtom =
      Atom(name: '_CommentsSectionStore._comments', context: context);

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
      Atom(name: '_CommentsSectionStore.showAllComments', context: context);

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

  late final _$_isCommentSendingAtom =
      Atom(name: '_CommentsSectionStore._isCommentSending', context: context);

  bool get isCommentSending {
    _$_isCommentSendingAtom.reportRead();
    return super._isCommentSending;
  }

  @override
  bool get _isCommentSending => isCommentSending;

  @override
  set _isCommentSending(bool value) {
    _$_isCommentSendingAtom.reportWrite(value, super._isCommentSending, () {
      super._isCommentSending = value;
    });
  }

  late final _$currentEditingCommentAtom = Atom(
      name: '_CommentsSectionStore.currentEditingComment', context: context);

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

  late final _$_CommentsSectionStoreActionController =
      ActionController(name: '_CommentsSectionStore', context: context);

  @override
  void updateCommments(List<CommentModel> comments) {
    final _$actionInfo = _$_CommentsSectionStoreActionController.startAction(
        name: '_CommentsSectionStore.updateCommments');
    try {
      return super.updateCommments(comments);
    } finally {
      _$_CommentsSectionStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showAllComments: ${showAllComments},
currentEditingComment: ${currentEditingComment},
commentsLength: ${commentsLength},
canAddComment: ${canAddComment},
visibleComments: ${visibleComments}
    ''';
  }
}
