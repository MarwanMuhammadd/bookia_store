import 'dart:developer';

import 'package:bookia_store/core/constant/app_images.dart';
import 'package:bookia_store/core/routes/app_router.dart';
import 'package:bookia_store/core/routes/navigations.dart';
import 'package:bookia_store/core/routes/routes.dart';
import 'package:bookia_store/core/styles/colors.dart';
import 'package:bookia_store/core/styles/text_styles.dart';
import 'package:bookia_store/core/widgets/custom_svg_picture.dart';
import 'package:bookia_store/core/widgets/custom_text_form_field.dart';
import 'package:bookia_store/core/widgets/dialogs.dart';
import 'package:bookia_store/core/widgets/main_utton.dart';
import 'package:bookia_store/core/widgets/my_body_view.dart';
import 'package:bookia_store/core/widgets/password_text_form_field.dart';
import 'package:bookia_store/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia_store/feature/auth/presentation/login_register/widgets/social_login.dart';
import 'package:bookia_store/feature/auth/presentation/widgets/auth_footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoadedState) {
          pop(context);
          pushReplacement(context, Routes.mainApp);
        } else if (state is AuthLoadingState) {
          showLoadingDialog(context);
        } else if (state is AuthFailureState) {
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
                child: CustomSvgPicture(path: AppImages.backSvg),
              ),
            ],
          ),
        ),
        body: _loginBody(context),
        bottomNavigationBar: AuthFooter(
          label: 'Don\'t have an account?',
          buttonLabel: 'Sign Up',
          onTap: () {
            pushReplacement(context, Routes.register);
          },
        ),
      ),
    );
  }

  MyBodyView _loginBody(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    return MyBodyView(
      child: SingleChildScrollView(
        child: Form(
          key: cubit.formKey,
          autovalidateMode: AutovalidateMode.onUnfocus,
          child: Column(
            children: [
              Text(
                'Welcome back! Glad to see you, Again!',
                style: TextStyles.headline,
              ),
              Gap(32),
              CustomTextFormField(
                hintText: 'Enter your email',
                controller: cubit.emailController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter your email';
                  } else {
                    return null;
                  }
                },
              ),
              Gap(16),
              PasswordTextFormField(
                hintText: 'Enter your password',
                controller: cubit.passwordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "please enter a valid password";
                  } else {
                    return null;
                  }
                },
              ),
              Gap(10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {
                      pushReplacement(
                        context,
                        Routes.forgotPassword,
                        extra: cubit.emailController.text.trim(),
                      );
                    },
                    child: Text(
                      'Forgot Password?',
                      style: TextStyles.caption1.copyWith(
                        color: AppColors.darkGreyColor,
                      ),
                    ),
                  ),
                ],
              ),
              Gap(30),
              MainButton(
                text: 'Login',
                onPressed: () {
                  if (cubit.formKey.currentState!.validate()) {
                    cubit.login();
                  }
                },
              ),
              Gap(30),
              SocialLogin(),
            ],
          ),
        ),
      ),
    );
  }
}
