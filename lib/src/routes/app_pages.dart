import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nan_banking_app_mai_project/src/views/login/pages/splash_screen.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/home/home.screen.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/session/login.screen.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/session/otp.screen.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/session/register.screen.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/session/welcome.screen.dart';
import 'package:nan_banking_app_mai_project/src/views/widgets/lib/entry_point.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    // ------------- Session
    // ++
    // ++
    // ++
    GetPage(
      name: Routes.INITIAL,
      page: () => const WelcomeScreen(),
    ),

    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => const RegisterScreen(),
    ),
    // GetPage(
    //   name: Routes.IDENTIFICATION,
    //   page: () => IdentificationScreen(),
    // ),

    // GetPage(
    //   name: Routes.LOGIN,
    //   page: () => LoginScreen(),
    // ),

    GetPage(
      name: Routes.LOGINOTP,
      page: () => OtpLoginScreen(),
    ),
    // GetPage(
    //   name: Routes.OTP,
    //   page: () => OtpScreen(),
    // ),

    // GetPage(
    //   name: Routes.COMPTECREE,
    //   page: () => CompteCreeScreen(),
    // ),

    // GetPage(
    //   name: Routes.UPDATEPROFILE,
    //   page: () => UpdateProfileScreen(),
    // ),
    // ++
    // ++
    // ++
    // --------------  Home
    // ++
    // ++
    // ++
    GetPage(
      name: Routes.HOME,
      transition: Transition.noTransition,
      curve: Curves.easeInOut,
      page: () => const EntryPoint(),
    ),

    // ++
    // ++
    // ++
    // --------------  Postcasts
    // ++
    // ++
    // ++
    // GetPage(
    //   name: Routes.POSTCASTS,
    //   transition: Transition.noTransition,
    //   curve: Curves.easeInOut,
    //   page: () => const PostcastsScreen(),
    // ),

    // ++
    // ++
    // ++
    // --------------  Profile
    // ++
    // ++
    // ++
    // GetPage(
    //   name: Routes.PROFILE,
    //   transition: Transition.noTransition,
    //   curve: Curves.easeInOut,
    //   page: () => const ProfileScreen(),
    // ),

    // ++
    // ++
    // ++
    // --------------  Programmes
    // ++
    // ++
    // ++
    // GetPage(
    //   name: Routes.PROGRAMME,
    //   // transitionDuration: const Duration(milliseconds: 300),
    //   transition: Transition.noTransition,
    //   curve: Curves.easeInOut,
    //   page: () => const ProgrammesScreen(),
    // ),

    // ++
    // ++
    // ++
    // --------------  Parametre
    // ++
    // ++
    // ++
    // GetPage(
    //   name: Routes.PARAMETRE,
    //   transition: Transition.noTransition,
    //   curve: Curves.easeInOut,
    //   page: () => const ParametreScreen(),
    // ),
  ];
}
