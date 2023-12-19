part of 'routes.dart';


class PostDetailsRoute extends GoRouteData {
  final int postId;
  final bool isFromApp;
  PostDetailsRoute({required this.postId, this.isFromApp = false});
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return PostDetailsPage(postId: postId, isFromApp: isFromApp);
  }
}

class CreatePostRoute extends GoRouteData {
  
  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey; // TODO: Make this better.
  
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CreatePostPage();
  }
}

class EditPostRoute extends GoRouteData {
  final int postId;
  EditPostRoute({required this.postId});
  static final GlobalKey<NavigatorState> $parentNavigatorKey = rootNavigatorKey; // TODO: Make this better.
  
  @override
  Widget build(BuildContext context, GoRouterState state) {
    return EditPostPage(postId: postId);
  }
}