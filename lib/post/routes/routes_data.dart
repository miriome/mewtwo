part of 'routes.dart';


class PostDetailsRoute extends GoRouteData {
  final int postId;
  final bool isFromApp;
  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey; // TODO: Make this better.
  PostDetailsRoute({required this.postId, this.isFromApp = false});
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return PostDetailsPage(postId: postId, isFromApp: isFromApp);
  }
}

class NewPostRoute extends GoRouteData {
  
  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey; // TODO: Make this better.
  
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return NewPostPage();
  }
}