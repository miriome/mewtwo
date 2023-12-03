import 'package:mewtwo/home/model/comment_model.dart';
import 'package:mewtwo/home/model/post_model.dart';
import 'package:mewtwo/mew.dart';
import 'package:mewtwo/post/api/api.dart';
import 'package:mobx/mobx.dart';

part 'post_details_page_store.g.dart';

class PostDetailsPageStore extends _PostDetailsPageStore with _$PostDetailsPageStore {
  PostDetailsPageStore({required super.postId});
}

abstract class _PostDetailsPageStore with Store {
  final int postId;
  _PostDetailsPageStore({required this.postId});

  @readonly
  bool _isLoading = false;

  @readonly
  PostModel? _post;

  @computed
  List<CommentModel> get comments => _post?.comments ?? [];
  
  Future<void> load() async {
    final getPostsProvider = GetPostDetailsApiProvider(postId: postId);

    final listener = Mew.pc.listen(getPostsProvider, (previous, next) {
      _isLoading = next.isLoading;
    });
    final res = await Mew.pc.read(getPostsProvider.future);
    if (res != null) {
      _post = res;
      // _posts = ObservableList.of(res.data);
      // _numberOfFollowers = res.followers;
    }
    listener.close();
    
  }
}