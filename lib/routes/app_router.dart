import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:lablab2/bloc/user_auth/user_auth_cubit.dart';
import 'package:lablab2/presentaion/screens/main/main_screen.dart';
import 'package:lablab2/presentaion/screens/main_content/main_content.dart';
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
  static const String _mainContentRoute = '/mainContent';

  String get splashRoute => _splashRoute;
  String get losRoute => _losRoute;
  String get signInRoute => _signInRoute;
  String get signUpRoute => _signUpRoute;
  String get mainRoute => _mainRoute;
  String get mainContentRoute => _mainContentRoute;

  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case _splashRoute:
        return MaterialPageRoute(
          builder: (context) {
            return BlocBuilder<UserAuthCubit, UserAuthState>(
              builder: (context, state) {
                if (state is UserAuthenticated) {
                  return const SafeArea(child: MainScreen());
                } else if (state is UserAuthUnauthenticated) {
                  return const SafeArea(child: SignInUP());
                } else if (state is UserAuthError) {
                  return const SafeArea(
                      child: Scaffold(
                    body: Center(
                      child: Text("Error"),
                    ),
                  ));
                } else {
                  return const SafeArea(child: SplashScreen());
                }
              },
            );
          },
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

      case _mainContentRoute:
        return MaterialPageRoute(
          builder: (_) => const SafeArea(child: MainContent()),
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
      case Screens.mainContent:
        return _mainContentRoute;
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
