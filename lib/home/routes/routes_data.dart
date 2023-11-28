part of 'routes.dart';

class HomePageRoute extends GoRouteData {

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

class SearchPageRoute extends GoRouteData {

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SearchPage();
  }
}

class ProfilePageRoute extends GoRouteData {

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ProfilePage();
  }
}

class NotificationPageRoute extends GoRouteData {

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return NotificationPage();
  }
}