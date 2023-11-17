import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mewtwo/home/model/post_model.dart';
import 'package:mewtwo/networking/networking.dart';
import 'package:mewtwo/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api.g.dart';


@riverpod
Future<List<PostModel>> getPostsApi(
  GetPostsApiRef ref, {
  required int pageIndex,
}) async {
  final body = {'page_index': pageIndex.toString(), 'count': 50.toString()};
  try {
    final res = await (await Networking.instance).post(path: "post/getPost", body: body);
    Map response = res.data;
    if (response['status'] == false) {
      Fluttertoast.showToast(msg: response['message'] ?? "", gravity: ToastGravity.CENTER);
      return [];
    }
    final data = response['data'] as List<dynamic>;
    return data.map((e) => PostModel.fromJson(e)).toList();
  } on DioException catch (e, s) {
    Fluttertoast.showToast(msg: e.message ?? "", gravity: ToastGravity.CENTER);
    Log.instance.e(e.toString(), stackTrace: s);
  } catch (e, s) {
    Log.instance.e(e.toString(), stackTrace: s);
  }
  return [];
}
