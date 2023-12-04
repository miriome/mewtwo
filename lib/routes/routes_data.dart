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
  final String? initialSearchTerm;

  SearchPageRoute({this.initialSearchTerm});

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return SearchPage(
      initialSearchTerm: initialSearchTerm ?? '',);
  }
}

class ProfilePageRoute extends GoRouteData {
  final int? userId;
  ProfilePageRoute({this.userId});
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ProfilePage(userId: userId,);
  }
}

class NotificationPageRoute extends GoRouteData {

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return NotificationPage();
  }
}