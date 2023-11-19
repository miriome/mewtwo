import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mewtwo/home/pages/search_page/search_page_store.dart';
import 'package:mewtwo/home/pages/search_page/widgets/seach_post_tile.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mewtwo/utils.dart';
import 'package:mobx/mobx.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class SearchPage extends StatefulWidget {
  SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final store = SearchPageStore();
  final searchController = SearchController();
  final searchFocusNode = FocusNode();

  @override
  void initState() {
    searchController.addListener(() {
      store.searchTerm = searchController.text;
    });
    store.initReactions();
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();
    store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ReactionBuilder(
        builder: (context) {
          return autorun((_) {
            if (store.userResults.isNotEmpty && !searchController.isOpen) {
              searchController.openView();
            }
            if (store.userResults.isEmpty && searchController.isOpen) {
              searchController.closeView(store.searchTerm);
            }
          });
        },
        child: Observer(builder: (context) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 6),
              child: CustomScrollView(
                slivers: [
                  SliverPinnedHeader(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 6),
                          child: SearchAnchor(
                              viewConstraints: BoxConstraints(
                                  maxHeight: 120 + (store.userResults.length > 5 ? 5 : store.userResults.length) * 56),
                              searchController: searchController,
                              viewLeading: Container(),
                              isFullScreen: false,
                              builder: (context, controller) => TapRegion(
                                    onTapOutside: (event) {
                                      searchFocusNode.unfocus();
                                    },
                                    child: SearchBar(
                                      focusNode: searchFocusNode,
                                      controller: controller,
                                      hintText: "Search for styles, clothes, or usernames...",
                                      hintStyle: MaterialStateTextStyle.resolveWith(
                                        (states) {
                                          return const TextStyle(color: Color(0xFF7D7878));
                                        },
                                      ),
                                    ),
                                  ),
                              suggestionsBuilder: (context, controller) {
                                return store.userResults.map((user) {
                                  return GestureDetector(
                                    onTap: () => MainPlatform.goToOtherUserProfile(user),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
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
                                                  color: Color(
                                                    0xFF6EC6CA,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                user.username,
                                                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                });
                              }))),
                  SliverToBoxAdapter(
                      child: SizedBox(
                    height: 80,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                    ),
                  )),
                  SliverAlignedGrid.count(
                    itemBuilder: (context, index) {
                      return SearchPostTile(post: store.postResults[index]);
                    },
                    itemCount: store.postResults.length,
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  )
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
