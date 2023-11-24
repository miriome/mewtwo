import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:mewtwo/home/model/post_model.dart';
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
        onTap: () => MainPlatform.goToPostDetails(post.id),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.25), offset: const Offset(0, 4), blurRadius: 4)]),
          child: ClipRRect(
            borderRadius:
                const BorderRadiusDirectional.only(bottomEnd: Radius.circular(4), bottomStart: Radius.circular(4)),
            child: Column(
              children: [
                AspectRatio(
                    aspectRatio: 184 / 242,
                    child: CachedNetworkImage(
                      imageUrl: post.image,
                      placeholder: (context, url) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Color(0xFF6EC6CA),
                          ),
                        );
                      },
                      fit: BoxFit.fitHeight,
                      alignment: Alignment.topCenter,
                    )),
                cardFooter,
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
