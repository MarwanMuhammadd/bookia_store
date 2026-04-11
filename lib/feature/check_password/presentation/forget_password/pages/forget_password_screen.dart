import 'dart:developer';

import 'package:bookia_store/core/constant/app_images.dart';
import 'package:bookia_store/core/routes/navigations.dart';
import 'package:bookia_store/core/routes/routes.dart';
import 'package:bookia_store/core/styles/colors.dart';
import 'package:bookia_store/core/styles/text_styles.dart';
import 'package:bookia_store/core/widgets/custom_svg_picture.dart';
import 'package:bookia_store/core/widgets/custom_text_form_field.dart';
import 'package:bookia_store/core/widgets/dialogs.dart';
import 'package:bookia_store/core/widgets/main_utton.dart';
import 'package:bookia_store/core/widgets/my_body_view.dart';
import 'package:bookia_store/feature/check_password/presentation/cubit/forget_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    // Pre-fill the email controller with the passed email
    context.read<ForgetCubit>().emailController.text = email;
    return BlocListener<ForgetCubit, ForgetState>(
      listener: (context, state) {
        if (state is ForgetLoadedState) {
          pop(context);
          pushTo(
            context,
            Routes.otpVerification,
            extra: context.read<ForgetCubit>().emailController.text,
          );
        } else if (state is ForgetLoadingState) {
          showLoadingDialog(context);
        } else if (state is ForgetErrorState) {
          pop(context);
          showErrorDialog(context, state.message);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              GestureDetector(
                onTap: () => pop(context),
                child: CustomSvgPicture(path: AppImages.backSvg),
              ),
            ],
          ),
        ),
        body: forgetPassword(context),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Remember Password? ',
                style: TextStyles.caption1.copyWith(
                  color: AppColors.darkGreyColor,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Login',
                  style: TextStyles.caption1.copyWith(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  MyBodyView forgetPassword(BuildContext context) {
    var cubit = context.read<ForgetCubit>();

    return MyBodyView(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Forgot Password?', style: TextStyles.headline),
            Gap(10),
            Text(
              'Don\'t worry! It occurs. Please enter the email address linked with your account.',
              style: TextStyles.body.copyWith(color: AppColors.darkGreyColor),
            ),
            Gap(32),
            Form(
              key: cubit.formKey,
              child: CustomTextFormField(
                hintText: 'Enter your email',
                controller: cubit.emailController,
              ),
            ),
            Gap(40),
            MainButton(
              text: 'Send Code',
              onPressed: () {
                if (cubit.formKey.currentState!.validate()) {
                  cubit.forgetPassword();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
