import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
// import 'package:get_storage/get_storage.dart';
import 'package:nan_banking_app_mai_project/src/routes/app_pages.dart';
import 'package:nan_banking_app_mai_project/src/utils/helpers/utils.dart';

class ProfilController extends GetxController {
  static ProfilController get instance => Get.find();

  GetStorage box = GetStorage();
  // String userNawariNOM = '';
  // String userNawariPRENOM = '';
  String userNawariPIN = '';
  String userID = '';
  // bool isFrees = false;

  @override
  void onInit() {
    userID = box.read('userNawariID');
    // userNawariNOM = box.read('userNawariNOM');
    // userNawariPRENOM = box.read('userNawariPRENOM');
    userNawariPIN = box.read('userNawariPIN');

    super.onInit();
  }

  void changeLoginPin({
    required BuildContext context,
    // required String username,
    required String oldPin,
    required String newPin,
  }) async {
    // final userToken =
    // Provider.of<UserProvider>(context, listen: false).user.token;
    showDialogLoader(context);
    if (oldPin != userNawariPIN) {
      showTimeOutError(
        title: "Erreur!",
        message: "l'ancien mot de passe est incorect",
        context: context,
        popDialogAndLoader: true,
      );
    } else {
      try {
        await updateCustomerName(newPin.toString());

        showAlertMessage(
            context: context,
            title: "Successful",
            message: "Voitre mot de pass application a bien été modifié",
            onTap: () {
              Navigator.of(context, rootNavigator: true).pop('dialog');
              Navigator.pop(context);
              Navigator.pop(context);
            });
      } catch (e) {
        showTimeOutError(
          title: "Erreur!",
          message: "Message",
          context: context,
          popDialogAndLoader: true,
        );
      }
    }
  }

  void errorPin(context) {
    showTimeOutError(
      title: "Erreur!",
      message: "l'ancien mot de passe est incorect",
      context: context,
      popDialogAndLoader: true,
    );
  }

  Future<void> updateCustomerName(String newPin) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    DocumentReference documentRef =
        firestore.collection('Customers').doc(userID);

    await documentRef.update({'securityPin': newPin}).then((_) {
      Fluttertoast.showToast(
          msg: "Modification effectué avec succes !",
          backgroundColor: Colors.red);
      box.write('userNawariPIN', newPin);
    }).catchError((error) {
      print('Erreur lors de la modification : $error');
    });
  }
}
