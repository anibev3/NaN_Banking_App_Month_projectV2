import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_storage/get_storage.dart';

class TransactionRepository {
  GetStorage box = GetStorage();

  Stream<QuerySnapshot> getTransactionsBynumCliDeb() {
    String customerId = box.read('userNawariID');
    return FirebaseFirestore.instance
        .collection('Transactions')
        // .where("numCliCred", isEqualTo: customerId)
        .where("numCliDeb", isEqualTo: customerId)
        .snapshots();
  }

  Stream<QuerySnapshot> getTransactionsBynumCliCred() {
    String customerId = box.read('userNawariID');
    return FirebaseFirestore.instance
        .collection('Transactions')
        // .where("numCliCred", isEqualTo: customerId)
        .where("numCliCred", isEqualTo: customerId)
        .snapshots();
  }
}
