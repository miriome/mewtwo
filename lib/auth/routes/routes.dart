import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mewtwo/auth/login/login_page.dart';

part 'routes_data.dart';

class AuthRoutes {
  static const List<TypedGoRoute> typedRoutes = [TypedGoRoute<LoginRoute>(
        path: 'reportContent',
      )];
}