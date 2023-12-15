import 'package:flutter/material.dart';
import 'package:mewtwo/base/linkify/user_mention_special_text.dart';
import 'package:mewtwo/home/model/comment_model.dart';
import 'package:mewtwo/mew.dart';
import 'package:mewtwo/post/api/api.dart';
import 'package:mewtwo/post/pages/post_details_page/comments/comments_user_mention_search/comments_user_mention_search_store.dart';
import 'package:mobx/mobx.dart';

part 'comments_section_store.g.dart';

class CommentsSectionStore extends _CommentsSectionStore with _$CommentsSectionStore {
  CommentsSectionStore({required super.postId});
}

abstract class _CommentsSectionStore with Store {
  void Function()? _reloadPostData;
  final int postId;
  static const int _visibleCommentsLength = 3;

  final TextEditingController commentController = TextEditingController();
  final portalController = OverlayPortalController();
  final List<ReactionDisposer> _disposer = [];
  void dispose() {
    commentController.dispose();
    for (var element in _disposer) {
      element.call();
    }
  }

  final CommentsUserMentionSearchStore userMentionStore = CommentsUserMentionSearchStore();
  _CommentsSectionStore({required this.postId}) {
    _disposer.add(reaction((p0) => userMentionStore.userResults, (results) {
      if (results.isNotEmpty) {
        portalController.show();
      }
    }));
    commentController.addListener(() async {
      if (userMentionStore.userResults.isEmpty) {
        portalController.hide();
      }
      final cursorBasePosition = commentController.selection.baseOffset;

      if (cursorBasePosition != commentController.selection.extentOffset) {
        // Is cursor selection, ignore
        return;
      }

      final splitString = commentController.text.split(" ");
      if (splitString.isEmpty) {
        return;
      }
      final currentlyEditingText = splitString.last;
      // Only @, need user to give filter, so dont show.
      if (!currentlyEditingText.startsWith(MentionText.flag) || (currentlyEditingText.length < 2)) {
        portalController.hide();
        return;
      }
      userMentionStore.search(currentlyEditingText.substring(1));
      if (userMentionStore.userResults.isNotEmpty) {
          portalController.show();
        }
    });
  }

  @observable
  ObservableList<CommentModel> _comments = ObservableList.of([]);

  @observable
  bool showAllComments = true;

  @readonly
  bool _isCommentSending = false;

  @computed
  int get commentsLength => _comments.length;

  @observable
  String currentEditingComment = "";

  @computed
  bool get canAddComment => currentEditingComment.isNotEmpty;

  @computed
  List<CommentModel> get visibleComments {
    if (showAllComments) {
      return _comments;
    }
    if (_comments.length <= _visibleCommentsLength) {
      return _comments;
    }
    return _comments.sublist(_comments.length - _visibleCommentsLength);
  }

  set reload(void Function() func) {
    _reloadPostData = func;
  }

  @action
  void updateCommments(List<CommentModel> comments) {
    _comments = ObservableList.of(comments);
    showAllComments = _comments.length <= _visibleCommentsLength;
  }

  Future<void> deleteComment(int commentId) async {
    final deleteCommentProvider = DeleteCommentApiProvider(commentId: commentId);
    final res = await Mew.pc.read(deleteCommentProvider.future);
    if (res) {
      _comments.removeWhere((element) => element.id == commentId);
    }
  }

  Future<bool> addComment({required int postId}) async {
    _isCommentSending = true;
    final addCommentProvider = AddCommentApiProvider(comment: currentEditingComment, postId: postId);
    final res = await Mew.pc.read(addCommentProvider.future);
    if (res) {
      _isCommentSending = false;
      currentEditingComment = "";
      _reloadPostData?.call();
    }
    return res;
  }
}
