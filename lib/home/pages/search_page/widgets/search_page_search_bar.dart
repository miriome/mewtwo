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
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    widget.store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TapRegion(
      onTapOutside: (event) {
        widget.store.searchBarFocusNode.unfocus();
      },
      child: TextField(
        onChanged: (value) {
          widget.store.searchTerm = value;
        },
        controller: widget.store.textEditingController,
        focusNode: widget.store.searchBarFocusNode,
        maxLines: 1,
        decoration: InputDecoration(
            hintText: "Search for styles, clothes, or usernames...",
            hintStyle: const TextStyle(color: Color(0xFF7D7878)),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
      ),
    );
  }
}
