// //
// import 'dart:developer';

// import 'package:dio/dio.dart';
// import 'package:bookia_store/core/service/Apis/apis.dart';
// import 'package:bookia_store/core/service/Apis/dio_provider.dart';
// import 'package:bookia_store/feature/auth/data/models/auth_params.dart';
// import 'package:bookia_store/feature/check_password/data/models/respoone_otp/respoone_otp.dart';

// class OtpRepository {
//   static Future<ResponseOtp?> sendOtp(AuthParams params) async {
//     try {
//       final response = await DioProvider.post(
//         endPoint: Apis.changeForgetPassword,
//         data: params.toJson(),
//       );

//       final responseData = response.data;
//       if (responseData is Map<String, dynamic>) {
//         return ResponseOtp.fromJson(responseData);
//       }

//       log('Unexpected response format: ${responseData.runtimeType}');
//       return null;
//     } on DioException  catch (e, stackTrace) {
//       log('OTP request failed: ${e.message}', stackTrace: stackTrace);
//       if (e.response?.data is Map<String, dynamic>) {
//         return ResponseOtp.fromJson(e.response!.data as Map<String, dynamic>);
//       }
//       return null;
//     } catch (e, stackTrace) {
//       log('Unexpected error in OTP request: $e', stackTrace: stackTrace);
//       return null;
//     }
//   }
// }

import 'dart:developer';

import 'package:bookia_store/core/service/Apis/apis.dart';
import 'package:bookia_store/core/service/Apis/dio_provider.dart';
import 'package:bookia_store/feature/auth/data/models/auth_params.dart';
import 'package:bookia_store/feature/check_password/data/models/respoone_otp/respoone_otp.dart';

class OtpRepository {
  static Future<ResponseOtp?> sendOtp(AuthParams params) async {
    try {
      var response = await DioProvider.post(
        endPoint: Apis.changeForgetPassword,
        data: params.toJson(),
      );
      if (response.statusCode == 200) {
        var data = ResponseOtp.fromJson(response.data);

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
