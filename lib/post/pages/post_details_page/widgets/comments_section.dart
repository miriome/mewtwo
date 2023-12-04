import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mewtwo/home/model/comment_model.dart';
import 'package:mewtwo/home/routes/routes.dart';
import 'package:mewtwo/post/pages/post_details_page/post_details_page_store.dart';
import 'package:mewtwo/routes/routes.dart';
import 'package:mewtwo/safety/api/api.dart';
import 'package:mewtwo/safety/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sliver_tools/sliver_tools.dart';
import 'package:timeago/timeago.dart' as timeago;

class CommentsSection extends StatefulWidget {
  final PostDetailsPageStore store;
  final int postId;
const CommentsSection({ Key? key, required this.store, required this.postId }) : super(key: key);

  @override
  State<CommentsSection> createState() => _CommentsSectionState();
}

class _CommentsSectionState extends State<CommentsSection> {
  final TextEditingController commentController = TextEditingController();
  @override
  Widget build(BuildContext context){
    return MultiSliver(children: [
      commentsList(),
                  const SliverToBoxAdapter(
                      child: SizedBox(
                    height: 8,
                  )),
                  writeComment
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
                widget.store.currentEditingComment = text;
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
              onPressed: widget.store.canAddComment
                  ? () {
                      widget.store.addComment(postId: widget.postId).then((success) {
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
        if (!widget.store.showAllComments)
          GestureDetector(
              onTap: () => widget.store.showAllComments = true, child: Text("View all ${widget.store.commentsLength} comments")),
        SliverList.separated(
          separatorBuilder: (context, index) => const SizedBox(height: 8),
          itemBuilder: (context, index) {
            final comment = widget.store.visibleComments[index];
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
          itemCount: widget.store.visibleComments.length,
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
                  widget.store.deleteComment(comment.id);
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