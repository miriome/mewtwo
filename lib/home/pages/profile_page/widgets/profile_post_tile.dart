import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:mewtwo/base/widgets/post_image.dart';
import 'package:mewtwo/base/widgets/shoppable_icon.dart';
import 'package:mewtwo/home/model/post_model.dart';
import 'package:mewtwo/post/pages/routes/routes.dart';
import 'package:mewtwo/routes/routes.dart';
import 'package:mewtwo/utils.dart';

class ProfilePostTile extends StatelessWidget {
  final PostModel post;
  const ProfilePostTile({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return GestureDetector(
        onTap: () => PostDetailsRoute(postId: post.id).push(context),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.25), offset: const Offset(0, 4), blurRadius: 4)]),
          child: ClipRRect(
            borderRadius: BorderRadiusDirectional.circular(4),
            child: Stack(
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        PostImage(imageUrl: post.image),
                        if (post.chat_enabled)
                      const PositionedDirectional(
                          bottom: 6,
                          start: 6,
                          child: ShoppableIcon(
                            size: 16,
                          )),
                      ],
                    ),
                    
                    cardFooter,
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget get cardFooter {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              post.my_like ? Icons.favorite : Icons.favorite_border,
              size: 12,
              color: const Color(0xFFFA897B),
            ),
            const SizedBox(
              width: 4,
            ),
            Text(
              NumberFormat.decimalPattern().format(post.likes),
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ));
  }
}
