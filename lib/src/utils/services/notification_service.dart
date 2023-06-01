import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class NotificationService extends GetxService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final RxInt badgeCount = 0.obs;
  GetStorage box = GetStorage();
  late StreamSubscription<QuerySnapshot> _subscription;
// final List<NotificationModel> notifications = <NotificationModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    _subscribeToCollection();
  }

  @override
  void onClose() {
    _subscription.cancel();
    super.onClose();
  }

  Future<NotificationService> init() async {
    await _subscribeToCollection();
    return this;
  }

  Future<void> _subscribeToCollection() async {
    getTransactionsBynumCliCred().listen((QuerySnapshot snapshot) {
      if (snapshot.docs.length == null) {
        badgeCount.value = 0;
      } else {
        badgeCount.value = snapshot.docs.length;
      }
    });
    return;
  }

  Stream<QuerySnapshot> getTransactionsBynumCliCred() {
    try {
      String? id = box.read('userNawariID');
      print("ID is ==========> $id");
    } catch (e) {
      print(e);
    }
    final String customerId = box.read('userNawariID'); //
    return _firestore
        .collection('Transactions')
        .where("numCliCred", isEqualTo: customerId)
        .snapshots();
  }
}
