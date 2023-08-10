import 'package:flutter/material.dart';
import 'package:lablab2/presentaion/screens/main/main_screen.dart';
import 'package:lablab2/presentaion/screens/signIn&Up/sign_in_up.dart';
import 'package:lablab2/presentaion/screens/signIn/sign_in.dart';
import 'package:lablab2/presentaion/screens/signUp/sign_up.dart';
import 'package:lablab2/presentaion/screens/splashScreen/splash_screen.dart';
import 'package:lablab2/routes/screens_enum.dart';

class AppRouter {
  static const String _splashRoute = '/';
  static const String _losRoute = '/los';
  static const String _signInRoute = '/signIn';
  static const String _signUpRoute = '/signUp';
  static const String _mainRoute = '/main';

  String get splashRoute => _splashRoute;
  String get losRoute => _losRoute;
  String get signInRoute => _signInRoute;
  String get signUpRoute => _signUpRoute;
  String get mainRoute => _mainRoute;

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case _splashRoute:
        return MaterialPageRoute(
          builder: (_) => const SafeArea(child: SplashScreen()),
        );

      case _losRoute:
        return MaterialPageRoute(
          builder: (_) => const SafeArea(child: SignInUP()),
        );

      case _signInRoute:
        return MaterialPageRoute(
          builder: (_) => const SafeArea(child: SignIn()),
        );

      case _signUpRoute:
        return MaterialPageRoute(
          builder: (_) => const SafeArea(child: SignUp()),
        );

      case _mainRoute:
        return MaterialPageRoute(
          builder: (_) => const SafeArea(child: MainScreen()),
        );

      default:
        return null;
    }
  }

  String getRouteNameFromEnum(Screens screen) {
    switch (screen) {
      case Screens.splash:
        return _splashRoute;
      case Screens.los:
        return _losRoute;
      case Screens.signIn:
        return _signInRoute;
      case Screens.signUp:
        return _signUpRoute;
      case Screens.main:
        return _mainRoute;
      default:
        return '/404';
    }
  }

  void push(BuildContext context, Screens screen) {
    String routeName = getRouteNameFromEnum(screen);
    Navigator.of(context).pushNamed(routeName);
  }

  void pushReplacement(BuildContext context, Screens screen) {
    String routeName = getRouteNameFromEnum(screen);
    Navigator.of(context).pushReplacementNamed(routeName);
  }

  void pushAndRemoveAll(BuildContext context, Screens screen) {
    String routeName = getRouteNameFromEnum(screen);

    Navigator.of(context).pushNamedAndRemoveUntil(
      routeName,
      (Route<dynamic> route) => false,
    );
  }
}
