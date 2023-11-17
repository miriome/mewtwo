import 'package:flutter/material.dart';
import 'package:mewtwo/base/widgets/miromie_title.dart';
import 'package:mewtwo/home/pages/home_page/home_page_store.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mewtwo/home/pages/home_page/widgets/post_tile.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final store = HomePageStore();
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return SafeArea(
        child: Scaffold(
          appBar: appBar,
          body: Container(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: AlignedGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              itemCount: store.posts.length,
              itemBuilder: (context, index) {
                return PostTile(post: store.posts[index]);
              },
            ),
          ),
        ),
      );
    });
  }

  PreferredSizeWidget get appBar {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: Container(
        alignment: Alignment.centerLeft,
        padding: const EdgeInsetsDirectional.only(start: 16),
        child: const MiromieTitle(fontSize: 28),
      ),
      leadingWidth: 150,
      actions: [
        GestureDetector(
          child: Icon(
            Icons.favorite,
            color: Color(0xFFFA897B),
            size: 28,
          ),
        ),
        const SizedBox(width: 16),
        GestureDetector(
          child: Icon(
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
