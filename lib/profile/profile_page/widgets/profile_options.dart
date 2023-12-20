import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mewtwo/base/stores/current_user_store.dart';
import 'package:mewtwo/constants.dart';
import 'package:mewtwo/mew.dart';
import 'package:mewtwo/profile/profile_page/profile_page_store.dart';
import 'package:mewtwo/profile/routes/routes.dart';
import 'package:mewtwo/routes/routes.dart';
import 'package:mewtwo/safety/api/api.dart';
import 'package:mewtwo/safety/routes/routes.dart';
import 'package:mewtwo/unauth/routes/routes.dart';
import 'package:mewtwo/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileOptions {
  static Future<void> showOwnProfileOptions(BuildContext context, {required ProfilePageStore store}) async {
    if (context.mounted) {
      showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext modalContext) {
          final List<CupertinoActionSheetAction> actions = [];
          actions.add(
            CupertinoActionSheetAction(
              onPressed: () {
                Navigator.pop(modalContext);
                _shareProfile(store);
              },
              child: const Text(
                'Share Profile',
                style: TextStyle(color: Color(0xFF7D7878)),
              ),
            ),
          );
          actions.add(CupertinoActionSheetAction(
            onPressed: () async {
              Navigator.pop(modalContext);
              await EditMeasurementsRoute().push(context);
              store.load();
            },
            child: const Text('Edit measurements', style: TextStyle(color: Color(0xFF7D7878))),
          ));

          actions.add(CupertinoActionSheetAction(
            onPressed: () async {
              Navigator.pop(modalContext);
              await EditProfileRoute().push(context);
              store.load();
            },
            child: const Text(
              'Edit profile',
              style: TextStyle(color: Color(0xFF7D7878)),
            ),
          ));

          actions.add(CupertinoActionSheetAction(
            onPressed: () async {
              Navigator.pop(modalContext);
              await EditStylesRoute().push(context);
              Mew.pc.read(currentUserStoreProvider).load();
              store.load();
            },
            child: const Text('Edit style preferences', style: TextStyle(color: Color(0xFF7D7878))),
          ));

          actions.add(CupertinoActionSheetAction(
            onPressed: () async {
              Navigator.pop(modalContext);
              final sp = await SharedPreferences.getInstance();
              sp.remove(Constants.kKeyToken);
              sp.remove(Constants.kKeyId);
              if (context.mounted) {
                LoginRoute().go(context);
              }
            },
            child: const Text('Log out', style: TextStyle(color: Color(0xFF7D7878))),
          ));

          actions.add(CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(modalContext);
              MainPlatform.deleteAccount();
            },
            child: const Text(
              'Delete account permanently',
            ),
          ));

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

  static Future<void> showOtherProfileOptions(BuildContext context, {required ProfilePageStore store}) {
    return showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext modalContext) => CupertinoActionSheet(
        cancelButton: CupertinoActionSheetAction(
          onPressed: () {
            Navigator.pop(modalContext);
          },
          child: const Text('Cancel', style: TextStyle(color: Color(0xFF7D7878))),
        ),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(modalContext);
              _shareProfile(store);
            },
            child: const Text(
              'Share Profile',
              style: TextStyle(color: Color(0xFF7D7878)),
            ),
          ),
          CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(modalContext);
              ReportContentRoute(reportType: ReportType.user, typeId: store.user!.id.toString()).push(context);
            },
            child: const Text(
              'Report User',
              ),
            ),
          CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () async {
              Navigator.pop(modalContext);
              _showBlockUserDialog(context, store);
            },
            child: const Text('Block User'),
          ),
        ],
      ),
    );
  }

  static Future<void> _showBlockUserDialog(BuildContext parentContext, ProfilePageStore store) async {
    return showDialog<void>(
      context: parentContext,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Block User'),
          content: const Text('"Are you sure you want to block this user?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
            TextButton(
              child: const Text('Approve', style: TextStyle(color: Colors.red)),
              onPressed: () async {
                Navigator.of(dialogContext).pop();
                final blocked = await store.blockUser();
                if (blocked) {
                  if (parentContext.mounted) {
                    Fluttertoast.showToast(
                        msg: "You have successfully blocked ${store.user?.username ?? "the user"}",
                        gravity: ToastGravity.CENTER);
                    HomePageRoute().go(parentContext);
                  }
                }
              },
            ),
          ],
        );
      },
    );
  }

  static Future<void> _shareProfile(ProfilePageStore store) async {
    final user = store.user;
    if (user == null) {
      return;
    }

    BranchUniversalObject buo = BranchUniversalObject(
      canonicalIdentifier: OtherProfilePageRoute(userId: user.id).location,
      title: 'Share profile',
      imageUrl: user.photo_url == "https://miromie.com/uploads/" ? '' : user.photo_url,
      contentDescription: "Share ${user.username}'s profile with others",
      keywords: ['Share', 'Profile', 'Miromie'],
      publiclyIndex: true,
      locallyIndex: true,
    );
    BranchLinkProperties lp = BranchLinkProperties(
      channel: 'app',
      feature: 'sharing',
      stage: 'new share',
    );

    BranchResponse response = await FlutterBranchSdk.showShareSheet(
        buo: buo, linkProperties: lp, messageText: "View this person's lookbook on miromie!");
    if (response.success) {
      Fluttertoast.showToast(msg: "Profile link copied", gravity: ToastGravity.CENTER);
    }
  }
}
