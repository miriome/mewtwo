import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mewtwo/routes/routes.dart';
import 'package:mewtwo/main.dart';
import 'package:mewtwo/utils.dart';


class MainTabBar extends StatefulWidget {
  
  final StatefulNavigationShell child;
  const MainTabBar({Key? key, required this.child}) : super(key: key);

  @override
  State<MainTabBar> createState() => _MainTabBarState();
}

class _MainTabBarState extends State<MainTabBar> {
  @override
  void initState() {
    MainPlatform.addMethodCallhandler((call) async {
      switch(call.method) {
        case "goToMyProfile":
          ProfilePageRoute().go(context);
          break;
        case 'goToSearch':
        if (call.arguments is String) {
          SearchPageRoute(initialSearchTerm: call.arguments).go(context);
        } else {
          SearchPageRoute().go(context);
        }
          break;
      }
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
          currentIndex: widget.child.currentIndex,
          selectedIconTheme: const IconThemeData(color: Color(0xFF8474A1), size: 35),
          unselectedIconTheme: const IconThemeData(color: Color(0xFF8474A1), size: 35),
          onTap: (index) {
            if (index == 2) {
              MainPlatform.goToScreen(Screens.newPost);
              return;
            } 
            widget.child.goBranch(
              index,
            );
            
          },
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items:  [
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
                activeIcon: Image.asset('assets/icons/search_filled.png', height: 35, width: 35,)),
            const BottomNavigationBarItem(label: "", icon: Icon(Icons.add_circle)),
            const BottomNavigationBarItem(
                label: "", icon: Icon(Icons.notifications_outlined), activeIcon: Icon(Icons.notifications)),
            const BottomNavigationBarItem(label: "", icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person)),
          ]),
    );
  }
}
