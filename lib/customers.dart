import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Customer {
  String id;
  String nom;
  String prenoms;
  DateTime dateNaissance;
  String profession;
  String numPce;
  String numTel;
  double solde;
  String mail;
  String sexe;
  String typeCpt;
  String gestionnaire;
  DateTime dateCreat;
  int nbTransac;

  Customer(
      {required this.id,
      required this.nom,
      required this.prenoms,
      required this.dateNaissance,
      required this.profession,
      required this.numPce,
      required this.numTel,
      required this.solde,
      required this.mail,
      required this.sexe,
      required this.typeCpt,
      required this.gestionnaire,
      required this.dateCreat,
      this.nbTransac = 0});

  static Customer fromJson(Map<String, dynamic> map) {
    return Customer(
        id: map["id"] ?? "",
        nom: map["nom"] ?? "",
        prenoms: map["prenoms"] ?? "",
        dateNaissance: convertTimestampToDateTime(map["dateNaissance"] ?? 0),
        profession: map["profession"] ?? "",
        numPce: map["numPce"] ?? "",
        numTel: map["numTel"] ?? "",
        solde: map["solde"] ?? 0.0,
        mail: map["mail"] ?? "",
        sexe: map["sexe"] ?? "",
        typeCpt: map["typeCpt"] ?? "",
        gestionnaire: map["gestionnaire"] ?? "",
        dateCreat: convertTimestampToDateTime(map["dateCreat"] ?? 0));
  }

  static List<Map<String, dynamic>> customerListTest = [
    {
      "id": "NAW001",
      "dateCreat": DateTime(2000, 1, 1),
      "dateNaissance": DateTime(2023, 5, 14),
      "gestionnaire": "GEST001",
      "mail": "ABEDIE3@GMAIL.COM",
      "nom": "ABEDIE",
      "numPce": "CI014457784",
      "numTel": "+22501111111",
      "prenoms": "FRANCK",
      "profession": "CONSULTANT",
      "sexe": "HOMME",
      "solde": 0.0,
      "typeCpt": "compte courant",
      "nbTransac": 0
    }
  ];

  static List<Customer> getCustomerData() {
    return customerListTest
        .map((element) => Customer(
              id: element["id"] ?? "",
              nom: element["nom"] ?? "",
              prenoms: element["prenoms"] ?? "",
              dateNaissance: element["dateNaissance"] ?? "",
              profession: element["profession"] ?? "",
              numPce: element["numPce"] ?? "",
              numTel: element["numTel"] ?? "",
              solde: element["solde"] ?? "",
              mail: element["mail"] ?? "",
              sexe: element["sexe"] ?? "",
              typeCpt: element["typeCpt"] ?? "",
              gestionnaire: element["gestionnaire"] ?? "",
              dateCreat: element["dateCreat"] ?? "",
              nbTransac: element["nbTransac"] ?? "",
            ))
        .toList();
  }

  static DateTime convertTimestampToDateTime(Timestamp timestamp) {
    return timestamp.toDate();
  }

  var formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
}
