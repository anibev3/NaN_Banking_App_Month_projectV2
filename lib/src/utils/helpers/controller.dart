import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nan_banking_app_mai_project/src/routes/app_pages.dart';
import 'package:nan_banking_app_mai_project/src/utils/helpers/custumer_controller.dart';

class Controller extends GetxController {
  static Controller get instance => Get.find();
  GetStorage box = GetStorage();
  String? idUser;
  // final ClientController _customerController = Get.find<ClientController>();
  final ClientController _customerController = Get.put(ClientController());

  Future<void> fetchCustomerData(String signUpID) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('Customers')
          .where('signUpID', isEqualTo: signUpID)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot documentSnapshot = querySnapshot.docs[0];
        Map<String, dynamic>? data =
            documentSnapshot.data() as Map<String, dynamic>?;
        box.write('customerData', data); // Stocker les données

        // await box.write('userNawariID', data!['id']);
        Get.toNamed(Routes.HOME);
        // Get.toNamed(Routes.HOME, arguments: {'variable': data['id']});

        if (data != null) {
          String id = data['id'];
          String signUpID = data['signUpID'];
          String nom = data['nom'];
          String prenoms = data['prenoms'];
          String email = data['mail'];
          String profession = data['profession'];
          Timestamp dateNaissance = data['dateNaissance'];
          Timestamp dateCreat = data['dateCreat'];
          String sexe = data['sexe'];
          String typeCpt = data['typeCpt'];
          String numTel = data['numTel'];
          // List<String> transactions = data['transactions'];
          bool freeze = data['freeze'];
          // bool freeze = data['freeze'].value ?? false;
          String numPce = data['numPce'];
          String gestionnaire = data['gestionnaire'];
          double solde = data['solde'];
          int nbTransac = data['nbTransac'];
          // await box.write('userNawariID', id);

          // Faites quelque chose avec les données récupérées
          print('<.....................Les données du customers: $data. ...');
          print(
              '<.....................Les données du customers: $profession. ...');
          // Mettre à jour le contrôleur avec les nouvelles informations
          _customerController.setCustomerInfo(
            id,
            signUpID,
            nom,
            prenoms,
            email,
            profession,
            dateNaissance,
            dateCreat,
            sexe,
            typeCpt,
            numTel,
            // transactions,
            //
            freeze,
            //
            // numPce,
            // gestionnaire,
            solde,
            // nbTransac,
          );
        }
      } else {
        print('Aucun document trouvé avec le signUpID spécifié...');
      }
    } catch (e) {
      print('Erreur lors de la récupération du document: $e ...');
    }

    // List<String> names = List<String>.from(customerDocument['names']);
    // List<bool> boolValues = List<bool>.from(customerDocument['boolValues']);
    // List<Timestamp> dateTimestamps =
    //     List<Timestamp>.from(customerDocument['dates']);
    // List<DateTime> dates =
    //     dateTimestamps.map((timestamp) => timestamp.toDate()).toList();
  }
}
