// ignore_for_file: unused_import

import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:lablab2/bloc/auth/auth_cubit.dart';
import 'package:lablab2/bloc/bloc_observer.dart';
import 'package:lablab2/bloc/content/content_cubit.dart';
import 'package:lablab2/bloc/cubit/newform_cubit.dart';
import 'package:lablab2/bloc/user_auth/user_auth_cubit.dart';
import 'package:lablab2/dep_inj.dart';
import 'package:lablab2/firebase_options.dart';
import 'package:lablab2/presentaion/screens/content/content_desc.dart';
import 'package:lablab2/presentaion/screens/content/new_content.dart';
import 'package:lablab2/presentaion/screens/content/select_content_type.dart';
import 'package:lablab2/presentaion/screens/signIn&Up/sign_in_up.dart';
import 'package:lablab2/presentaion/screens/signIn/sign_in.dart';
import 'package:lablab2/presentaion/screens/signUp/sign_up.dart';
import 'package:lablab2/presentaion/screens/splashScreen/splash_screen.dart';
import 'package:lablab2/res/res_extension.dart';
import 'package:lablab2/routes/app_router.dart';

import 'routes/screens_enum.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  DepInj.setup();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late UserAuthCubit _userAuthCubit;
  @override
  void initState() {
    _userAuthCubit = UserAuthCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => _userAuthCubit,
        ),
        BlocProvider(
          create: (context) => AuthCubit(_userAuthCubit),
        ),
        BlocProvider(create: (context) => ContentCubit()),
        BlocProvider(create: (context) => NewformCubit())
      ],
      child: MaterialApp(
        title: 'LabLab',
        debugShowCheckedModeBanner: false, 
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        onGenerateRoute: DepInj.locator<AppRouter>().onGenerateRoute,
        initialRoute: DepInj.locator<AppRouter>().splashRoute,
      ),
    );
  }
}
