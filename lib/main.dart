import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mewtwo/routes/routes.dart';
import 'package:mewtwo/mew.dart';
import 'package:mewtwo/routes/route_utils.dart';

import 'package:mewtwo/utils.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';


void main() => runApp(ProviderScope(
      parent: Mew.pc,
      child: MyApp(),
    ));

class MyApp extends StatelessWidget {
  MyApp({super.key});
  
  final router = GoRouter(
          navigatorKey: rootNavigatorKey,
          routes: $appRoutes, initialLocation: HomePageRoute().location);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          surfaceTintColor: Colors.white,
          backgroundColor: Colors.white,
          foregroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Color(0xFF8474A1)
          )
        ),
          scaffoldBackgroundColor: const Color(0xFFFEFEFE),
          progressIndicatorTheme: const ProgressIndicatorThemeData(
            color: Color(0xFF6EC6CA)
          ),
          colorScheme: ColorScheme.fromSwatch(primarySwatch: MaterialColorGenerator.from(const Color(0xFF6EC6CA)), backgroundColor: Colors.white),
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or press Run > Flutter Hot Reload in a Flutter IDE). Notice that the
          // counter didn't reset back to zero; the application is not restarted.
          primarySwatch: MaterialColorGenerator.from(const Color(0xFF6EC6CA)),
          textTheme: GoogleFonts.robotoTextTheme()),
      builder: EasyLoading.init(),
      routerConfig: router,
    );
  }
}

