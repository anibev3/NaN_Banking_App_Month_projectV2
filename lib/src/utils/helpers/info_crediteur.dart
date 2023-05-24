import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CustomerController extends GetxController {
  var customerName = ''.obs;
  var customerPrename = ''.obs;
  var fullName = ''.obs;

  Future<void> getCustomerName(String customerId) async {
    try {
      DocumentSnapshot snapshot = await FirebaseFirestore.instance
          .collection('Customers')
          .doc(customerId)
          .get();

      if (snapshot.exists) {
        // customerName.value = snapshot.data()!['nom'] as String;
        customerName.value = snapshot.get('nom') as String;
        customerPrename.value = snapshot.get('prenoms') as String;
        String fullName = '${customerName.value} ${customerPrename.value}';
        print('Nom complet : $fullName');

        print("<.......Nom du credité.......>");
        print("<....... ${customerName.value} .......>");
      } else {
        // Le document n'existe pas
        print(
            'Le document avec l\'ID $customerId n\'existe pas dans la collection "Customers".');
      }
    } catch (e) {
      // Une erreur s'est produite lors de la récupération du document
      print(
          'Une erreur s\'est produite lors de la récupération du document : $e');
    }
  }
}
