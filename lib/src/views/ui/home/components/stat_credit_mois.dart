import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:nan_banking_app_mai_project/src/routes/app_pages.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/Constant.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/home/controllers/transaction_controller.dart';

class StatCreditMois extends StatefulWidget {
  @override
  State<StatCreditMois> createState() => _StatCreditMoisState();
}

class _StatCreditMoisState extends State<StatCreditMois> {
  final TransactionRepository _transactionRepository = TransactionRepository();

  String? refTransaction;

  GetStorage box = GetStorage();

  String userConnectedId = "";

  @override
  void initState() {
    super.initState();
    print(
        '<...........On est dans le initState du makeTransaction...........>');
    showUserValue();
  }

  void showUserValue() async {
    // UserTempon? user = firebaseUser.value;
    userConnectedId = await box.read('userNawariID');

    if (userConnectedId != null) {
      print('Utilisateur : ${userConnectedId}');
    } else {
      print('Aucun utilisateur connecté');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return StreamBuilder<QuerySnapshot>(
      stream: _transactionRepository.getTransactionsBynumCliCred(),
      // stream: FirebaseFirestore.instance.collection('Transactions').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Afficher un indicateur de chargement
          return LoadingAnimationWidget.staggeredDotsWave(
            color: Cst.kPrimary2Color,
            size: 25,
          );
        }
        if (snapshot.hasError) {
          // Gérer les erreurs éventuelles
          return Text('Erreur: ${snapshot.error}');
        }

        // if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
        //   // Si aucun document correspondant n'est trouvé
        //   return Text('Aucune transaction trouvée.');
        // }
        // Calculer la somme des montants
        double totalMontant = snapshot.data!.docs.fold(
          0,
          (previousValue, transaction) =>
              previousValue + (transaction['montant'] ?? 0),
        );

        // Afficher les documents correspondants
        return Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 8),
          child: SizedBox(
            height: 66,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 4.45),
                  child: Container(
                    width: 162,
                    height: 65,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.green,
                        width: 1.0,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      // color: Cst.kPrimary2Color,
                      // color: Colors.green,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Total recu",
                          style: TextStyle(fontSize: 15, color: Colors.green),
                        ),
                        (!snapshot.hasData || snapshot.data!.docs.isEmpty)
                            ? Column(
                                children: [
                                  Text(
                                    "000.00 Fcfa",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green),
                                  ),
                                  Text(
                                    "Aucune transaction éffectué",
                                    style: TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green),
                                  ),
                                ],
                              )
                            : Text(
                                "$totalMontant Fcfa",
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green),
                              )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
