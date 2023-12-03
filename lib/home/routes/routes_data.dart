part of 'routes.dart';


class OtherProfilePageRoute extends GoRouteData {
  final int userId;
  OtherProfilePageRoute({required this.userId});
  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey; // TODO: Make this better.
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ProfilePage(userId: userId,);
  }
}
