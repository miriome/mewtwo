import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:mewtwo/base/widgets/shoppable_icon.dart';
import 'package:mewtwo/home/model/post_model.dart';
import 'package:mewtwo/utils.dart';

class PostTile extends StatelessWidget {
  final PostModel post;
  final void Function(int) onLikeToggle;
  final void Function(int) onUserTap;
  const PostTile({Key? key, required this.post, required this.onLikeToggle, required this.onUserTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return GestureDetector(
        onDoubleTap: () => onLikeToggle(post.id),
        onTap: () => MainPlatform.goToPostDetails(post.id),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.25), offset: const Offset(0, 4), blurRadius: 4)]),
          child: ClipRRect(
            borderRadius:
                const BorderRadiusDirectional.only(bottomEnd: Radius.circular(4), bottomStart: Radius.circular(4)),
            child: Stack(
              children: [
                Column(
                  children: [
                    cardHeader,
                    AspectRatio(
                        aspectRatio: 184 / 242,
                        child: CachedNetworkImage(
                          imageUrl: post.image,
                          placeholder: (context, url) {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: Color(0xFF6EC6CA),),
                            );
                          },
                          fit: BoxFit.fill,
                          alignment: Alignment.topCenter,
                        ))
                  ],
                ),
                if (post.chat_enabled)
                const PositionedDirectional(
                  bottom: 6,
                  start: 6,
                  child: ShoppableIcon())
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget get cardHeader {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              if (post.posted_by != null) {
                MainPlatform.goToOtherUserProfile(post.posted_by!);
              }
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 12,
                  backgroundColor: const Color(0xFF6EC6CA),
                  foregroundImage: post.posted_by?.photo_url == "https://miromie.com/uploads/"
                      ? null
                      : CachedNetworkImageProvider(
                          post.posted_by?.photo_url ?? "",
                        ),
                ),
                const SizedBox(
                  width: 4,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      post.posted_by?.username ?? "",
                      style: const TextStyle(fontSize: 10, fontWeight: FontWeight.w700),
                    )
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          Row(
            children: [
              GestureDetector(
                onTap: () => onLikeToggle(post.id),
                child: Icon(
                  post.my_like ? Icons.favorite : Icons.favorite_border,
                  size: 12,
                  color: const Color(0xFFFA897B),
                ),
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
          )
        ],
      ),
    );
  }
}
