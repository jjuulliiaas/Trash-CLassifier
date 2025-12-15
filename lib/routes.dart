import 'package:flutter/material.dart';
import 'package:trash_classifier/widgets/screens/reset_password/screen.dart';
import 'package:trash_classifier/widgets/screens/scan/screen.dart';
import 'package:trash_classifier/widgets/screens/account/screen.dart';
import 'package:trash_classifier/widgets/screens/home/screen.dart';
import 'package:trash_classifier/widgets/screens/sign_in/screen.dart';
import 'package:trash_classifier/widgets/screens/sign_up/screen.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver();

class AppRoutes {

  static const home = '/';
  static const scan = '/scan';
  static const account = '/account';
  static const signUp = '/signUp';
  static const signIn = '/signIn';
  static const resetPassword = '/resetPassword';

  static Route<dynamic> noAnimationRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: Duration.zero,
      reverseTransitionDuration: Duration.zero,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return child;
      },
    );
  }

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final arguments = settings.arguments;

    switch(settings.name) {

      case home:
        return noAnimationRoute(const HomeScreen());

      case scan:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) => const ScanScreen(),
          transitionDuration: const Duration(milliseconds: 300),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(position: animation.drive(tween), child: child);
          },
        );

      case account:
        return noAnimationRoute(const AccountScreen());

      case signUp:
        return noAnimationRoute(const SignUpScreen());

      case signIn:
        return noAnimationRoute(const SignInScreen());

      case resetPassword:
        return noAnimationRoute(const ResetPasswordScreen());

      default:
        return noAnimationRoute(const HomeScreen());
    }

  }
}