import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ClientController extends GetxController {
  RxBool freeze = RxBool(false);

  RxString id = RxString("");
  RxString signUpID = RxString("");
  RxString nom = RxString("");
  RxString prenoms = RxString("");
  RxString email = RxString("");
  RxString profession = RxString("");
  Rx<Timestamp> dateNaissance = Rx<Timestamp>(Timestamp.now());
  Rx<Timestamp> dateCreat = Rx<Timestamp>(Timestamp.now());
  RxString sexe = RxString("");
  RxString typeCpt = RxString("");
  RxString numTel = RxString("");
  RxString numPce = RxString("");
  RxString gestionnaire = RxString("");
  RxInt nbTransac = RxInt(0);
  RxDouble solde = RxDouble(0);
  // RxList<String> transactions = RxList<String>([]);
  // RxList<bool> boolValues = RxList<bool>([]);
  // RxList<DateTime> dates = RxList<DateTime>([]);

  void setCustomerInfo(
      String id,
      String signUpID,
      String nom,
      String prenoms,
      String email,
      String profession,
      Timestamp dateNaissance,
      Timestamp dateCreat,
      String sexe,
      String typeCpt,
      String numTel,
      // List<String> transactions,
      // int nbTransac,
      bool freeze,
      // String numPce,
      // String gestionnaire,
      double solde
      // List<bool> boolValues,
      // List<DateTime> dates,
      ) {
    this.id.value = id;
    this.signUpID.value = signUpID;
    this.nom.value = nom;
    this.prenoms.value = prenoms;
    this.email.value = email;
    this.profession.value = profession;
    this.dateNaissance.value = dateNaissance;
    this.dateCreat.value = dateCreat;
    this.sexe.value = sexe;
    this.typeCpt.value = typeCpt;
    this.numTel.value = numTel;
    // this.transactions.value = transactions;
    this.freeze.value = freeze;
    // this.numPce.value = numPce;
    // this.gestionnaire.value = gestionnaire;
    this.solde.value = solde;
    // this.nbTransac.value = nbTransac;
  }
}
