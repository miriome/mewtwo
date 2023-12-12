import 'package:flutter/cupertino.dart';
import 'package:mewtwo/constants.dart';
import 'package:mewtwo/home/api/api.dart';
import 'package:mewtwo/home/model/comment_model.dart';
import 'package:mewtwo/home/model/post_model.dart';
import 'package:mewtwo/mew.dart';
import 'package:mewtwo/post/api/api.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'post_details_page_store.g.dart';

class PostDetailsPageStore extends _PostDetailsPageStore with _$PostDetailsPageStore {
  PostDetailsPageStore({required super.postId});
}

abstract class _PostDetailsPageStore with Store {
  final int postId;
  final int _visibleCommentsLength = 3;
  _PostDetailsPageStore({required this.postId});

  @observable
  int? _selfUserId;

  Future<void> init() async {
    final sp = await SharedPreferences.getInstance();
    if (sp.containsKey(Constants.kKeyId)) {
      _selfUserId = sp.getInt(Constants.kKeyId);
    }
  }

  @readonly
  bool _isLoading = false;

  @readonly
  PostModel? _post;

  @observable
  ObservableList<CommentModel> _comments = ObservableList.of([]);

  @observable
  bool showAllComments = true;

  @readonly
  bool _isCommentSending = false;


  @computed
  int get commentsLength => _comments.length;

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

  @computed
  bool get isMyPost => _post?.added_by == _selfUserId;

  @observable
  bool isMeasurementsVisible = false;

  @observable
  bool isShopableDescriptionVisible = false;

  @observable
  String currentEditingComment = "";

  @observable
  Matrix4 interactiveViewState = Matrix4.zero();

  @computed
  bool get canAddComment => currentEditingComment.isNotEmpty;
  
  Future<void> load() async {
    final getPostsProvider = GetPostDetailsApiProvider(postId: postId);

    final listener = Mew.pc.listen(getPostsProvider, (previous, next) {
      _isLoading = next.isLoading;
    });
    final res = await Mew.pc.read(getPostsProvider.future);
    if (res != null) {
      _post = res;
      _comments = ObservableList.of(res.comments ?? []);
      showAllComments = _comments.length <= _visibleCommentsLength;
      
    }
    listener.close();
    
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
      load();
      
    }
    return res;
  }

  @action
  Future<void> togglePostLike() async {
    final post = _post;
    if (post == null) {
      return;
    }
    
    final toggle = !post.my_like;
    
    final likePostProvider = LikePostApiProvider(postId: postId, setLikeTo: toggle);
    post.my_like = toggle;
    post.likes += toggle ? 1 : -1;

    await Mew.pc.read(likePostProvider.future);
  }

  @action
  Future<bool> deletePost() async {
    final deletePostProvider = DeletePostApiProvider(postId: postId);
    return await Mew.pc.read(deletePostProvider.future);
  }

  @action
  Future<bool> markPostSold() async {
    final markPostSoldProvider = MarkPostSoldApiProvider(postId: postId);
    return await Mew.pc.read(markPostSoldProvider.future);
  }
  
}