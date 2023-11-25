import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PostImage extends StatelessWidget {
  final String imageUrl;
  const PostImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return AspectRatio(
          aspectRatio: 184 / 242,
          child: CachedNetworkImage(
              // memCacheHeight: constraints.maxHeight.isInfinite ? 242 * 4 : constraints.maxHeight.ceil(),
              memCacheWidth: constraints.maxWidth.isInfinite ? 242 * 4 : constraints.maxWidth.ceil() * 2,
              imageUrl: imageUrl,
              placeholder: (context, url) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFF6EC6CA),
                  ),
                );
              },
              fit: BoxFit.cover,
              alignment: Alignment.topCenter,
            ));
    });
  }

}
