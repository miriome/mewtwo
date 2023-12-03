part of 'routes.dart';


class PostDetailsRoute extends GoRouteData {
  final int postId;
  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey; // TODO: Make this better.
  PostDetailsRoute({required this.postId});
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return PostDetailsPage(postId: postId,);
  }
}