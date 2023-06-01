import 'package:another_flushbar/flushbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerController extends GetxController {
  var customerName = ''.obs;
  var customerPrename = ''.obs;
  var customerProfession = ''.obs;
  var customerSexe = ''.obs;
  var customerNumtel = ''.obs;
  bool customerIsfreeze = false;
  var customerIsExist = false.obs;

  // bool customerIsExist = true;
  var customerID = ''.obs;

  Future<void> getCustomerName(String customerId) async {
    print("+++++++++++++++++++ INFO CREDITEUR ++++++++++++++++++++");

    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('Customers')
          .doc(customerId)
          .get();

      if (snapshot.exists) {
        // customerName.value = snapshot.data()!['nom'] as String;
        print('++++++++++++++++++++++++++++++= ${snapshot.data()}');
        customerIsExist.value = true;

        customerName.value = snapshot.get('nom') as String;
        customerPrename.value = snapshot.get('prenoms') as String;
        customerProfession.value = snapshot.get('profession') as String;
        customerSexe.value = snapshot.get('sexe') as String;
        customerNumtel.value = snapshot.get('numTel') as String;
        customerIsfreeze = snapshot.get('freeze');
        customerID.value = snapshot.get('id') as String;
      } else {
        // Le document n'existe pas
        customerIsExist.value = false;
        Flushbar(
          backgroundColor: Colors.red,
          title: "Erreur",
          margin: const EdgeInsets.only(top: 50),
          message:
              "Le client avec le N° compte $customerId n'existe pas dans la base de donnée",
          duration: const Duration(seconds: 3),
          flushbarPosition: FlushbarPosition.TOP,
        ).show(Get.context!);
      }
    } catch (e) {
      // Une erreur s'est produite lors de la récupération du document
      print(
          'Une erreur s\'est produite lors de la récupération du document : $e');
    }
  }
}
