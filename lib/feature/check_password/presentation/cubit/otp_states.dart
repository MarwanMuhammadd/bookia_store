part of 'otp_cubit.dart';

class OtpState {}

final class OtpCubitInitial extends OtpState {}

final class OtpLoadingState extends OtpState {}

final class OtpLoadedState extends OtpState {}

final class OtpFailureState extends OtpState {
  final String massage;
  OtpFailureState(this.massage);
}
