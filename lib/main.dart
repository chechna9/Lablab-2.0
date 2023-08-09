// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lablab2/dep_inj.dart';
import 'package:lablab2/presentaion/screens/signIn&Up/sign_in_up.dart';
import 'package:lablab2/presentaion/screens/signUp/sign_up.dart';
import 'package:lablab2/presentaion/screens/splashScreen/splash_screen.dart';
import 'package:lablab2/res/res_extension.dart';

void main() {
  DepInj.setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: const SafeArea(
        child: SignUp(),
      ),
    );
  }
}
