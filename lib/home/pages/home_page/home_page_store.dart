import 'package:mewtwo/home/api/api.dart';
import 'package:mewtwo/home/model/post_model.dart';
import 'package:mewtwo/mew.dart';
import 'package:mobx/mobx.dart';

part 'home_page_store.g.dart';

class HomePageStore extends _HomePageStore with _$HomePageStore {}

abstract class _HomePageStore with Store {

  _HomePageStore() {
    loadPosts();
  }
  
  @observable
  int currentPage = 0;

  @readonly
  bool _isLoading = false;

  @readonly
  ObservableList<PostModel> _posts = ObservableList.of([]);

  @action
  Future<void> loadPosts() async {
    final getPostsProvider = GetPostsApiProvider(pageIndex: currentPage);
    
    final listener = Mew.pc.listen(getPostsProvider, (previous, next) { 
      _isLoading = next.isLoading;
    });
    _posts = ObservableList.of(await Mew.pc.read(getPostsProvider.future));
    listener.close();  
  }
}