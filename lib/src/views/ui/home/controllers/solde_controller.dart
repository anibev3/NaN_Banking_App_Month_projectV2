import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';
import 'package:flutter/material.dart';

class SoldeController {
  GetStorage box = GetStorage();

  late String userConnectedId;

  Future<String> getUserConnectedId() async {
    String userConnectedId = await box.read('userNawariID');

    if (userConnectedId != null) {
      print('Utilisateur : $userConnectedId');
    } else {
      print('Aucun utilisateur connecté');
    }

    return userConnectedId;
  }

  Stream<DocumentSnapshot> readCustomer(String customerId) {
    if (customerId.isNotEmpty) {
      return FirebaseFirestore.instance
          .collection("Customers")
          .doc(customerId)
          .snapshots();
    } else {
      throw ArgumentError('ID du document vide');
    }
  }
}
