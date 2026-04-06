import 'package:bookia_store/feature/auth/data/models/auth_params.dart';
import 'package:bookia_store/feature/auth/data/repos/auth_repo.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthCubitInitial());
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordConfirmationController = TextEditingController();

  Future<void> login() async {
    emit(AuthLoadingState());
    var params = AuthParams(
      email: emailController.text,
      password: passwordController.text,
    );
    var respone = await AuthRepo.login(params);
    if (respone != null) {
      emit(AuthLoadedState());
    } else {
      emit(AuthFailureState('Failed to login'));
    }
  }

  Future<void> register() async {
    emit(AuthLoadingState());
    var params = AuthParams(
      email: emailController.text,
      name: nameController.text,
      password: passwordController.text,
      passwordConfirmation: passwordConfirmationController.text,
    );
    var response = await AuthRepo.register(params);
    if (response != null) {
      emit(AuthLoadedState());
    } else {
      emit(AuthFailureState('Failed to register'));
    }
  }
}
