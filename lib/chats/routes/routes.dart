import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:mewtwo/chats/pages/chat_list_page/chat_list_page.dart';

part 'routes_data.dart';

class ChatRoutes {
  static const List<TypedGoRoute> typedRoutes = [TypedGoRoute<ChatListPageRoute>(
        path: 'chat-list',
      ), 
      ];
      
}