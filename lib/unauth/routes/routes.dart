import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mewtwo/unauth/pages/login/login_page.dart';
import 'package:mewtwo/unauth/pages/onboarding/create_profile_page/create_profile_page.dart';
import 'package:mewtwo/unauth/pages/onboarding/measurements_page/measurements_page.dart';
import 'package:mewtwo/unauth/pages/onboarding/select_pronouns_page.dart';
import 'package:mewtwo/unauth/pages/onboarding/select_style_page/select_style_page.dart';
import 'package:mewtwo/unauth/pages/onboarding/sign_up_page/sign_up_page.dart';

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
    ),
    TypedGoRoute<SignUpRoute>(
      path: 'sign-up',
    ),
    TypedGoRoute<CreateProfileRoute>(
      path: 'create-profile',
    ),
    TypedGoRoute<MeasurementsRoute>(
      path: 'measurements',
    )
  ];
}
