import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mewtwo/auth/routes/routes.dart';
import 'package:mewtwo/home/pages/home_page/home_page.dart';
import 'package:mewtwo/safety/api/api.dart';
import 'package:mewtwo/safety/routes/routes.dart';
part 'routes_data.dart';
part 'routes.g.dart';

// Root Routes start ------------------------------------

@TypedGoRoute<MainRoute>(
    path: '/',
    routes: [
      ...SafetyRoutes.typedRoutes,
      ...HomeRoutes.typedRoutes
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

class HomeRoutes {
  static const List<TypedGoRoute> typedRoutes = [TypedGoRoute<HomePageRoute>(
        path: 'HomePage',
      )];
}
