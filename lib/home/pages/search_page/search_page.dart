

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mewtwo/home/pages/search_page/search_page_store.dart';
import 'package:mewtwo/home/pages/search_page/widgets/seach_post_tile.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mewtwo/home/pages/search_page/widgets/search_page_search_bar.dart';
import 'package:mewtwo/home/routes/routes.dart';
import 'package:mewtwo/post/pages/routes/routes.dart';
import 'package:mewtwo/routes/routes.dart';
import 'package:mewtwo/utils.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SearchPage extends StatefulWidget {
  final String initialSearchTerm;
  const SearchPage({Key? key, required this.initialSearchTerm}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final store = SearchPageStore();

  @override
  void didUpdateWidget(covariant SearchPage oldWidget) {
    store.searchTerm = widget.initialSearchTerm;
    super.didUpdateWidget(oldWidget);
  }
  @override
  void initState() {
    MainPlatform.addMethodCallhandler((call) async {
      if (call.method == "viewWillAppear") {
        store.loadSelfUserData();
      }
      if (call.method == "modifyInitialSearchTerm" && call.arguments is String) {
        store.searchTerm = call.arguments;
      }
    });
    store.initReactions();
    store.searchTerm = widget.initialSearchTerm;
    super.initState();
  }

  @override
  void dispose() {
    store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Observer(builder: (context) {
        return Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: GestureDetector(
              onTap: () => store.searchBarFocusNode.unfocus(),
            child: RefreshIndicator(
              onRefresh: () async {
                store.search();
              },
              child: CustomScrollView(
                slivers: [
                  SliverPinnedHeader(
                      child: Container(
                          color: Colors.white,
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: SearchPageSearchBar(
                            store: store,
                          ))),
                  SliverPinnedHeader(
                      child: Container(
                    color: Colors.white,
                    padding: EdgeInsets.symmetric(
                        vertical: 16,
                        horizontal: store.searchTerm == "All"
                            ? 16
                            : 16), // TODO: fix this. Force our listview to rebuild when searchTerm changes
                    child: SizedBox(
                      height: 20,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          final currentStyle = store.selfStyles[index];
                          bool isCurrentStyleSelected = false;
                          if (currentStyle == "All") {
                            isCurrentStyleSelected = store.searchTerm == "";
                          } else {
                            isCurrentStyleSelected = store.searchTerm == currentStyle;
                          }
                          return GestureDetector(
                            onTap: () {
                              if (currentStyle == "All") {
                                store.searchTerm = "";
                                return;
                              }
                              store.searchTerm = currentStyle;
                            },
                            child: Text(
                              currentStyle,
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  color: isCurrentStyleSelected
                                      ? const Color(
                                          0xFF6EC6CA,
                                        )
                                      : const Color(
                                          0xFF7D7878,
                                        )),
                            ),
                          );
                        },
                        itemCount: store.selfStyles.length,
                        separatorBuilder: (context, index) => const SizedBox(width: 20),
                      ),
                    ),
                  )),
                  SliverList.builder(
                    itemBuilder: (context, index) {
                    final user = store.userResults[index];
                    return GestureDetector(
                      onTap: () => OtherProfilePageRoute(userId: user.id).push(context),
                      behavior: HitTestBehavior.opaque,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            CircleAvatar(
                              radius: 24,
                              backgroundColor: const Color(0xFF6EC6CA),
                              foregroundImage: user.photo_url == "https://miromie.com/uploads/"
                                  ? null
                                  : CachedNetworkImageProvider(
                                      user.photo_url,
                                    ),
                            ),
                            const SizedBox(
                              width: 4,
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  user.name,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                Text(
                                  user.username,
                                  style: const TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                    color: Color(
                                      0xFF6EC6CA,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  }, itemCount: store.userResults.length,),
                  SliverAlignedGrid.count(
                    itemBuilder: (context, index) {
                      return SearchPostTile(post: store.postResults[index], onTap: () {
                        store.searchBarFocusNode.unfocus();
                        PostDetailsRoute(postId: store.postResults[index].id).push(context);
                      },);
                    },
                    itemCount: store.postResults.length,
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  )
                ],
              ),
            ),
          ),
        ));
      }),
    );
  }
}
