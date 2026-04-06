part of 'auth_cubit.dart';

class AuthState {}

final class AuthCubitInitial extends AuthState {}

final class AuthLoadingState extends AuthState {}

final class AuthLoadedState extends AuthState {}

final class AuthFailureState extends AuthState {
  final String massage;
  AuthFailureState(this.massage);
}
