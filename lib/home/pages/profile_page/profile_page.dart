import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mewtwo/home/pages/profile_page/profile_page_store.dart';
import 'package:mewtwo/home/pages/profile_page/widgets/profile_post_tile.dart';
import 'package:mewtwo/home/routes/routes.dart';
import 'package:mewtwo/utils.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    MainPlatform.addMethodCallhandler((call) async {
      if (call.method == "viewWillAppear" && call.arguments is String) {
        if (call.arguments == ProfilePageRoute().location) {
          store.load();
        }
      }
    });
    super.initState();
  }

  final store = ProfilePageStore()..load();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
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
                      style:
                          GoogleFonts.roboto(
                            height: 1,
                            fontSize: 20, fontWeight: FontWeight.w700, color: const Color(0xFF7D7878)),
                    ),
                    Text(
                      store.user?.username ?? "",
                      style:
                          GoogleFonts.roboto(
                            height: 1,
                            fontSize: 20, fontWeight: FontWeight.w700, color: const Color(0xFF6EC6CA)),
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
                  MainPlatform.showOwnProfileActions(store.user!);
                }
              },
              iconSize: 30,
              icon: const Icon(
                Icons.menu,
                color: Color(0xFF8474A1),
              )),
        ),
      ],
      automaticallyImplyLeading: false,
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
        )
      ],
    );
  }
}
