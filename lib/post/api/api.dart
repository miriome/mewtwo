import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mewtwo/home/model/post_model.dart';
import 'package:mewtwo/networking/networking.dart';
import 'package:mewtwo/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'api.g.dart';

@riverpod
Future<PostModel?> getPostDetailsApi(GetPostDetailsApiRef ref, {required int postId}) async {
  try {
    final res = await (await Networking.instance).get<List<int>>(path: "post/details/$postId", options: Options(responseType: ResponseType.bytes));
    
    List<int> response = res.data;
    final jsonRes = jsonDecode(utf8.decode(response));
    if (jsonRes['status'] == false) {
      Fluttertoast.showToast(msg: jsonRes['message'] ?? "", gravity: ToastGravity.CENTER);
      return null;
    }
    return PostModel.fromJson(jsonRes['data']);
  } on DioException catch (e, s) {
    Fluttertoast.showToast(msg: e.message ?? "", gravity: ToastGravity.CENTER);
    Log.instance.e(e.toString(), stackTrace: s);
  } catch (e, s) {
    Log.instance.e(e.toString(), stackTrace: s);
  }
  return null;
}

@riverpod
Future<bool> deleteCommentApi(DeleteCommentApiRef ref, {required int commentId}) async {
  final body = {'comment_id': commentId.toString()};
  try {
    final res = await (await Networking.instance).post(path: "post/deleteComment", body: body);
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

@riverpod
Future<bool> addCommentApi(AddCommentApiRef ref, {required int postId, required String comment}) async {
  final body = {'post_id': postId.toString(), 'comment': comment};
  try {
    final res = await (await Networking.instance).post(path: "post/comment", body: body);
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

@riverpod
Future<bool> deletePostApi(DeletePostApiRef ref, {required int postId}) async {
  try {
    final res = await (await Networking.instance).delete(path: "post/${postId.toString()}");
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

@riverpod
Future<bool> markPostSoldApi(MarkPostSoldApiRef ref, {required int postId}) async {
  
  final body = {'chat_enabled': 0.toString()};
  try {
    final res = await (await Networking.instance).post(path: "post/markSold/$postId", body: body);
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
