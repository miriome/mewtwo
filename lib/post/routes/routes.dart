import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mewtwo/post/pages/upsert_post/create_post_page/create_post_page.dart';
import 'package:mewtwo/post/pages/upsert_post/edit_post_page/edit_post_page.dart';
import 'package:mewtwo/routes/route_utils.dart';

import 'package:mewtwo/post/pages/post_details_page/post_details_page.dart';

part 'routes_data.dart';

class PostRoutes {
  static const List<TypedGoRoute> typedRoutes = [TypedGoRoute<PostDetailsRoute>(
        path: 'postDetails',
      ), TypedGoRoute<CreatePostRoute>(
        path: 'new-post',
      ), TypedGoRoute<EditPostRoute>(
        path: 'edit-post',
      )];
      
}