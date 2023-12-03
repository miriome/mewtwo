import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mewtwo/home/pages/profile_page/profile_page.dart';
import 'package:mewtwo/routes/route_utils.dart';

part 'routes_data.dart';


class HomeRoutes {
  static const List<TypedGoRoute> typedRoutes = [
    TypedGoRoute<OtherProfilePageRoute>(
      path: 'OtherProfilePage',
    )
  ];
}
