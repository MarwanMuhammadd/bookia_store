import 'dart:developer';

import 'package:bookia_store/core/constant/app_images.dart';
import 'package:bookia_store/core/routes/navigations.dart';
import 'package:bookia_store/core/styles/colors.dart';
import 'package:bookia_store/core/styles/text_styles.dart';
import 'package:bookia_store/core/styles/themes.dart';
import 'package:bookia_store/core/widgets/custom_svg_picture.dart';
import 'package:bookia_store/core/widgets/dialogs.dart';
import 'package:bookia_store/core/widgets/main_utton.dart';
import 'package:bookia_store/core/widgets/my_body_view.dart';
import 'package:bookia_store/feature/check_password/presentation/cubit/otp_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:pinput/pinput.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    // Define Pin Themes based on the project's design system

    return BlocListener<OtpCubit, OtpState>(
      listener: (context, state) {
        if (state is OtpLoadingState) {
          showLoadingDialog(context);
        } else if (state is OtpLoadedState) {
          pop(context);
          log("success");
        } else if (state is OtpFailureState) {
          pop(context);
          showErrorDialog(context, state.massage);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              GestureDetector(
                onTap: () => pop(context),
                child: const CustomSvgPicture(path: AppImages.backSvg),
              ),
            ],
          ),
        ),
        body: MyBodyView(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'OTP Verification',
                  style: TextStyles.headline.copyWith(
                    fontWeight: FontWeight.w400,
                    height: 1.3,
                    letterSpacing: -0.3,
                  ),
                ),
                const Gap(10),
                Text(
                  'Enter the verification code we just sent on your email address.',
                  style: TextStyles.body.copyWith(
                    color: AppColors.greyColor,
                    height: 1.5,
                  ),
                ),
                const Gap(32),
                // Pinput Integration
                Center(
                  child: Form(
                    key: context.read<OtpCubit>().formKey,
                    child: Pinput(
                      validator: (value) {
                        if (value == null || value.length != 6) {
                          return 'Please enter a valid 6-digit code';
                        }
                        return null;
                      },
                      controller: context.read<OtpCubit>().otpController,
                      length: 6,
                      defaultPinTheme: AppThemes.defaultPinTheme,
                      focusedPinTheme: AppThemes.focusedPinTheme,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      onCompleted: (pin) {
                        // Logic deferred as requested
                      },
                    ),
                  ),
                ),
                const Gap(40),
                MainButton(
                  text: 'Verify',
                  onPressed: () {
                    if (context
                        .read<OtpCubit>()
                        .formKey
                        .currentState!
                        .validate()) {
                      context.read<OtpCubit>().otpVerify(email);
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Didn’t received code? ',
                      style: TextStyles.caption1.copyWith(
                        color: AppColors.accentDarkColor,
                        height: 1.4,
                      ),
                    ),
                    TextSpan(
                      text: 'Resend',
                      style: TextStyles.caption1.copyWith(
                        color: AppColors.primaryColor,
                        height: 1.4,
                      ),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
