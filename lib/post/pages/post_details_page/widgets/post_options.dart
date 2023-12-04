import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mewtwo/post/pages/post_details_page/post_details_page_store.dart';
import 'package:mewtwo/routes/routes.dart';
import 'package:mewtwo/safety/api/api.dart';
import 'package:mewtwo/safety/routes/routes.dart';
import 'package:mewtwo/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PostOptions {
  static Future<void> show(BuildContext context, {required PostDetailsPageStore store}) async {
    final sp = await SharedPreferences.getInstance();
    int? myUserId;
    if (sp.containsKey("k_id")) {
      myUserId = sp.getInt("k_id");
    }
    if (myUserId == null) {
      return;
    }
    final post = store.post;
    if (post == null) {
      return;
    }
    bool isMyPost = myUserId == post.added_by;

    if (context.mounted) {
      showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext modalContext) {
          final List<CupertinoActionSheetAction> actions = [];
          if (!isMyPost) {
            actions.add(CupertinoActionSheetAction(
              isDestructiveAction: true,
              onPressed: () {
                Navigator.pop(modalContext);
                ReportContentRoute(reportType: ReportType.post, typeId: post.id.toString()).push(context);
              },
              child: const Text(
                'Report post',
              ),
            ));
          } else {
            actions.add(CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(modalContext);
                MainPlatform.goToEditPost(post);
              },
              child: const Text(
                'Edit post',
                style: TextStyle(color: Color(0xFF7D7878)),
              ),
            ));
            actions.add(CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(modalContext);
                ReportContentRoute(reportType: ReportType.post, typeId: post.id.toString()).push(context);
              },
              child: const Text(
                'Mark as sold',
                style: TextStyle(color: Color(0xFF7D7878))
              ),
            ));
            actions.add(CupertinoActionSheetAction(
              isDestructiveAction: true,
              onPressed: () {
                Navigator.pop(modalContext);
                ReportContentRoute(reportType: ReportType.post, typeId: post.id.toString()).push(context);
              },
              child: const Text(
                'Delete post',
              ),
            ));
          }
          return CupertinoActionSheet(
            cancelButton: CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(modalContext);
              },
              child: const Text('Cancel'),
            ),
            actions: actions,
          );
        },
      );
    }
    
  }
  
}