import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mewtwo/auth/routes/routes.dart';
import 'package:mewtwo/safety/api/api.dart';
import 'package:mewtwo/safety/routes/routes.dart';

part 'routes.g.dart';

@TypedGoRoute<HomeScreenRoute>(
    path: '/',
    routes: [
      ...SafetyRoutes.typedRoutes
    ]
)
class HomeScreenRoute extends GoRouteData {
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