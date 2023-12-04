import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:mewtwo/base/pages/webview/webview.dart';
import 'package:mewtwo/base/widgets/post_image.dart';
import 'package:mewtwo/base/widgets/shoppable_icon.dart';
import 'package:mewtwo/home/model/comment_model.dart';
import 'package:mewtwo/home/model/post_model.dart';
import 'package:mewtwo/home/routes/routes.dart';
import 'package:mewtwo/post/pages/post_details_page/post_details_page_store.dart';
import 'package:mewtwo/post/pages/post_details_page/widgets/post_measurements.dart';
import 'package:mewtwo/safety/api/api.dart';
import 'package:mewtwo/safety/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mewtwo/post/utils.dart';
import 'package:mewtwo/routes/routes.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:mewtwo/utils.dart';
import 'package:detectable_text_field/detectable_text_field.dart';

class PostDetailsPage extends StatefulWidget {
  final int postId;

  const PostDetailsPage({Key? key, required this.postId}) : super(key: key);
  @override
  State<PostDetailsPage> createState() => _PostDetailsPageState();
}

class _PostDetailsPageState extends State<PostDetailsPage> {
  late final store = PostDetailsPageStore(postId: widget.postId)
    ..init()
    ..load();
  final TextEditingController commentController = TextEditingController();

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

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
              "${post.posted_by?.username ?? ""}'s post",
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Color(0xFF6EC6CA)),
            ),
          ),
          body: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: InteractiveViewer(
                  minScale: 1,
                  maxScale: 3,
                  child: GestureDetector(
                    onDoubleTap: () => store.togglePostLike(),
                    child: Stack(
                      children: [
                        PostImage(imageUrl: post.image),
                        if (post.chat_enabled)
                          const PositionedDirectional(
                              bottom: 8,
                              start: 8,
                              child: ShoppableIcon(
                                size: 24,
                              )),
                        if (post.posted_by != null && store.isMeasurementsVisible)
                          PositionedDirectional(
                              start: 0, end: 0, bottom: 12, child: PostMeasurements(user: post.posted_by!))
                      ],
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 16)),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                sliver: MultiSliver(children: [
                  SliverToBoxAdapter(child: statsRow(post)),
                  postInfo(post),
                  commentsList(),
                  const SliverToBoxAdapter(
                      child: SizedBox(
                    height: 8,
                  )),
                  writeComment
                ]),
              )
            ],
          ),
        );
      }),
    );
  }

  Widget statsRow(PostModel post) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            store.togglePostLike();
          },
          child: Icon(
            post.my_like ? Icons.favorite : Icons.favorite_outline,
            color: const Color(0xFFFA897B),
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          NumberFormat.decimalPattern().format(post.likes),
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () => store.isMeasurementsVisible = !store.isMeasurementsVisible,
          child: SvgPicture.asset(
            'assets/icons/measuring_tape.svg',
            height: 32,
            width: 32,
          ),
        ),
        if (post.chat_enabled) ...[
          const SizedBox(width: 16),
          IconButton(
            onPressed: () {
              if (store.isMyPost) {
                MainPlatform.goToScreen(Screens.chats);
                return;
              }
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
        ]
      ],
    );
  }

  Widget postInfo(PostModel post) {
    return MultiSliver(children: [
      SliverToBoxAdapter(
          child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () async {
              if (post.posted_by != null) {
                final sp = await SharedPreferences.getInstance();
                if (context.mounted) {
                  if (sp.containsKey("k_id") && sp.getInt("k_id") == post.posted_by!.id) {
                    ProfilePageRoute(userId: sp.getInt("k_id")).go(context);
                  } else {
                    OtherProfilePageRoute(userId: post.posted_by!.id).push(context);
                  }
                }
              }
            },
            child: Text(post.posted_by?.username ?? "",
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                )),
          ),
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
            final url = !tappedText.startsWith("https://") ? "https://$tappedText" : tappedText;

            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Webview(
                      url: url,
                    )));
          },
          lessStyle: TextStyle(fontSize: 16, color: Theme.of(context).primaryColor),
          moreStyle: TextStyle(fontSize: 16, color: Theme.of(context).primaryColor),
        );
      })
    ]);
  }

  Widget get writeComment {
    return SliverToBoxAdapter(
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: const TextStyle(fontSize: 14),
              controller: commentController,
              onChanged: (text) {
                store.currentEditingComment = text;
              },
              decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 8),
                  hintText: "Write a comment...",
                  hintStyle: const TextStyle(fontSize: 14, color: Color(0xFF7D7878)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: const Color(0xFFD9D9D9).withOpacity(0.45), width: 1))),
            ),
          ),
          IconButton.filled(
              onPressed: store.canAddComment
                  ? () {
                      store.addComment(postId: widget.postId).then((success) {
                        if (success) {
                          commentController.clear();
                        }
                      });
                    }
                  : null,
              disabledColor: Colors.black,
              constraints: const BoxConstraints(),
              iconSize: 28,
              padding: EdgeInsets.zero,
              icon: const Icon(
                Icons.arrow_upward,
                color: Colors.white,
                size: 24,
              ))
        ],
      ),
    );
  }

  Widget commentsList() {
    return MultiSliver(
      children: [
        if (!store.showAllComments)
          GestureDetector(
              onTap: () => store.showAllComments = true, child: Text("View all ${store.commentsLength} comments")),
        SliverList.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
            final comment = store.visibleComments[index];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    GestureDetector(
                      onTap: () {
                        OtherProfilePageRoute(userId: comment.commented_by.id).push(context);
                      },
                      child: Text(comment.commented_by.username,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Color(0xFF8474A1))),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(
                      timeago.format(DateTime.fromMillisecondsSinceEpoch((comment.created_timestamp) * 1000)),
                      style: const TextStyle(color: Color(0xFF7D7878), fontSize: 16),
                    )
                  ],
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        comment.comment,
                        style: const TextStyle(fontSize: 16, color: Color(0xFF7D7878)),
                        maxLines: 10,
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          showCommentOptions(context, comment: comment);
                        },
                        child: Icon(
                          Icons.more_horiz,
                          color: Theme.of(context).primaryColor,
                          size: 24,
                        ))
                  ],
                )
              ],
            );
          },
          itemCount: store.visibleComments.length,
        ),
      ],
    );
  }

  void showCommentOptions(BuildContext context, {required CommentModel comment}) async {
    final sp = await SharedPreferences.getInstance();
    int? myUserId;
    if (sp.containsKey("k_id")) {
      myUserId = sp.getInt("k_id");
    }
    if (myUserId == null) {
      return;
    }
    bool isMyComment = myUserId == comment.commented_by.id;
    if (context.mounted) {
      showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext modalContext) => CupertinoActionSheet(
          cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(modalContext);
            },
            child: const Text('Cancel'),
          ),
          actions: <CupertinoActionSheetAction>[
            CupertinoActionSheetAction(
              isDestructiveAction: true,
              onPressed: () {
                Navigator.pop(modalContext);
                if (isMyComment) {
                  store.deleteComment(comment.id);
                }
                ReportContentRoute(reportType: ReportType.comment, typeId: comment.id.toString()).push(context);
              },
              child: Text(
                '${isMyComment ? "Delete" : "Report"} Comment',
              ),
            ),
          ],
        ),
      );
    }
  }
}
