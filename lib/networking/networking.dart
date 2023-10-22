import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class Networking {
  final dio = Dio();
  static Networking? _singleton;
  static Networking get instance {
    _singleton ??= Networking._();
    return _singleton!;
  }

  Networking._() {
    final options = BaseOptions(
      baseUrl: kDebugMode ? "http://localhost:8080/" :  "https://www.miromie.com/api/"
    );
    dio.options = options;
  }

  Future<Response> post({required String path, Map<String, String>? body}) async {
    return await dio.post(path, data: body);
  }
}

