import 'package:dartx/dartx.dart';
import 'package:mewtwo/home/api/api.dart';
import 'package:mewtwo/home/model/post_model.dart';
import 'package:mewtwo/home/model/user_model.dart';
import 'package:mewtwo/mew.dart';
import 'package:mobx/mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'profile_page_store.g.dart';

class ProfilePageStore extends _ProfilePageStore with _$ProfilePageStore {}

abstract class _ProfilePageStore with Store {
  @readonly
  UserModel? _user;

  @computed
  int get likes => _user?.posts?.map((post) => post.likes).sum() ?? 0;

  @computed
  List<PostModel> get posts => _user?.posts ?? [];

  @computed
  int get followers => _user?.followers ?? 0;
  @action
  Future<void> load() async {
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
      _user = res;
    }
  }
}
