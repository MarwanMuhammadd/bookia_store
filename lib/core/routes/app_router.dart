
import 'package:bookia_store/core/routes/routes.dart';
import 'package:bookia_store/feature/auth/presentation/forget_password/forget_password_screen.dart';
import 'package:bookia_store/feature/auth/presentation/login_register/page/login_screen.dart';
import 'package:bookia_store/feature/auth/presentation/login_register/page/register_screen.dart';
import 'package:bookia_store/feature/splash/splash_screen.dart';
import 'package:bookia_store/feature/welcome/welcome_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final routes = GoRouter(
    routes: [
      GoRoute(
        path: Routes.splash,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: Routes.welcome,
        builder: (context, state) => const WelcomeScreen(),
      ),
      GoRoute(
        path: Routes.login,
        builder: (context, state) =>const LoginScreen()
      ),
      GoRoute(
        path: Routes.register,
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: Routes.forgotPassword,
        builder: (context, state) {
          return ForgotPasswordScreen(email: state.extra as String);
        },
      ),
    ],
  );
}