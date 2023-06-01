import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:nan_banking_app_mai_project/src/routes/app_pages.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/Constant.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/app_text_style.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/icon_et_text.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/home/components/list_pharmacie.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/home/controllers/transaction_controller.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/parametre/views/custom_button.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/parametre/views/global_constants.dart';

class RecentTransactionCredit extends StatefulWidget {
  @override
  State<RecentTransactionCredit> createState() =>
      _RecentTransactionCreditState();
}

class _RecentTransactionCreditState extends State<RecentTransactionCredit> {
  final TransactionRepository _transactionRepository = TransactionRepository();
  // HomeController controller = Get.put(HomeController());

  List imgs = [
    "bpop.jpeg",
    "bpop.jpeg",
    "bpop.jpeg",
    "bpop.jpeg",
  ];

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
    return
        // StreamBuilder<List<dynamic>>(
        //   stream: _transactionRepository.getValueTransStream(userConnectedId),
        //   builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        //     if (snapshot.hasError) {
        //       return Text('Une erreur s\'est produite');
        //     }

        //     if (snapshot.connectionState == ConnectionState.waiting) {
        //       return Text('Chargement des données...');
        //     }

        //     List<dynamic>? data = snapshot.data;

        //     if (data == null || data.isEmpty) {
        //       return Text('Aucune donnée disponible');
        //     }

        //     return ListView.builder(
        //       itemCount: data.length,
        //       itemBuilder: (BuildContext context, int index) {
        //         return ListTile(
        //           title: Text('Transaction $index'),
        //           subtitle: Text(data[index].toString()),
        //         );
        //       },
        //     );
        //   },
        // );

        StreamBuilder<QuerySnapshot>(
      stream: _transactionRepository.getTransactionsBynumCliCred(),
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

        // Afficher les documents correspondants
        return (!snapshot.hasData || snapshot.data!.docs.isEmpty)
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: heightValue10,
                  ),
                  Image.asset(
                    "assets/img/empty_list.png",
                    height: heightValue150,
                  ),
                  Text(
                    "Vous n'avez reçu aucun fond à ce jour",
                    style: TextStyle(
                      fontSize: heightValue18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: heightValue10,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: value60),
                    child: CustomButton(
                        buttonText: "Transférer maintenant",
                        buttonColor: defaultAppColor,
                        buttonTextColor: whiteColor,
                        onTap: () {
                          _transactionRepository.goToTravsfertPage();
                        }),
                  )
                ],
              )
            : Container(
                margin: const EdgeInsets.only(
                    left: 20, right: 20, top: 8, bottom: 5),
                height: 200,
                child: ListView.builder(
                  itemCount: snapshot.data!.docs.length >= 6
                      ? 6
                      : snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    DocumentSnapshot transaction =
                        snapshot.data!.docs.reversed.toList()[index];
                    final dateEffectue = transaction['dateEffect'] as Timestamp;
                    final ref = transaction['ref'] as String;
                    refTransaction = ref;
                    final nomCliCred = transaction['nomCliCred'] as String;
                    final numCliCred = transaction['numCliCred'] as String;
                    final numCliDeb = transaction['numCliDeb'] as String;
                    final montant =
                        transaction['montant'].toString().replaceAllMapped(
                              RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                              (match) => '${match[1]} ',
                            );
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: GestureDetector(
                        onTap: () {
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
                        child: CupertinoButton(
                            color: Color.fromARGB(255, 242, 241, 241),
                            padding: EdgeInsets.zero,
                            // color: ,
                            onPressed: () {},
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
                                title: Text(
                                  'de $nomCliCred',
                                  style: TextCss.dyncoloredBoldStyle(
                                      Colors.grey, Cst.klg),
                                ),
                                subtitle: Text(
                                  'Référence: $ref',
                                  style: TextCss.dyncoloredBoldStyle(
                                      Colors.grey, Cst.k12),
                                ),
                                trailing: Text(
                                  (numCliCred == userConnectedId)
                                      ? ' ${montant.toString()} XOF'
                                      : ' -${montant.toString()} XOF',
                                  style: TextCss.dyncoloredBoldStyle(
                                      (numCliCred == userConnectedId)
                                          ? Colors.green
                                          : Colors.red,
                                      Cst.k10),
                                ),
                              ),
                            )),
                      ),
                    );
                  },
                ),
              );
      },
    );
  }
}
