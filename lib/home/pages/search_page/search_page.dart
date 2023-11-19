import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:mewtwo/home/pages/search_page/search_page_store.dart';
import 'package:mewtwo/home/pages/search_page/widgets/seach_post_tile.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:mewtwo/home/pages/search_page/widgets/search_page_search_bar.dart';
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


  @override
  void initState() {
    MainPlatform.addMethodCallhandler((call) async {
      if (call.method == "modifyInitialSearchTerm" && call.arguments is String) {
        store.searchTerm = call.arguments;
      }
      
    });
    store.initReactions();
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
            child: CustomScrollView(
              slivers: [
                SliverPinnedHeader(
                    child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6),
                        child: SearchPageSearchBar(
                          store: store,
                        ))),
                SliverToBoxAdapter(
                    child: Padding(
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
                        final isCurrentStyleSelected = store.searchTerm == currentStyle;
                        return GestureDetector(
                          onTap: () {
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
    );
  }
}
