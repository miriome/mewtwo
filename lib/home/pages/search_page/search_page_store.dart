import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
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
    _loadSelfUserData();
  }
  @observable
  String searchTerm = "";

  @readonly
  int _currentPage = 0;

  @readonly
  bool _isLoading = false;

  @readonly
  UserModel? _selfUserModel;

  @readonly
  ObservableList<PostModel> _postResults = ObservableList.of([]);

  @readonly
  ObservableList<UserModel> _userResults = ObservableList.of([]);

  @computed
  List<String> get selfStyles {
    final styles = _selfUserModel?.styles.split(",") ?? [];
    styles.insert(0, "All");
    return styles;
  }

  final List<ReactionDisposer> d = [];

  Timer? _searchTimer;

  void initReactions() {
    d.add(reaction((_) => searchTerm, (_) {
      if (selfStyles.contains(searchTerm)) {
        search();
      }
      _searchTimer?.cancel();
      _searchTimer = Timer(const Duration(seconds: 1, milliseconds: 2), () {
        search();
      });
    }));
  }

  void dispose() {
    for (var disposer in d) {
      disposer();
    }
  }


  @action
  Future<void> _loadSelfUserData() async {
    final sp = await SharedPreferences.getInstance();
    int? selfUserId;
    if (sp.containsKey("k_id")) {
      selfUserId = sp.getInt("k_id");
    }
    if (selfUserId == null) {
      return;
    }
    final userInfoApiProvider = GetUserInfoApiProvider(userId: selfUserId);
    final res = await Mew.pc.read(userInfoApiProvider.future);
    if (res != null) {
      _selfUserModel = res;
    }
  }

  @action
  Future<void> search() async {
    final searchApiProvider = SearchApiProvider(pageIndex: _currentPage, keyword: searchTerm);

    final listener = Mew.pc.listen(searchApiProvider, (previous, next) {
      _isLoading = next.isLoading;
    });
    final res = await Mew.pc.read(searchApiProvider.future);
    if (res != null) {
      _postResults = ObservableList.of(res.postData ?? []);
      _userResults = ObservableList.of(res.userData ?? []);
    }
    listener.close();
  }
}
