import 'package:flutter/material.dart';
import 'package:mewtwo/home/pages/home_page/home_page.dart';

class Home extends StatelessWidget {
   Home({Key? key}) : super(key: key);

  final tabs = [
    HomePage(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home)),
        BottomNavigationBarItem(icon: Icon(Icons.search)),
        BottomNavigationBarItem(icon: Icon(Icons.add_circle)),
        BottomNavigationBarItem(icon: Icon(Icons.notifications)),
        BottomNavigationBarItem(icon: Icon(Icons.person)),
      ]),
    );
  }
}
