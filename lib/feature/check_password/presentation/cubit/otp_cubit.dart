import 'dart:developer';

import 'package:bookia_store/feature/auth/data/models/auth_params.dart';
import 'package:bookia_store/feature/check_password/data/repos/otp.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'otp_states.dart';

class OtpCubit extends Cubit<OtpState> {
  OtpCubit() : super(OtpCubitInitial());
  final formKey = GlobalKey<FormState>();
  final otpController = TextEditingController();

  Future<void> otpVerify(String email) async {
    log('💬 otpVerify called for $email with OTP: ${otpController.text}');
    emit(OtpLoadingState());
    var params = AuthParams(email: email, verifyCode: otpController.text);
    log('📤 Sending OTP request...');
    var respone = await OtpRepository.sendOtp(params);
    log('📥 Response: $respone');
    if (respone != null) {
      log('✅ OTP verified successfully');
      emit(OtpLoadedState());
    } else {
      log('❌ OTP verification failed');
      emit(OtpFailureState('Failed to verify OTP'));
    }
  }

  @override
  Future<void> close() {
    otpController.dispose();
    return super.close();
  }
}
