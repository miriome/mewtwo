import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_branch_sdk/flutter_branch_sdk.dart';
import 'package:go_router/go_router.dart';
import 'package:mewtwo/profile/routes/routes.dart';
import 'package:mewtwo/routes/routes.dart';
import 'package:mewtwo/unauth/routes/routes.dart';
import 'package:mewtwo/post/routes/routes.dart';
import 'package:mewtwo/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainTabBar extends StatefulWidget {
  final StatefulNavigationShell child;
  const MainTabBar({Key? key, required this.child}) : super(key: key);

  @override
  State<MainTabBar> createState() => _MainTabBarState();
}

class _MainTabBarState extends State<MainTabBar> {
  Future<void> _methodCall(MethodCall call) async {
    if (context.mounted) {
      switch (call.method) {
        case "goToMyProfile":
          ProfilePageRoute().go(context);
          break;
        case "goToHome":
          HomePageRoute().go(context);
        case "goToLogin":
        final sp = await SharedPreferences.getInstance();
        await sp.clear();
        if (context.mounted) {
                LoginRoute().go(context);
        }


        // LoginRoute().go(context);
        case 'goToSearch':
          if (call.arguments is String) {
            SearchPageRoute().goWithInitialSearchTerm(context, call.arguments.removePrefix("#"));
          } else {
            SearchPageRoute().go(context);
          }
          break;
        case 'goToPostDetails':
          if (call.arguments is int) {
            PostDetailsRoute(postId: call.arguments).pushReplacement(context);
          }
          break;
      }
    }
  }

  @override
  void initState() {
    MainPlatform.addMethodCallhandler(_methodCall);
    // Try to deeplink after logging in.
    FlutterBranchSdk.getLatestReferringParams().then((data) {
      if (data.containsKey("\$canonical_identifier")) {
        context.go(data["\$canonical_identifier"]);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    MainPlatform.removeMethodCallHandler(_methodCall);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(splashColor: Colors.transparent, highlightColor: Colors.transparent),
          child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: widget.child.currentIndex,
              selectedIconTheme: const IconThemeData(color: Color(0xFF8474A1), size: 35),
              unselectedIconTheme: const IconThemeData(color: Color(0xFF8474A1), size: 35),
              onTap: (index) {
                if (index == 2) {
                  CreatePostRoute().push(context);
                  return;
                }
                widget.child.goBranch(
                  index,
                );
              },
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                const BottomNavigationBarItem(
                  label: "",
                  activeIcon: Icon(Icons.home),
                  icon: Icon(Icons.home_outlined),
                ),
                BottomNavigationBarItem(
                    label: "",
                    icon: const Icon(
                      Icons.search_outlined,
                    ),
                    activeIcon: Image.asset(
                      'assets/icons/search_filled.png',
                      height: 35,
                      width: 35,
                    )),
                const BottomNavigationBarItem(label: "", icon: Icon(Icons.add_circle)),
                const BottomNavigationBarItem(
                    label: "", icon: Icon(Icons.notifications_outlined), activeIcon: Icon(Icons.notifications)),
                const BottomNavigationBarItem(
                    label: "", icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person)),
              ])),
    );
  }
}
