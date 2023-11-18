import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mewtwo/home/model/get_posts_api_model.dart';
import 'package:mewtwo/home/model/post_model.dart';
import 'package:mewtwo/networking/networking.dart';
import 'package:mewtwo/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api.g.dart';


@riverpod
Future<GetPostsApiModel?> getPostsApi(
  GetPostsApiRef ref, {
  required int pageIndex,
}) async {
  final body = {'page_index': pageIndex.toString(), 'count': 50.toString()};
  try {
    final res = await (await Networking.instance).post(path: "post/getPost", body: body);
    Map<String, dynamic> response = res.data;
    if (response['status'] == false) {
      Fluttertoast.showToast(msg: response['message'] ?? "", gravity: ToastGravity.CENTER);
      return null;
    }
    
    return GetPostsApiModel.fromJson(response);
    
  } on DioException catch (e, s) {
    Fluttertoast.showToast(msg: e.message ?? "", gravity: ToastGravity.CENTER);
    Log.instance.e(e.toString(), stackTrace: s);
  } catch (e, s) {
    Log.instance.e(e.toString(), stackTrace: s);
  }
  return null;
}

@riverpod
Future<bool> likePostApi(LikePostApiRef ref, {
  required int postId, required bool setLikeTo
}) async {
final body = {'post_id': postId.toString(), 'is_like': setLikeTo ? 1 : 0};
  try {
    final res = await (await Networking.instance).post(path: "post/setLike", body: body);
    Map response = res.data;
    if (response['status'] == false) {
      Fluttertoast.showToast(msg: response['message'] ?? "", gravity: ToastGravity.CENTER);
      return false;
    }
    return true;
  } on DioException catch (e, s) {
    Fluttertoast.showToast(msg: e.message ?? "", gravity: ToastGravity.CENTER);
    Log.instance.e(e.toString(), stackTrace: s);
  } catch (e, s) {
    Log.instance.e(e.toString(), stackTrace: s);
  }
  return false;
}
