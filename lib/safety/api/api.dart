import 'package:dio/dio.dart';
import 'package:mewtwo/utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:mewtwo/networking/networking.dart';
import 'package:fluttertoast/fluttertoast.dart';

part 'api.g.dart';

enum ReportType { post, comment, user }

@riverpod
Future<bool> reportContentApi(ReportContentApiRef ref,
    {required ReportType reportType, required String typeId, required String reason}) async {
  
  await Future.delayed(Duration(seconds: 1));
  final body = {'report_type': reportType.name, 'type_id': typeId, 'reason': reason};
  try {
    final res = await Networking.instance.post(path: "report", body: body);
    Map response = res.data;
    return response['success'] ?? false;
  } on DioException catch (e ,s) {
    Fluttertoast.showToast(msg: e.message ?? "", gravity: ToastGravity.CENTER);
    Log.instance.e(e.toString(), stackTrace: s);
  } catch (e, s) {
    Log.instance.e(e.toString(), stackTrace: s);
  }
  return false;
}
