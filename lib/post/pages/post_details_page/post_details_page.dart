import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:mewtwo/base/widgets/post_image.dart';
import 'package:mewtwo/home/model/post_model.dart';
import 'package:mewtwo/post/pages/post_details_page/post_details_page_store.dart';
import 'package:mewtwo/post/utils.dart';
import 'package:mewtwo/routes/routes.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:mewtwo/utils.dart';
import 'package:detectable_text_field/detectable_text_field.dart';

class PostDetailsPage extends StatelessWidget {
  final int postId;
  late final store = PostDetailsPageStore(postId: postId)..load();
  PostDetailsPage({Key? key, required this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Observer(builder: (context) {
        final post = store.post;
        if (post == null) {
          return Container();
        }
        return Scaffold(
          appBar: AppBar(
            title: Text(
              post.posted_by?.username ?? "",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Color(0xFF6EC6CA)),
            ),
          ),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: PostImage(imageUrl: post.image),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverToBoxAdapter(child: statsRow(post)),
              postInfo(post)
            ],
          ),
        );
      }),
    );
  }

  Widget statsRow(PostModel post) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          const Icon(
            Icons.favorite_outline,
            color: Color(0xFFFA897B),
          ),
          const SizedBox(
            width: 4,
          ),
          Text(
            NumberFormat.decimalPattern().format(post.likes),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
          ),
          const Spacer(),
          IconButton(
              iconSize: 30,
              onPressed: () {},
              icon: Image.asset(
                'assets/icons/measuring_tape.png',
                height: 35,
                width: 35,
              )),
          const SizedBox(width: 16),
          IconButton(
            onPressed: () {
              if (post.posted_by != null) {
                MainPlatform.goToChat(post.posted_by!);
              }
            },
            iconSize: 24,
            icon: const Icon(
              Icons.chat_bubble,
              color: Color(0xFFFFDD94),
              size: 24,
            ),
          ),
        ],
      ),
    );
  }

  Widget postInfo(PostModel post) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: MultiSliver(children: [
        SliverToBoxAdapter(
            child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(post.posted_by?.username ?? "",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                )),
            const SizedBox(
              width: 8,
            ),
            Text(
              timeago.format(DateTime.fromMillisecondsSinceEpoch((int.tryParse(post.created_at) ?? 0) * 1000)),
              style: const TextStyle(color: Color(0xFF7D7878), fontSize: 16),
            )
          ],
        )),
        const SliverToBoxAdapter(
          child: SizedBox(height: 4),
        ),
        Builder(builder: (context) {
          return DetectableText(
            text: TextUtils.replaceEmoji(post.caption),
            detectionRegExp: detectionRegExp()!,
            detectedStyle: TextStyle(
              fontSize: 16,
              color: Theme.of(context).primaryColor,
            ),
            basicStyle: const TextStyle(fontSize: 16, color: Color(0xFF7D7878)),
            onTap: (tappedText) {
              if (tappedText.startsWith("#")) {
                SearchPageRoute(initialSearchTerm: tappedText).go(context);
                return;
              }
            },
            lessStyle: TextStyle(fontSize: 16, color: Theme.of(context).primaryColor),
            moreStyle: TextStyle(fontSize: 16, color: Theme.of(context).primaryColor),
          );
        })
      ]),
    );
  }
}
