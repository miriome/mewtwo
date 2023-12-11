import 'package:dio/dio.dart';
import 'package:mewtwo/constants.dart';
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
      if (sp.containsKey(Constants.kKeyToken)) {
        token = sp.getString(Constants.kKeyToken) ?? "";  
      }
      
      final options = BaseOptions(
      baseUrl: "http://localhost:8080/api/",
      // baseUrl: "https://miromie.com/api/",
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

  Future<Response> post({required String path, Map<dynamic, dynamic>? body}) async {
    return await dio.post(path, data: body);
  }

  Future<Response> postForm({required String path, required FormData data}) async {
    return await dio.post(path, data: data);
  }

  Future<Response> get<T>({required String path, Map<String, dynamic>? params, Options? options}) async {
    return await dio.get<T>(path, queryParameters: params, options: options);
  }

  Future<Response> delete({required String path, Map<dynamic, dynamic>? body}) async {
    return await dio.delete(path, data: body);
  }
}

