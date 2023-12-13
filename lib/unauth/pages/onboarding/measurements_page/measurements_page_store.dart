// @dart = 2.12
// ignore_for_file: import_of_legacy_library_into_null_safe
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:mewtwo/home/model/user_model.dart';
import 'package:mewtwo/mew.dart';
import 'package:mewtwo/unauth/api/api.dart';
import 'package:mobx/mobx.dart';

part 'measurements_page_store.g.dart';

class MeasurementsPageStore extends _MeasurementsPageStore with _$MeasurementsPageStore {}

abstract class _MeasurementsPageStore with Store {
  final formKey = GlobalKey<FormBuilderState>();

  @observable
  int? height;

  @observable
  int? bust;
  @observable
  int? waist;
  @observable
  int? hips;

  @observable
  bool hideFromNonFollowers = false;

  @action
  Future<bool> submit() async {
    formKey.currentState!.save();
    final editMeasurementsProvider = EditMeasurementsApiProvider(height: height, bust: bust, waist: waist, hips: hips, privacy: hideFromNonFollowers ? MeasurementPrivacy.following : MeasurementPrivacy.all);
    return await Mew.pc.read(editMeasurementsProvider.future);
  }
}
