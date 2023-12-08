import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mewtwo/unauth/pages/login/login_page.dart';
import 'package:mewtwo/unauth/pages/onboarding/select_pronouns_page.dart';
import 'package:mewtwo/unauth/pages/onboarding/select_style_page/select_style_page.dart';

part 'routes_data.dart';

class UnauthRoutes {
  static const List<TypedGoRoute> typedRoutes = [
    TypedGoRoute<LoginRoute>(
      path: 'login',
    ),
    TypedGoRoute<SelectPronounsRoute>(
      path: 'select-pronouns',
    ),
    TypedGoRoute<SelectStyleRoute>(
      path: 'select-style',
    )
  ];
}
