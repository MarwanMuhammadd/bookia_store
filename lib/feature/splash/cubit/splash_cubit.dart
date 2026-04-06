import 'package:bookia_store/core/local/shared_pref.dart';
import 'package:bookia_store/feature/profile/data/repo/profile_repo.dart';
import 'package:bookia_store/feature/splash/cubit/splash_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashCubit extends Cubit<SplashStates> {
  SplashCubit() : super(SplashInitialState());

  Future<void> getInit() async {
    if (SharedPref.getToken().isEmpty) {
      emit(SplashErrorState());
      return;
    }
    var data = await ProfileRepo.getProfile();
    if (data != null) {
      emit(SplashSucessState());
    } else {
      emit(SplashErrorState());
    }
  }
}
