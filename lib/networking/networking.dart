import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const tokenKey = "flutterk_access_token";

class Networking {
  final dio = Dio();
  static Networking? _singleton;
  static Future<Networking> get instance async {
    if (_singleton != null) {
      return _singleton!;
    }
    final sp = await SharedPreferences.getInstance();
    String token = "";
      if (sp.containsKey("k_access_token")) {
        token = sp.getString("k_access_token") ?? "";  
      }
      
      final options = BaseOptions(
      baseUrl: "https://miromie.com/api/",
      headers: {
        'Authorization': "Bearer $token",
        'Content-Type': 'application/x-www-form-urlencoded'
      },
    );
    _singleton = Networking._(options);
    return _singleton!;
  }


  Networking._(BaseOptions options) {
    dio.options = options;
    
  }

  Future<Response> post({required String path, Map<String, String>? body}) async {
    return await dio.post(path, data: body);
  }
}

