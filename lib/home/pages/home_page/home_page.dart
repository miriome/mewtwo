import 'package:flutter/material.dart';
import 'package:mewtwo/base/widgets/miromie_title.dart';
import 'package:mewtwo/home/pages/home_page/home_page_store.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mewtwo/home/pages/home_page/widgets/home_post_tile.dart';
import 'package:mewtwo/mew.dart';
import 'package:mewtwo/routes/routes.dart';
import 'package:mewtwo/utils.dart';
import 'package:visibility_detector/visibility_detector.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const int _pageTabIndex = 0;
  final store = HomePageStore();
  @override
  void initState() {
    MainPlatform.addMethodCallhandler((call) async {
      if (call.method == "viewWillAppear") {
        store.loadPosts();
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ValueKey(HomePageRoute().location),
      onVisibilityChanged: (info) {
        if (info.visibleFraction == 1) {
          store.loadPosts();
        }
      },
      child: Observer(builder: (context) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: appBar,
            body: Container(
              color: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: RefreshIndicator(
                onRefresh: () => store.loadPosts(),
                child: AlignedGridView.count(
                  controller: Mew.tabPrimaryScrollControllers[_pageTabIndex],
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  itemCount: store.posts.length,
                  itemBuilder: (context, index) {
                    return HomePostTile(
                      onUserTap: (userId) {},
                      post: store.posts[index],
                      onLikeToggle: (postId) => store.togglePostLike(postId: postId),
                    );
                  },
                ),
              ),
            ));
      }),
    );
  }

  PreferredSizeWidget get appBar {
    return AppBar(
      elevation: 0,
      surfaceTintColor: Colors.white,
      leading: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsetsDirectional.only(start: 16),
        child: const MiromieTitle(fontSize: 28),
      ),
      leadingWidth: 150,
      actions: [
        GestureDetector(
          onTap: () => MainPlatform.goToScreen(Screens.likedPosts),
          child: const Icon(
            Icons.favorite,
            color: Color(0xFFFA897B),
            size: 28,
          ),
        ),
        const SizedBox(width: 16),
        GestureDetector(
          onTap: () => MainPlatform.goToScreen(Screens.chats),
          child: const Icon(
            Icons.chat_bubble,
            color: Color(0xFFFFDD94),
            size: 28,
          ),
        ),
        const SizedBox(
          width: 24,
        )
      ],
    );
  }
}
