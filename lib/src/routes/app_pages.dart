import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/Paiement/views/paiement_failed.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/Paiement/views/paiement_success.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/confirm/views/confirm_to_enter.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/detail_transaction/views/detail_transaction.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/epargne/views/epargne.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/home/components/allTransaction.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/messagerie/views/messagerie.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/notification/comming_soon_screen.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/notification/notification_home_screen.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/parametre/views/parametre.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/parametre/views/test/test1_page.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/parametre/views/test/test2_page.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/parametre/views/test/test3_page.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/profile/views/change_pin_screen.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/profile/views/profile.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/session/InfoSup.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/session/login.screen.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/session/otp.screen.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/session/register.screen.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/session/splash_screen.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/session/welcome.screen.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/statistic/views/statistic.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/transfert/views/transfert.dart';
import 'package:nan_banking_app_mai_project/src/views/widgets/lib/entry_point.dart';

part './app_routes.dart';

class AppPages {
  static final pages = [
    // ++
    // ++
    // ++
    // --------------  Messagerie
    // ++
    // ++
    // ++
    GetPage(
      name: Routes.ALLTRANSACTION,
      transition: Transition.fade,
      curve: Curves.easeInOut,
      page: () => AllTransaction(),
    ),

    // ++
    // ++
    // ++
    // --------------  Messagerie
    // ++
    // ++
    // ++
    GetPage(
      name: Routes.INFOSUP,
      transition: Transition.fade,
      curve: Curves.easeInOut,
      page: () => InfoSupScreen(),
    ),
    // ++
    // ++
    // ++
    // --------------  Messagerie
    // ++
    // ++
    // ++
    GetPage(
      name: Routes.NOTIFICATIONSCREEN,
      transition: Transition.fade,
      curve: Curves.easeInOut,
      page: () => NotificationHomeScreen(),
    ),
    // ------------- Session
    // ++
    // ++
    // ++
    GetPage(
      name: Routes.INITIAL,
      page: () => const WelcomeScreen(),
    ),

    GetPage(
      name: Routes.INITIALEMENT,
      page: () => SplashScreen(),
    ),

    GetPage(
      name: Routes.LOGIN,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterScreen(),
    ),
    // GetPage(
    //   name: Routes.IDENTIFICATION,
    //   page: () => IdentificationScreen(),
    // ),

    // GetPage(
    //   name: Routes.INFOSUP,
    //   page: () => InfoSupScreen(user: user,),
    // ),

    GetPage(
      name: Routes.LOGINOTP,
      page: () => const OtpLoginScreen(),
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
      transition: Transition.upToDown,
      curve: Curves.easeInOut,
      page: () => const EntryPoint(),
    ),

    // ++
    // ++
    // ++
    // --------------  Epargne
    // ++
    // ++
    // ++
    GetPage(
      name: Routes.EPARGNE,
      transition: Transition.noTransition,
      curve: Curves.easeInOut,
      page: () => const Epargne(),
    ),
    // ++
    // ++
    // ++
    // --------------  Messagerie
    // ++
    // ++
    // ++
    GetPage(
      name: Routes.MESSAGERIE,
      transition: Transition.noTransition,
      curve: Curves.easeInOut,
      page: () => Messagerie(),
    ),
    // ++
    // ++
    // ++
    // --------------  Profile
    // ++
    // ++
    // ++
    GetPage(
      name: Routes.PROFILE,
      transition: Transition.noTransition,
      curve: Curves.easeInOut,
      page: () => Profile(),
    ),

    // ++
    // ++
    // ++
    // --------------  Transfert
    // ++
    // ++
    // ++
    GetPage(
      name: Routes.TRANSFERT,
      // transitionDuration: const Duration(milliseconds: 300),
      transition: Transition.leftToRight,
      curve: Curves.easeInOut,
      page: () => Transfert(),
    ),

    // ++
    // ++
    // ++
    // --------------  Statistic
    // ++
    // ++
    // ++
    GetPage(
      name: Routes.STATISTIC,
      // transitionDuration: const Duration(milliseconds: 300),
      transition: Transition.noTransition,
      curve: Curves.easeInOut,
      page: () => Statistic(),
    ),

    // ++
    // ++
    // ++
    // --------------  Parametre
    // ++
    // ++
    // ++
    GetPage(
      name: Routes.PARAMETRE,
      transition: Transition.noTransition,
      curve: Curves.easeInOut,
      page: () => Parametre(),
    ),
    // ++
    // ++
    // ++
    // --------------  Parametre
    // ++
    // ++
    // ++
    GetPage(
      name: Routes.COMINGSOON,
      transition: Transition.cupertino,
      curve: Curves.easeInOut,
      page: () => const CommingSoonScreen(),
    ),
    // ++
    // ++
    // ++
    // --------------  Parametre
    // ++
    // ++
    // ++
    GetPage(
      name: Routes.UPDATEPASSWORD,
      transition: Transition.noTransition,
      curve: Curves.easeInOut,
      page: () => UpdatePassword(),
    ),
    // ++
    // ++
    // ++
    // --------------  Parametre
    // ++
    // ++
    // ++
    GetPage(
      name: Routes.CONFIRMPINTOENTER,
      transition: Transition.noTransition,
      curve: Curves.easeInOut,
      page: () => ConfirmPinToEnter(),
    ),
    // ++
    // ++
    // ++
    // --------------  Paiement
    // ++
    // ++
    // ++
    GetPage(
      name: Routes.PAIEMENTSUCCESS,
      transition: Transition.zoom,
      curve: Curves.easeInOut,
      page: () => const PaiementSuccess(),
    ),
    GetPage(
      name: Routes.PAIEMENTFAILED,
      transition: Transition.noTransition,
      curve: Curves.easeInOut,
      page: () => const PaiementFailed(),
    ),
    GetPage(
      name: Routes.DETAILTRANSACTION,
      transition: Transition.zoom,
      curve: Curves.easeInOut,
      page: () => const DetailTransaction(),
    ), // ++
    // ++
    // ++
    // --------------  Parametre
    // ++
    // ++
    // ++    // ++
    // ++
    // ++
    // --------------  Parametre
    // ++
    // ++
    // ++    // ++
    // ++
    // ++
    // --------------  Parametre
    // ++
    // ++
    // ++    // ++
    // ++
    // ++
    // --------------  Parametre
    // ++
    // ++
    // ++    // ++
    // ++
    // ++
    // --------------  Parametre
    // ++
    // ++
    // ++    // ++
    // ++
    // ++
    // --------------  Parametre
    // ++
    // ++
    // ++    // ++
    // ++
    // ++
    // --------------  Parametre
    // ++
    // ++
    // ++    // ++
    // ++
    // ++
    // --------------  Parametre
    // ++
    // ++
    // ++    // ++
    // ++
    // ++
    // --------------  Parametre
    // ++
    // ++
    // ++    // ++
    // ++
    // ++
    // --------------  Parametre
    // ++
    // ++
    // ++    // ++
    // ++
    // ++
    // --------------  Parametre
    // ++
    // ++
    // ++    // ++
    // ++
    // ++
    // --------------  Parametre
    // ++
    // ++
    // ++    // ++
    // ++
    // ++
    // --------------  Parametre
    // ++
    // ++
    // ++
    //
    //// ++
    // ++
    // ++
    // --------------  Parametre
    // ++
    // ++
    // ++
    GetPage(
      name: Routes.TESTPAGE1,
      transition: Transition.noTransition,
      curve: Curves.easeInOut,
      page: () => const Test1Page(),
    ),
    GetPage(
      name: Routes.TESTPAGE2,
      transition: Transition.noTransition,
      curve: Curves.easeInOut,
      page: () => const Test2Page(),
    ),
    GetPage(
      name: Routes.TESTPAGE3,
      transition: Transition.noTransition,
      curve: Curves.easeInOut,
      page: () => const Test3Page(),
    ),
  ];
}
