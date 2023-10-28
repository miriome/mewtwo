import 'package:dio/dio.dart' as DIO;
import 'package:flutter/foundation.dart';
import 'package:mewtwo/networking/hello_world.pbgrpc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:grpc/grpc.dart';

const tokenKey = "flutterk_access_token";

class Networking {
  final _channel = ClientChannel(
    'localhost',
    port: 50051,
    options: ChannelOptions(
      credentials: kDebugMode ? ChannelCredentials.secure() : ChannelCredentials.secure(),
      codecRegistry:
          CodecRegistry(codecs: const [GzipCodec(), IdentityCodec()]),
    ),
  );
  final dio = DIO.Dio();
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
      
      final options = DIO.BaseOptions(
      baseUrl: "https://miromie.com/api/",
      headers: {
        'Authorization': "Bearer $token",
        'Content-Type': 'application/x-www-form-urlencoded'
      },
    );
    _singleton = Networking._(options);
    return _singleton!;
  }


  Networking._(DIO.BaseOptions options) {
    dio.options = options;
    final client = HelloWorldServiceClient(_channel);
    
  }

  Future<DIO.Response> post({required String path, Map<String, String>? body}) async {
    return await dio.post(path, data: body);
  }
}

