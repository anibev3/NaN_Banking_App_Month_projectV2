import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TransactionPrototype {
  String ref;
  String numCliDeb;
  String numCliCred;
  String nomClientCred;
  String banque;
  DateTime dateTransac;
  DateTime dateEffect;
  String gestionnaire;
  double montant;
  String typeOperat;
  String guichet;
  bool approved;
  bool fraud;

  TransactionPrototype({
    required this.ref,
    this.numCliDeb = "NAWARI_00",
    required this.numCliCred,
    required this.nomClientCred,
    this.banque = "NAWARI",
    required this.dateTransac,
    required this.dateEffect,
    required this.gestionnaire,
    required this.montant,
    required this.typeOperat,
    required this.guichet,
    this.approved = true,
    this.fraud = false,
  });

  static TransactionPrototype fromJson(Map<String, dynamic> map) {
    return TransactionPrototype(
        ref: map["ref"] ?? "",
        numCliCred: map["numCliCred"] ?? "",
        nomClientCred: map["nomClientCred"] ?? "",
        dateTransac: convertTimestampToDateTime(map["dateTransac"] ?? 0),
        dateEffect: convertTimestampToDateTime(map["dateEffect"] ?? 0),
        gestionnaire: map["gestionnaire"] ?? "",
        montant: map["solde"] ?? 0.0,
        typeOperat: map["typeOperat"] ?? "",
        guichet: map["guichet"] ?? "");
  }

  static List<Map<String, dynamic>> transacListTest = [
    {
      "ref": "NAW001",
      "numCliCred": "NAWAR001004",
      "nomClientCred": "NAWAR001004",
      "dateTransac": DateTime(2000, 1, 1),
      "dateEffect": DateTime(2023, 5, 14),
      "gestionnaire": "GEST001",
      "montant": 150000,
      "typeOperat": "Versement",
      "guichet": "NULL",
    }
  ];

  static List<TransactionPrototype> getTrasancData() {
    return transacListTest
        .map((element) => TransactionPrototype(
            ref: element["ref"] ?? "",
            numCliCred: element["numCliCred"] ?? "",
            nomClientCred: element["nomClientCred"] ?? "",
            dateTransac: element["dateTransac"] ?? "",
            dateEffect: element["dateEffect"] ?? "",
            gestionnaire: element["gestionnaire"] ?? "",
            montant: element["solde"] ?? 0.0,
            typeOperat: element["typeOperat"] ?? "",
            guichet: element["guichet"] ?? ""))
        .toList();
  }

  static DateTime convertTimestampToDateTime(Timestamp timestamp) {
    return timestamp.toDate();
  }

  var formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
}
