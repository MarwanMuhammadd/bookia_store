import 'dart:developer';

import 'package:bookia_store/core/service/Apis/apis.dart';
import 'package:bookia_store/core/service/Apis/dio_provider.dart';
import 'package:bookia_store/feature/auth/data/models/auth_params.dart';
import 'package:bookia_store/feature/auth/presentation/forget_password/data/models/forget_password/forget_password.dart';

class ForgetPasswordAuth {
  static Future<ForgetPassword?> forgetPassword(AuthParams params) async {
    try {
      var response = await DioProvider.post(
        endPoint: Apis.forgetPassword,
        data: params.toJson(),
      );
      if (response.statusCode == 200) {
        return ForgetPassword.fromJson(response.data);
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
