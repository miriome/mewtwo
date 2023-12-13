import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';
import 'package:mewtwo/home/model/post_model.dart';
import 'package:mewtwo/home/model/user_model.dart';

class MaterialColorGenerator {
  static MaterialColor from(Color color) {
    return MaterialColor(color.value, <int, Color>{
      50: color.withOpacity(0.1),
      100: color.withOpacity(0.2),
      200: color.withOpacity(0.3),
      300: color.withOpacity(0.4),
      400: color.withOpacity(0.5),
      500: color.withOpacity(0.6),
      600: color.withOpacity(0.7),
      700: color.withOpacity(0.8),
      800: color.withOpacity(0.9),
      900: color.withOpacity(1.0),
    });
  }
}

enum Screens { forgetPassword, likedPosts, chats, chat, newPost, editPost }

// TODO: remove this when not needed or refactor into something better.
class MainPlatform {
  static final platform = const MethodChannel('MainChannel')
    ..setMethodCallHandler((call) async {
      for (var element in _handlers) {
        await element.call(call);
      }
    });

  static final List<Future<void> Function(MethodCall)> _handlers = [];

  static void addMethodCallhandler(Future<dynamic> Function(MethodCall) handler) {
    _handlers.add(handler);
    platform.setMethodCallHandler((call) async {
      for (var element in _handlers) {
        element.call(call);
      }
      return;
    });
  }

  static void removeMethodCallHandler(Future<dynamic> Function(MethodCall) handler) {
    final result = _handlers.remove(handler);
    if (!result) {
      return;
    }
    platform.setMethodCallHandler((call) async {
      for (var element in _handlers) {
        element.call(call);
      }
      return;
    });
  }

  static Future<void> goToScreen(Screens screen) async {
    try {
      await platform.invokeMethod('goToScreen', {"screen": screen.name});
    } on PlatformException catch (e) {
      Log.instance.d(e.toString());
    }
  }

  static Future<void> deleteAccount() async {
    try {
      await platform.invokeMethod('deleteAccount');
    } on PlatformException catch (e) {
      Log.instance.d(e.toString());
    }
  }


  static Future<void> showIOSAlert(String message) async {
    try {
      await platform.invokeMethod('showAlert', {"message": message});
    } on PlatformException catch (e) {
      Log.instance.d(e.toString());
    }
  }


  static Future<void> goToChat(UserModel user) async {
    final userJson = jsonEncode(user.toJson());
    try {
      await platform
          .invokeMethod('goToScreen', {"screen": Screens.chat.name, "userModelJson": userJson});
    } on PlatformException catch (e) {
      Log.instance.d(e.toString());
    }
  }

  static Future<void> goToEditPost(PostModel post) async {
    final postJson = jsonEncode(post.toJson());
    try {
      await platform
          .invokeMethod('goToScreen', {"screen": Screens.editPost.name, "postModelJson": postJson});
    } on PlatformException catch (e) {
      Log.instance.d(e.toString());
    }
  }
  

  

  static Future<void> showOwnProfileActions(UserModel user) async {
    final userJson = jsonEncode(user.toJson());
    try {
      await platform
          .invokeMethod('showOwnProfileActions', {"userModelJson": userJson});
    } on PlatformException catch (e) {
      Log.instance.d(e.toString());
    }
  }

}

class Log {
  static Log? _singleton;
  Log._();

  static Log get instance {
    _singleton ??= Log._();
    return _singleton!;
  }

  final Logger _logger = Logger(
      printer: PrettyPrinter(
    colors: true, // Colorful log messages
    printEmojis: true, // Print an emoji for each log message
  ));
  void d(String msg) {
    _logger.d(msg);
  }

  void e(String msg, {required StackTrace stackTrace}) {
    _logger.e(msg, stackTrace: stackTrace);
  }
}

class Utility {
  static String parseStr(dynamic val) {
    if (val is String) {
      return val;
    }
    return "";
  }
  static bool parseBool(dynamic val) {
    if (val is int) {
      return val == 1;
    }
    if (val is bool) {
      return val;
    }
    if (val is String) {
      return int.tryParse(val) == 1 || val == "true"; 
    }
    return false;
  }

  static String int2Str(dynamic val) {
    if (val is int) {
      return val.toString();
    }
    return "";
  }

  static int bool2int(dynamic val) {
    if (val is int) {
      return val;
    }
    if (val is bool) {
      return val ? 1 : 0;
    }
    return 0;
  }

  static int parseInt(dynamic val, [int defaultVal = 0]) {
    if (val is int) {
      return val;
    }
    return int.tryParse(val) ?? defaultVal;
  }
}
