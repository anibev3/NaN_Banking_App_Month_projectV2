import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nan_banking_app_mai_project/src/routes/app_pages.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/home/controllers/transaction_controller.dart';

class RecentTransaction extends StatefulWidget {
  @override
  State<RecentTransaction> createState() => _RecentTransactionState();
}

class _RecentTransactionState extends State<RecentTransaction> {
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
      stream: _transactionRepository.getTransactionsBynumCliDeb(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Afficher un indicateur de chargement
          return CircularProgressIndicator();
        }

        if (snapshot.hasError) {
          // Gérer les erreurs éventuelles
          return Text('Erreur: ${snapshot.error}');
        }

        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
          // Si aucun document correspondant n'est trouvé
          return Text('Aucune transaction trouvée.');
        }

        // Afficher les documents correspondants
        return Container(
          margin: const EdgeInsets.only(left: 20, right: 20, top: 8, bottom: 5),
          height: 200,
          child: ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (BuildContext context, int index) {
              DocumentSnapshot transaction = snapshot.data!.docs[index];
              final dateEffectue = transaction['dateEffect'] as Timestamp;
              final ref = transaction['ref'] as String;
              refTransaction = ref;
              final nomCliCred = transaction['nomCliCred'] as String;
              final numCliCred = transaction['numCliCred'] as String;
              final numCliDeb = transaction['numCliDeb'] as String;
              final montant = transaction['montant'] as dynamic;
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: CupertinoButton(
                    color: Color.fromARGB(255, 242, 241, 241),
                    padding: EdgeInsets.zero,
                    // color: ,
                    onPressed: () {
                      if (kDebugMode) {
                        print(
                            "<_____________________Detail transaction______________________>");
                        if (ref != null) {
                          print("<....... $ref .......>");
                          Get.toNamed(Routes.DETAILTRANSACTION,
                              arguments: {'variable': ref});
                        } else {
                          print("<....... Une erreur est survenu .......>");
                        }
                      }
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: size.width / 100 * 3,
                        // vertical: size.height / 100 * 0.000005,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                            style: BorderStyle.solid,
                          )),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: Container(
                          height: 53,
                          width: 53,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(160),
                            color: Colors.white,
                          ),
                          child: Center(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: Image.asset(
                                "assets/img/snorkling.png",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        title: Text('$nomCliCred'),
                        subtitle: Text(
                          'Référence: $ref',
                          style: TextStyle(
                            fontSize: 12,
                          ),
                        ),
                        trailing: Text(
                          (numCliCred == userConnectedId)
                              ? '${montant.toString()} XOF'
                              : '-${montant.toString()} XOF',
                          style: TextStyle(
                            color: (numCliCred == userConnectedId)
                                ? Colors.green
                                : Colors.red,
                          ),
                        ),
                      ),
                    )),
              );
            },
          ),
        );
      },
    );
  }
}
