import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';


class PostImage extends StatelessWidget {
  static const double maxWidth = 184 * 3;
  static const aspectRatio = 184 / 242;
  static const fit = BoxFit.cover;
  final String imageUrl;
  const PostImage({Key? key, required this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return AspectRatio(
          aspectRatio: aspectRatio,
          child: 
          imageUrl.startsWith("http") ? CachedNetworkImage(
              memCacheWidth: constraints.maxWidth.isInfinite ? maxWidth.toInt() : constraints.maxWidth.ceil() * 2,
              imageUrl: imageUrl,
              placeholder: (context, url) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFF6EC6CA),
                  ),
                );
              },
              fit: fit,
              alignment: Alignment.topCenter,
            ) : Image.file(File(imageUrl), fit: PostImage.fit,));
    });
  }

}
