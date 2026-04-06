import 'dart:developer';

import 'package:bookia_store/core/constant/app_images.dart';
import 'package:bookia_store/core/functions/vaildations.dart';
import 'package:bookia_store/core/routes/navigations.dart';
import 'package:bookia_store/core/routes/routes.dart';
import 'package:bookia_store/core/styles/text_styles.dart';
import 'package:bookia_store/core/widgets/custom_svg_picture.dart';
import 'package:bookia_store/core/widgets/custom_text_form_field.dart';
import 'package:bookia_store/core/widgets/dialogs.dart';
import 'package:bookia_store/core/widgets/main_utton.dart';
import 'package:bookia_store/core/widgets/my_body_view.dart';
import 'package:bookia_store/core/widgets/password_text_form_field.dart';
import 'package:bookia_store/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia_store/feature/auth/presentation/widgets/auth_footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthLoadedState) {
          pop(context);
          pushReplacement(context, Routes.mainApp);
        } else if (state is AuthFailureState) {
          pop(context);

          showErrorDialog(context, state.massage);
        } else if (state is AuthLoadingState) {
          showLoadingDialog(context);
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
        body: _registerBody(context),
        bottomNavigationBar: AuthFooter(
          label: 'Already have an account?',
          buttonLabel: 'Sign in',
          onTap: () {
            pushReplacement(context, Routes.login);
          },
        ),
      ),
    );
  }

  Widget _registerBody(BuildContext context) {
    var cubit = context.read<AuthCubit>();
    return MyBodyView(
      child: SingleChildScrollView(
        child: Form(
          autovalidateMode: AutovalidateMode.onUnfocus,
          key: cubit.formKey,
          child: Column(
            children: [
              Text(
                'Hello! Register to get started',
                style: TextStyles.headline,
              ),
              Gap(32),
              CustomTextFormField(
                hintText: 'Full Name',
                controller: cubit.nameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please enter your name';
                  } else {
                    return null;
                  }
                },
              ),
              Gap(16),
              CustomTextFormField(
                hintText: 'Email',
                controller: cubit.emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'please enter your email';
                  } else if (!isEmailValid(value)) {
                    return 'please enter a valid email';
                  } else {
                    return null;
                  }
                },
              ),
              Gap(16),
              PasswordTextFormField(
                hintText: 'Password',
                controller: cubit.passwordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "please enter a valid password";
                  } else {
                    return null;
                  }
                },
              ),
              Gap(16),
              PasswordTextFormField(
                hintText: 'Confirm Password',
                controller: cubit.passwordConfirmationController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "please enter a valid password";
                  } else if (value != cubit.passwordController.text) {
                    return "passwords do not match";
                  } else {
                    return null;
                  }
                },
              ),
              Gap(30),
              MainButton(
                text: 'Register',
                onPressed: () {
                  if (cubit.formKey.currentState!.validate()) {
                    cubit.register();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
