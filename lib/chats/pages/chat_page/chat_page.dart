import 'package:dartx/dartx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mewtwo/base/image/cached_network_image_provider.dart';
import 'package:mewtwo/base/stores/current_user_store.dart';
import 'package:mewtwo/chats/pages/chat_page/providers.dart';
import 'package:mewtwo/home/api/api.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:mewtwo/profile/routes/routes.dart';
import 'package:mewtwo/routes/routes.dart';
import 'package:mewtwo/utils.dart';

class ChatPage extends StatelessWidget {
  final int targetId;
  const ChatPage({Key? key, required this.targetId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: Consumer(
        builder: (context, ref, child) {
          final messages = ref.watch(MessageHistoryProvider(targetId: targetId));
          final currentUser = ref.watch(currentUserStoreProvider);
          final currentUserObj =
              types.User(id: (currentUser.user?.id ?? 0).toString(), imageUrl: currentUser.user?.photo_url);
          switch (messages) {
            case AsyncData(:final value):
              {
                return Chat(
                  theme: DefaultChatTheme(
                      inputTextDecoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
                        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(24))
                      ),
                      userAvatarImageBackgroundColor: Theme.of(context).primaryColor,
                      inputBackgroundColor: Colors.white,
                      inputTextStyle: const TextStyle(color: Colors.black),
                      inputTextColor: Colors.black),
                  messages: value,
                  disableImageGallery: true,
                  onSendPressed: (text) {},
                  onAvatarTap: (user) {
                    OtherProfilePageRoute(userId: Utility.parseInt(user.id)).push(context);
                  },
                  user: currentUserObj,
                  showUserAvatars: true,
                );
              }
            case AsyncError(:final error):
              return Text(error.toString());
            default:
              return const Center(child: CircularProgressIndicator());
          }

          // return switch (messages) {
          //   // Display all the messages in a scrollable list view.
          //   AsyncData(:final value)
          //   ListView.builder(
          //       // Show messages from bottom to top
          //       reverse: true,
          //       itemCount: value.length,
          //       itemBuilder: (context, index) {
          //         final message = value[index];
          //         return Text(message.message);
          //       },
          //     ),
          //   AsyncError(:final error) => Text(error.toString()),
          //   _ => const CircularProgressIndicator(),
          // };
        },
      ),
    );
  }

  PreferredSizeWidget buildAppBar() {
    return AppBar(
      title: Consumer(builder: (context, ref, child) {
        final targetInfo = ref.watch(GetUserInfoApiProvider(userId: targetId));

        return targetInfo.when(
            data: (data) {
              if (data == null) {
                return const SizedBox.shrink();
              }
              return Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: const Color(0xFF6EC6CA),
                    foregroundImage: data.photo_url == "https://miromie.com/uploads/"
                        ? null
                        : BBCachedNetworkImageProvider(
                            data.photo_url,
                          ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        data.username,
                        style: GoogleFonts.roboto(
                            height: 1,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Theme.of(context).primaryColor),
                      ),
                      Text(data.name)
                    ],
                  ),
                ],
              );
            },
            error: (e, s) => const SizedBox.shrink(),
            loading: () => const CircularProgressIndicator());
      }),
    );
  }
}
