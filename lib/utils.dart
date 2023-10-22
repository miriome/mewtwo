import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:logger/logger.dart';




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

enum Screens { forgetPassword }

// TODO: remove this when not needed or refactor into something better.
class MainPlatform {
  static const platform = MethodChannel('MainChannel');

  static Future<void> goToScreen(Screens screen) async {
    try {
      await platform.invokeMethod('goToScreen', {"screen": screen.name});
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
  
  final Logger _logger = Logger();
  void d(String msg) {
    _logger.d(msg);
  }
}
