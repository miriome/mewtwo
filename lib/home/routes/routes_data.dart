part of 'routes.dart';

class HomePageRoute extends GoRouteData {

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

class NewPostRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    // Currently routes to native new post screen.
    return Container();
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