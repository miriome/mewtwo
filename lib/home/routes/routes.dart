import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mewtwo/auth/routes/routes.dart';
import 'package:mewtwo/home/main_tab_bar.dart';
import 'package:mewtwo/home/pages/home_page/home_page.dart';
import 'package:mewtwo/home/pages/notification_page/notification_page.dart';
import 'package:mewtwo/home/pages/profile_page/profile_page.dart';
import 'package:mewtwo/home/pages/search_page/search_page.dart';
import 'package:mewtwo/safety/api/api.dart';
import 'package:mewtwo/safety/routes/routes.dart';
part 'routes_data.dart';
part 'routes.g.dart';

// Root Routes start ------------------------------------



@TypedGoRoute<MainRoute>(
    path: '/base',
    routes: [
      ...SafetyRoutes.typedRoutes,
    ]
)
class MainRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Container();
  }
}

@TypedGoRoute<UnauthorizedRoute>(
    path: '/unauth',
    routes: [
      ...AuthRoutes.typedRoutes
    ]
)
class UnauthorizedRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Container();
  }
}

// Root routes end ------------------------------------


// Main tab routes start ------------------------------------

@TypedStatefulShellRoute<MainTabShellRoute>(
  branches: [
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<HomePageRoute>(
        path: '/HomePage',
      )
      ],
    ),
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<SearchPageRoute>(
        path: '/SearchPage',
      )
      ],
    ),
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<NewPostRoute>(
        path: '/NewPost',
      )
      ],
    ),
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<NotificationPageRoute>(
        path: '/NotificationPage',
      )
      ],
    ),
    TypedStatefulShellBranch(
      routes: [
        TypedGoRoute<ProfilePageRoute>(
        path: '/ProfilePage',
      )
      ],
    ),
    
  ]
)
class MainTabShellRoute extends StatefulShellRouteData {
    const MainTabShellRoute();
  @override
  Widget builder(
    BuildContext context,
    GoRouterState state,
    StatefulNavigationShell navigationShell,
  ) {
    return MainTabBar(child: navigationShell);
    
  }
}
// Main tab routes end ------------------------------------