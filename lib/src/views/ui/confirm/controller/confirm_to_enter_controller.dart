import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nan_banking_app_mai_project/src/routes/app_pages.dart';
import 'package:nan_banking_app_mai_project/src/utils/helpers/utils.dart';

class ConfirmController extends GetxController {
  static ConfirmController get instance => Get.find();

  GetStorage box = GetStorage();
  String userNawariNOM = '';
  String userNawariPRENOM = '';
  String userNawariPIN = '';
  String userID = '';
  bool isFrees = false;
  var showSpinner = false.obs;
  // bool showSpinner = false;

  @override
  void onInit() {
    userID = box.read('userNawariID');
    userNawariNOM = box.read('userNawariNOM');
    userNawariPRENOM = box.read('userNawariPRENOM');
    userNawariPIN = box.read('userNawariPIN');
    print(
        "+++++++++++++++++++++++++++++++ $userID +++++++++++++++++++++++++++++");
    if (userID.isNotEmpty) {
      // readCustomer();
    }
    super.onInit();
  }

  void confirmPinBeforeTransfer({
    required BuildContext context,
    required String pin,
    // required VoidCallback onSuccess,
  }) async {
    print("+++++++++++++++++++++++++++le mot de passe est $pin");
    showDialogLoader(context);

    try {
      if (userNawariPIN.isNotEmpty && pin.isNotEmpty) {
        if (userNawariPIN == pin) {
          Get.toNamed(Routes.HOME);
        } else {
          await Fluttertoast.showToast(
              msg: "Mot de passe incorect !", backgroundColor: Colors.red);
          showTimeOutError(
            title: "Erreur!",
            message: "Mot de passe incorrect",
            context: context,
            popDialogAndLoader: true,
          );
        }
      }
      // http.Response res = await http
      //     .post(
      //       Uri.parse('$uri/api/loginUsingPin/$username'),
      //       headers: <String, String>{
      //         "Content-Type": "application/json; charset=UTF-8",
      //         'x-auth-token': userToken,
      //       },
      //       body: jsonEncode({
      //         'pin': pin,
      //       }),
      //     )
      // .timeout(const Duration(seconds: 25));

      // Navigator.of(context, rootNavigator: true).pop('dialog');

      // statusCodeHandler(
      //     context: context,
      //     response: res,
      //     onSuccess: () {
      //       onSuccess();
      //     });
    } on TimeoutException catch (e) {
      showTimeOutError(
        title: "Erreur!",
        message: "Mot de passe incorrect",
        context: context,
        popDialogAndLoader: true,
      );
    } on SocketException catch (e) {
      showNoInternetError(
        context: context,
        popDialogAndLoader: true,
      );
    } on Error catch (e) {
      print('Confirm Pin Before Transfer Error: $e');
    }
  }

  void confirmPinBeforeTransferReal({
    required BuildContext context,
    required String pin,
    required VoidCallback onSuccess,
  }) async {
    print("+++++++++++++++++++++++++++ LE MOT DE PASSE NIVEAU 0 EST $pin");
    // showDialogLoader(context);

    try {
      if (userNawariPIN.isNotEmpty && pin.isNotEmpty) {
        if (userNawariPIN == pin) {
          // Get.toNamed(Routes.HOME);
          print("++++++++++++++++++++++++++++++ NIVEAU 0 LE PIN EST JUSTE");
          onSuccess();
        } else {
          await Fluttertoast.showToast(
              msg: "Mot de passe incorect !", backgroundColor: Colors.red);
          showTimeOutError(
            title: "Erreur!",
            message: "Mot de passe incorrect",
            context: context,
            popDialogAndLoader: true,
          );
          stopLoading();
        }
      }
      // http.Response res = await http
      //     .post(
      //       Uri.parse('$uri/api/loginUsingPin/$username'),
      //       headers: <String, String>{
      //         "Content-Type": "application/json; charset=UTF-8",
      //         'x-auth-token': userToken,
      //       },
      //       body: jsonEncode({
      //         'pin': pin,
      //       }),
      //     )
      // .timeout(const Duration(seconds: 25));

      // Navigator.of(context, rootNavigator: true).pop('dialog');

      // statusCodeHandler(
      //     context: context,
      //     response: res,
      //     onSuccess: () {
      //       onSuccess();
      //     });
    } on TimeoutException catch (e) {
      showTimeOutError(
        title: "Erreur!",
        message: "Mot de passe incorrect",
        context: context,
        popDialogAndLoader: true,
      );
    } on SocketException catch (e) {
      showNoInternetError(
        context: context,
        popDialogAndLoader: true,
      );
    } on Error catch (e) {
      print('Confirm Pin Before Transfer Error: $e');
    }
  }

  void startLoading() {
    showSpinner(true);
    print("++++++++++++++++++++++++++++++ START LOADIN: $showSpinner");
  }

  void stopLoading() {
    showSpinner(false);
    print("++++++++++++++++++++++++++++++ STOP LOADIN: $showSpinner");
  }
}
