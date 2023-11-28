import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:mewtwo/home/model/notification_model.dart';

class NotificationTile extends StatelessWidget {
  final NotificationModel notification;
const NotificationTile({ Key? key, required this.notification }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Row(children: [
      CircleAvatar(
                  radius: 20,
                  backgroundColor: const Color(0xFF6EC6CA),
                  foregroundImage:
                      notification.userData.photo_url == "https://miromie.com/uploads/"
                          ? null
                          : CachedNetworkImageProvider(
                              notification.userData.photo_url,
                            ),
                )
    ],);
  }
}