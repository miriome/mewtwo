import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mewtwo/home/pages/search_page/search_page_store.dart';
import 'package:mewtwo/utils.dart';
import 'package:mobx/mobx.dart';

class SearchPageSearchBar extends StatefulWidget {
  final SearchPageStore store;

  const SearchPageSearchBar({Key? key, required this.store}) : super(key: key);

  @override
  State<SearchPageSearchBar> createState() => _SearchPageSearchBarState();
}

class _SearchPageSearchBarState extends State<SearchPageSearchBar> {
  final searchController = SearchController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    searchController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ReactionBuilder(
      builder: (context) {
          return autorun((_) {
            searchController.text = widget.store.searchTerm;
            if (widget.store.userResults.isNotEmpty && !searchController.isOpen) {
              searchController.openView();
            }
            if (widget.store.userResults.isEmpty && searchController.isOpen) {
              searchController.closeView(widget.store.searchTerm);
            }
          });
        },
      child: Observer(
        builder: (context) {
          return SearchAnchor(
              viewConstraints: BoxConstraints(
                  maxHeight: 120 + (widget.store.userResults.length > 5 ? 5 : widget.store.userResults.length) * 56),
              searchController: searchController,
              viewLeading: Container(),
              isFullScreen: false,
              builder: (context, controller) => TapRegion(
                    onTapOutside: (event) {
                      widget.store.searchBarFocusNode.unfocus();
                    },
                    child: SearchBar(
                      focusNode: widget.store.searchBarFocusNode,
                      controller: controller,
                      onChanged: (value) => widget.store.searchTerm = value,
                      hintText: "Search for styles, clothes, or usernames...",
                      hintStyle: MaterialStateTextStyle.resolveWith(
                        (states) {
                          return const TextStyle(color: Color(0xFF7D7878));
                        },
                      ),
                    ),
                  ),
              suggestionsBuilder: (context, controller) {
                return widget.store.userResults.map((user) {
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
                });
              });
        }
      ),
    );
  }
}
