import 'package:another_flushbar/flushbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nan_banking_app_mai_project/src/routes/app_pages.dart';

class SoldeController extends GetxController {
  // static SoldeController get instance => Get.find();
  GetStorage box = GetStorage();
  String userID = '';
  bool isFrees = false;

  @override
  void onInit() {
    userID = box.read('userNawariID');
    print(
        "+++++++++++++++++++++++++++++++ $userID +++++++++++++++++++++++++++++");
    if (userID.isNotEmpty) {
      readCustomer();
    }
    super.onInit();
  }

  Stream<DocumentSnapshot> readCustomer() {
    if (userID.isNotEmpty) {
      return FirebaseFirestore.instance
          .collection("Customers")
          .doc(userID)
          .snapshots();
    } else {
      throw ArgumentError('ID du document vide');
    }
  }

  void toTransfert() {
    if (isFrees) {
      Flushbar(
        backgroundColor: Colors.red,
        title: "Votre compte est suspendu!",
        margin: EdgeInsets.only(top: 50),
        message: "Veuillez contacter le service client pour plus d'information",
        duration: Duration(seconds: 4),
        flushbarPosition: FlushbarPosition.TOP,
      ).show(Get.context!);
    } else {
      print("<........IsFrees: $isFrees ..........>");
      Get.toNamed(Routes.TRANSFERT);
    }
  }

  void goToCominfSoon() {
    Get.toNamed(Routes.COMINGSOON);
  }
}
