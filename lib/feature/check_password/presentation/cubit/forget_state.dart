part of 'forget_cubit.dart';

class ForgetState {}

final class ForgetInitial extends ForgetState {}

final class ForgetLoadingState extends ForgetState {}

final class ForgetLoadedState extends ForgetState {}

final class ForgetErrorState extends ForgetState {
  final String message;
  ForgetErrorState(this.message);
}
