import 'dart:developer';

import 'package:bookia_store/core/local/shared_pref.dart';
import 'package:bookia_store/core/service/Apis/apis.dart';
import 'package:bookia_store/core/service/Apis/dio_provider.dart';
import 'package:bookia_store/feature/profile/data/model/profile_response/profile_response.dart';

class ProfileRepo {
  static Future<ProfileResponse?> getProfile() async {
    try {
      var response = await DioProvider.get(
        endPoint: Apis.profile,
        header: {"Authorization": "Bearer ${SharedPref.getToken()}"},
      );
      if (response.statusCode == 200) {
        var data = ProfileResponse.fromJson(response.data);
        SharedPref.setUserData(data.data);
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
