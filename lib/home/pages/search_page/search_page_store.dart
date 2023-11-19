
import 'dart:async';

import 'package:mewtwo/home/api/api.dart';
import 'package:mewtwo/home/model/post_model.dart';
import 'package:mewtwo/home/model/user_model.dart';
import 'package:mewtwo/mew.dart';
import 'package:mobx/mobx.dart';

part 'search_page_store.g.dart';

class SearchPageStore extends _SearchPageStore with _$SearchPageStore {}

abstract class _SearchPageStore with Store {

  _SearchPageStore() {
    search();
  }
  @observable
  String searchTerm = "";

  @readonly
  int _currentPage = 0;

  @readonly
  bool _isLoading = false;

  @readonly
  ObservableList<PostModel> _postResults = ObservableList.of([]);

  @readonly
  ObservableList<UserModel> _userResults = ObservableList.of([]);

  final List<ReactionDisposer> d = [];

  Timer? _searchTimer;

  void initReactions() {
    d.add(reaction((_) => searchTerm, (_) {
      _searchTimer?.cancel();
      _searchTimer = Timer(const Duration(seconds: 1, milliseconds: 2), () { 
        search();
      });
    }));
  }

  void dispose() {
    for (var disposer in d) {disposer();}
  }

  @action
  Future<void> search() async {
    final getPostsProvider = SearchApiProvider(pageIndex: _currentPage, keyword: searchTerm);

    final listener = Mew.pc.listen(getPostsProvider, (previous, next) {
      _isLoading = next.isLoading;
    });
    final res = await Mew.pc.read(getPostsProvider.future);
    if (res != null) {
      _postResults = ObservableList.of(res.postData ?? []);
      _userResults = ObservableList.of(res.userData ?? []);
    }
    listener.close();
  }
  
}