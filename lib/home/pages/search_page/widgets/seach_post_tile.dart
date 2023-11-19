import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mewtwo/home/model/post_model.dart';
import 'package:mewtwo/utils.dart';

class SearchPostTile extends StatelessWidget {
  final PostModel post;
  
  const SearchPostTile({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => MainPlatform.goToPostDetails(post.id),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.25), offset: const Offset(0, 4), blurRadius: 4)]),
        child: ClipRRect(
          borderRadius:
              BorderRadius.circular(6),
          child: AspectRatio(
                  aspectRatio: 184 / 232,
                  child: CachedNetworkImage(
                    imageUrl: post.image,
                    width: 184,
                    fit: BoxFit.fill,
                    alignment: Alignment.topCenter,
                  ))
        ),
      ),
    );
  }
}
