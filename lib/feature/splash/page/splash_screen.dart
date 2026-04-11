import 'package:bookia_store/core/constant/app_images.dart';
import 'package:bookia_store/core/routes/navigations.dart';
import 'package:bookia_store/core/routes/routes.dart';
import 'package:bookia_store/core/styles/text_styles.dart';
import 'package:bookia_store/core/widgets/custom_svg_picture.dart';
import 'package:bookia_store/feature/splash/cubit/splash_cubit.dart';
import 'package:bookia_store/feature/splash/cubit/splash_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(const Duration(seconds: 3), () {
  //     if (mounted) {
  //       String token = SharedPref.getToken();
  //       if (token.isNotEmpty) {
  //         pushReplacement(context, Routes.mainApp);
  //       } else {
  //         pushReplacement(context, Routes.welcome);
  //       }
  //     }
  //   });
  // }
  @override
  Widget build(BuildContext context) {
    return BlocListener<SplashCubit, SplashStates>(
      listener: (context, state) {
        if (state is SplashSucessState) {
          pushReplacement(context, Routes.welcome);
        } else if (state is SplashErrorState) {
          pushReplacement(context, Routes.mainApp);
        }
      },
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomSvgPicture(path: AppImages.logoSvg, width: 250),
              Gap(10), // SizeBox(height: 10),
              Text('Order Your Book Now!', style: TextStyles.subtitle2),
            ],
          ),
        ),
      ),
    );
  }
}
