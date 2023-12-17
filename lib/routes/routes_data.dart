part of 'routes.dart';

class HomePageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

class FakeNewPostRoute extends GoRouteData {

  @override
  Widget build(BuildContext context, GoRouterState state) {
    // Used to route to another screen.
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


class NotificationPageRoute extends GoRouteData {
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return NotificationPage();
  }
}