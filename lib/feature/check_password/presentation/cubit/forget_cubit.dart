import 'package:bookia_store/feature/auth/data/models/auth_params.dart';
import 'package:bookia_store/feature/check_password/data/repos/forget_password_auth.dart';
import 'package:bookia_store/feature/check_password/data/models/forget_password_params.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forget_state.dart';

class ForgetCubit extends Cubit<ForgetState> {
  ForgetCubit() : super(ForgetInitial());
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future<void> forgetPassword() async {
    emit(ForgetLoadingState());
    var params = ForgetPasswordParams(email: emailController.text);
    var response = await ForgetPasswordAuth.forgetPassword(params);
    if (response != null) {
      emit(ForgetLoadedState());
    } else {
      emit(ForgetErrorState("Failed to send reset password email"));
    }
  }
}
