import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:nan_banking_app_mai_project/src/routes/app_pages.dart';
import 'package:nan_banking_app_mai_project/src/utils/helpers/session.helper.dart';

class SplashController extends GetxController {
  SessionManager prefs = SessionManager();

  @override
  void onReady() {
    // TODO: implement onReady()
    // prefs.logout();
    // print(prefs.isUserLogged());
    if (prefs.isUserLogged()) {
      ///Go to Shop home Screen
      print("User is already logged");
      Fluttertoast.showToast(msg: "Connecté!", backgroundColor: Colors.green);
      Timer(Duration(seconds: 3), onPageHome);
      onPageHome();
    } else {
      print("No User !!!");
      // onPageLogin();
      // Timer(Duration(seconds: 3), onPageStart);
      if (prefs.isTmpUserLogged()) {
        Timer(Duration(seconds: 2), onAccountNotValid);
      } else {
        onPageStart();
      }
    }
    super.onReady();
  }

  void onPageStart() {
    Get.offAndToNamed(Routes.INITIAL);
  }

  void onPageLogin() {
    Get.offAndToNamed(Routes.LOGIN);
  }

  void onAccountNotValid() {
    Get.offAndToNamed(Routes.INFOSUP);
    Fluttertoast.showToast(
        msg: "Veuillez terminer votre inscription!",
        backgroundColor: Colors.green);
  }

  void onPageHome() {
    Get.offAndToNamed(Routes.CONFIRMPINTOENTER);
  }
}
