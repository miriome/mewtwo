import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mewtwo/home/pages/profile_page/profile_page_store.dart';
import 'package:mewtwo/home/pages/profile_page/widgets/profile_post_tile.dart';
import 'package:mewtwo/routes/routes.dart';
import 'package:mewtwo/safety/api/api.dart';
import 'package:mewtwo/safety/routes/routes.dart';
import 'package:mewtwo/utils.dart';
import 'package:mobx/mobx.dart';

class ProfilePage extends StatefulWidget {
  final int? userId;
  const ProfilePage({Key? key, this.userId}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final ProfilePageStore store = ProfilePageStore(widget.userId);
  @override
  void initState() {
    MainPlatform.addMethodCallhandler((call) async {
      if (call.method == "viewWillAppear" && call.arguments is String) {
        if (call.arguments == ProfilePageRoute().location) {
          store.load();
        }
      }
    });
    store.init().then((_) => store.load());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ReactionBuilder(
      builder: (context) {
        return reaction((_) => store.isLoading, (isLoading) {
          if (isLoading) {
            EasyLoading.show();
          } else {
            EasyLoading.dismiss();
          }
        });
      },
      child: Observer(builder: (context) {
        return Scaffold(
          appBar: appBar,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                measurements,
                const SizedBox(height: 14),
                relationStatistics,
                const SizedBox(height: 16),
                store.posts.isNotEmpty
                    ? Expanded(
                        child: RefreshIndicator(
                        onRefresh: () async {
                          store.load();
                        },
                        child: AlignedGridView.count(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          itemBuilder: (context, index) {
                            return ProfilePostTile(post: store.posts[index]);
                          },
                          itemCount: store.posts.length,
                        ),
                      ))
                    : Column(
                        children: [
                          TextButton(
                            onPressed: () {
                              MainPlatform.goToScreen(Screens.newPost);
                            },
                            child: const Text.rich(
                                TextSpan(style: TextStyle(fontSize: 16, color: Color(0xFF7D7878)), children: [
                              TextSpan(text: "You don’t have any posts yet.\n"),
                              TextSpan(
                                  text: "Create your first post now! :)",
                                  style: TextStyle(decoration: TextDecoration.underline))
                            ])),
                          )
                        ],
                      )
              ],
            ),
          ),
        );
      }),
    );
  }

  PreferredSizeWidget get appBar {
    return AppBar(
      title: Observer(builder: (context) {
        return store.user != null
            ? Row(mainAxisSize: MainAxisSize.min, children: [
                CircleAvatar(
                  radius: 25,
                  backgroundColor: const Color(0xFF6EC6CA),
                  foregroundImage:
                      store.user?.photo_url == "https://miromie.com/uploads/" || store.user?.photo_url == null
                          ? null
                          : CachedNetworkImageProvider(
                              store.user?.photo_url ?? "",
                            ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "asd",
                      style: GoogleFonts.roboto(
                          height: 1, fontSize: 20, fontWeight: FontWeight.w700, color: const Color(0xFF7D7878)),
                    ),
                    Text(
                      store.user?.username ?? "",
                      style: GoogleFonts.roboto(
                          height: 1, fontSize: 20, fontWeight: FontWeight.w700, color: const Color(0xFF6EC6CA)),
                    )
                  ],
                )
              ])
            : const CircularProgressIndicator();
      }),
      actions: [
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 8),
          child: IconButton(
              onPressed: () {
                if (store.user != null) {
                  if (store.isOwnProfile) {
                    MainPlatform.showOwnProfileActions(store.user!);
                  } else {
                    showOtherProfileOptions();
                  }
                }
              },
              iconSize: 30,
              icon: const Icon(
                Icons.menu,
                color: Color(0xFF8474A1),
              )),
        ),
      ],
      surfaceTintColor: Colors.white,
    );
  }

  Widget get measurements {
    // Change this to dynamic lmao
    const units = "cm";
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Height: ${store.user?.height ?? "-"} $units",
          style: GoogleFonts.roboto(color: const Color(0xFF7D7878), fontSize: 14),
        ),
        Text(
          "Bust: ${store.user?.bust ?? "-"} $units | Waist: ${store.user?.waist ?? "-"} $units | Hips: ${store.user?.hips ?? "-"} $units",
          style: GoogleFonts.roboto(color: const Color(0xFF7D7878), fontSize: 14),
        )
      ],
    );
  }

  Widget get relationStatistics {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text.rich(
            TextSpan(children: [
              TextSpan(text: "${store.followers}\n", style: const TextStyle(fontWeight: FontWeight.w700)),
              const TextSpan(
                text: "Followers",
              )
            ]),
            style: GoogleFonts.roboto(color: const Color(0xFF7D7878), fontSize: 14),
            textAlign: TextAlign.center),
        const SizedBox(
          width: 24,
        ),
        Text.rich(
          TextSpan(children: [
            TextSpan(text: "${store.likes}\n", style: const TextStyle(fontWeight: FontWeight.w700)),
            const TextSpan(text: "Likes")
          ]),
          style: GoogleFonts.roboto(
            color: const Color(0xFF7D7878),
            fontSize: 14,
          ),
          textAlign: TextAlign.center,
        ),
        if (!store.isOwnProfile) ...[
          const SizedBox(
            width: 24,
          ),
          GestureDetector(
            onTap: () => store.toggleUserFollow(),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xFF8474A1), width: (store.isFollowingUser) ? 0 : 2),
                  color: (store.isFollowingUser) ? const Color(0xFF8474A1) : Colors.white,
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                (store.isFollowingUser) ? "Following" : "Follow",
                style: TextStyle(
                    color: (store.isFollowingUser) ? Colors.white : const Color(0xFF8474A1),
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          const SizedBox(
            width: 24,
          ),
          GestureDetector(
            onTap: () {
              MainPlatform.goToChat(store.user!);
            },
            child: const Icon(
              Icons.chat_bubble,
              color: Color(0xFFFFDD94),
              size: 24,
            ),
          )
        ]
      ],
    );
  }

  void showOtherProfileOptions() {
    showCupertinoModalPopup<void>(
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
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(modalContext);
              ReportContentRoute(reportType: ReportType.user, typeId: store.user!.id.toString()).push(context);
            },
            child: const Text(
              'Report User',
              style: TextStyle(color: Color(0xFF7D7878)),
            ),
          ),
          CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () async {
              Navigator.pop(modalContext);
              _showBlockUserDialog(context);
            },
            child: const Text('Block User', style: TextStyle(color: Color(0xFF7D7878))),
          ),
        ],
      ),
    );
  }

  Future<void> _showBlockUserDialog(BuildContext parentContext) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Block User'),
          content: const Text('"Are you sure you want to block this user?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Approve', style: TextStyle(color: Colors.red)),
              onPressed: () async {
                Navigator.of(context).pop();
                final blocked = await store.blockUser();
                if (blocked) {
                  if (parentContext.mounted) {
                    Fluttertoast.showToast(msg: "You have successfully blocked ${store.user?.username ?? "the user"}", gravity: ToastGravity.CENTER);
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
}
