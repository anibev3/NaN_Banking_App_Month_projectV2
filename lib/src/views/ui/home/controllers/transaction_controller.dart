import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nan_banking_app_mai_project/src/routes/app_pages.dart';

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

//This function call the dataBase and return a respnses with for two cases : error case or succes case
  Future<List<dynamic>> getValueTrans({required String customerId}) async {
    dynamic dataReceiv;
    dynamic dataSender;
    List<dynamic> mergedData = [];

    try {
      // Sender's instance
      final queryTransacSend = FirebaseFirestore.instance
          .collection('Transactions')
          .where("numCliCred", isEqualTo: customerId);

      var querySnapshotSender = await queryTransacSend.get();
      if (querySnapshotSender.size > 0) {
        dataSender = querySnapshotSender.docs.map((doc) => doc.data()).toList();
      } else {
        dataSender = -1;
      }

      // Receiver's instance
      final queryTransacReceiv = FirebaseFirestore.instance
          .collection('Transactions')
          .where("numCliDeb", isEqualTo: customerId);

      var querySnapshotReceiv = await queryTransacReceiv.get();
      if (querySnapshotReceiv.size > 0) {
        dataReceiv = querySnapshotReceiv.docs.map((doc) => doc.data()).toList();
      } else {
        dataReceiv = -1;
      }

      // Merge dataSender and dataReceiv
      if (dataSender != -1 && dataReceiv != -1) {
        List<dynamic> mergedData = [];
        mergedData.addAll(dataSender);
        mergedData.addAll(dataReceiv);
        mergedData.sort((a, b) => a['dateEffect'].compareTo(b['dateEffect']));
        print("FUSION DES TRANSACTIONS -->");
      }

      return mergedData;
    } catch (e) {
      // Response when any call is empty
      return [-2];
    }
  }

  void goToTravsfertPage() {
    Get.toNamed(Routes.TRANSFERT);
  }
}
