import 'dart:developer';

import 'package:bookia_store/core/local/shared_pref.dart';
import 'package:bookia_store/core/service/Apis/apis.dart';
import 'package:bookia_store/core/service/Apis/dio_provider.dart';
import 'package:bookia_store/feature/auth/data/models/auth_params.dart';
import 'package:bookia_store/feature/auth/data/models/respone_auth/respone_auth.dart';

class AuthRepo {
  static Future<ResponeAuth?> login(AuthParams params) async {
    try {
      var response = await DioProvider.post(
        endPoint: Apis.login,
        data: params.toJson(),
      );
      if (response.statusCode == 200) {
        var data = ResponeAuth.fromJson(response.data);
        SharedPref.setToken(data.data?.token);
        SharedPref.setUserData(data.data?.user);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }

  static Future<ResponeAuth?> register(AuthParams params) async {
    try {
      var response = await DioProvider.post(
        endPoint: Apis.register,
        data: params.toJson(),
      );
      if (response.statusCode == 201) {
        var data = ResponeAuth.fromJson(response.data);
        SharedPref.setToken(data.data?.token);
        SharedPref.setUserData(data.data?.user);
        return data;
      } else {
        return null;
      }
    } on Exception catch (e) {
      log(e.toString());
      return null;
    }
  }
}
