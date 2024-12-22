import 'package:complete_e_commerce_app/Presentation/Auth/Auth_Welcome.dart';
import 'package:complete_e_commerce_app/Presentation/Auth/Login/Cubit/login_cubit.dart';
import 'package:complete_e_commerce_app/Presentation/Auth/Sign_up/Cubit/sign_cubit.dart';
import 'package:complete_e_commerce_app/Presentation/Helper/Cache_Helper.dart';
import 'package:complete_e_commerce_app/Presentation/Home/Cubit/home_cubit.dart';
import 'package:complete_e_commerce_app/Presentation/Home/Main/MainHome.dart';
// import 'dart:async';
import 'package:complete_e_commerce_app/Presentation/SplashScreens/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:shared_preferences/shared_preferences.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  Widget? widget;
  bool? Onboarding = CacheHelper.getData(key: "Onboarding");
  final String? token = CacheHelper.getData(key: "token");
  if (Onboarding != null) {
    if (token != null)
      widget = Mainhome();
    else
      widget = AuthWelcome();
  } else {
    widget = Homepage();
  }

  runApp(MyApp(
    startwidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  final Widget? startwidget;

  const MyApp({super.key, this.startwidget});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<LoginCubit>(
            create: (context) => LoginCubit(),
          ),
          BlocProvider<SignCubit>(
            create: (context) => SignCubit(),
          ),
          BlocProvider<HomeCubit>(
              create: (context) => HomeCubit()
                ..getbanner()
                ..getCatagorieList()
                ..getProducts()
                ..otherProducts()
                ..GetFavoritesData()
                ..getProfile()),
        ],
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          home: startwidget,
        ));
  }
}

/// nasrHossam@gmail.com
/// 992004
///
/// Hossamnasr@gmail.com
///200499
///
