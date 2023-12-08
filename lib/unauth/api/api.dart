import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';
part 'api.g.dart';

final dio = Dio();

@riverpod
Future<void> loginApi(LoginApiRef ref, {required String username, required String password}) async {
  // Using package:http, we fetch a random activity from the Bored API.
  final response = await dio.get('https://dart.dev');
  
}