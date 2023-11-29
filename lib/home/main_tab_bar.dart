import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


class MainTabBar extends StatelessWidget {
  
  final StatefulNavigationShell child;
  const MainTabBar({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
          currentIndex: child.currentIndex,
          selectedIconTheme: const IconThemeData(color: Color(0xFF8474A1), size: 35),
          unselectedIconTheme: const IconThemeData(color: Color(0xFF8474A1), size: 35),
          onTap: (index) {
            child.goBranch(
              index,
              // A common pattern when using bottom navigation bars is to support
              // navigating to the initial location when tapping the item that is
              // already active. This example demonstrates how to support this behavior,
              // using the initialLocation parameter of goBranch.
              initialLocation: index == child.currentIndex,
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
