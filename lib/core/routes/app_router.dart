import 'package:bookia_store/core/routes/routes.dart';
import 'package:bookia_store/feature/auth/presentation/cubit/auth_cubit.dart';
import 'package:bookia_store/feature/auth/presentation/forget_password/forget_cubit/forget_cubit.dart';
import 'package:bookia_store/feature/auth/presentation/forget_password/presentation/forget_password_screen.dart';
import 'package:bookia_store/feature/auth/presentation/login_register/page/login_screen.dart';
import 'package:bookia_store/feature/auth/presentation/login_register/page/register_screen.dart';
import 'package:bookia_store/feature/main/main_app_screen.dart';
import 'package:bookia_store/feature/splash/cubit/splash_cubit.dart';
import 'package:bookia_store/feature/splash/page/splash_screen.dart';
import 'package:bookia_store/feature/welcome/welcome_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final routes = GoRouter(
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => BlocProvider(
          create: (context) {
            //return SplashCubit()..getInit();
            var cubit = SplashCubit();
            cubit.getInit();
            return cubit;
          },
          child: const SplashScreen(),
        ),
      ),
      GoRoute(
        path: Routes.mainApp,
        builder: (context, state) => const MainAppScreen(),
      ),
      GoRoute(
        path: Routes.login,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: Routes.register,
        builder: (context, state) => BlocProvider(
          create: (context) => AuthCubit(),
          child: const RegisterScreen(),
        ),
      ),
      GoRoute(
        path: Routes.welcome,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: Routes.forgotPassword,
        builder: (context, state) => BlocProvider(
          create: (context) => ForgetCubit(),
          child: ForgotPasswordScreen(email: state.extra as String? ?? ''),
        ),
      ),
    ],
  );
}
