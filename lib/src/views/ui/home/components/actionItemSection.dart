import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:nan_banking_app_mai_project/src/routes/app_pages.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/Constant.dart';

class ActionItemSection extends StatefulWidget {
  const ActionItemSection({
    super.key,
    required this.images,
  });

  final Map<String, String> images;

  @override
  State<ActionItemSection> createState() => _ActionItemSectionState();
}

class _ActionItemSectionState extends State<ActionItemSection> {
  GetStorage box = GetStorage();
  String userConnectedId = "";
  bool isFrees = false;

  void toTransfert() {
    if (isFrees) {
      print("<........IsFrees: $isFrees ..........>");
      ScaffoldMessenger.of(context)
        ..hideCurrentSnackBar()
        ..showSnackBar(mySnackBar(
            "Votre compte est suspendu!",
            "Veuillez contacter le service client pour plus d'information ",
            ContentType.failure));
    } else {
      print("<........IsFrees: $isFrees ..........>");
      Get.toNamed(Routes.TRANSFERT);
    }
  }

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
    String usedId = box.read('userNawariID');

    return StreamBuilder<DocumentSnapshot>(
      stream: readCustomer(usedId.toString()),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Afficher un indicateur de chargement
          return Container(
              width: 53,
              height: 53,
              child: LoadingAnimationWidget.staggeredDotsWave(
                color: Cst.kPrimary2Color,
                size: 25,
              ));
          ;
        }
        if (snapshot.hasError) {
          // Gérer les erreurs éventuelles
          return Text('Erreur: ${snapshot.error}');
        }
        if (!snapshot.hasData || !snapshot.data!.exists) {
          // Si le document n'existe pas ou n'a pas de données
          return Text('Document introuvable');
        }

        // Le document existe et a des données, vous pouvez accéder aux champs
        final data = snapshot.data!.data() as Map<String, dynamic>;
        print("<.............FireStore Data..................>");
        print(data);
        print("<.............................................>");

        // final nom = data['nom'];
        // final prenoms = data['prenoms'];
        // final solde = data['solde'].toString().replaceAllMapped(
        //       RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
        //       (match) => '${match[1]} ',
        //     );
        // final transactions = data['transaction'] as List<dynamic>;
        final freeze = data['freeze'];
        isFrees = freeze;
        // final nombreTransaction = data['nombreTransaction'];

        // Afficher les informations récupérées
        return Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.TRANSFERT);
                },
                child: Container(
                  margin: const EdgeInsets.all(4),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 57,
                          height: 57,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey,
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/img/balloning.png",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Text(
                          "Transfert",
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 13.60,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  // print('index: $index');
                  // switch (index) {
                  //   case 0:
                  //     return toTransfert();
                  //   default:
                  //     return toTransfert();
                  // }
                },
                child: Container(
                  margin: const EdgeInsets.all(4),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 57,
                          height: 57,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey,
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/img/hiking.png",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Text(
                          "Epargne",
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 13.60,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  // print('index: $index');
                  // switch (index) {
                  //   case 0:
                  //     return toTransfert();
                  //   default:
                  //     return toTransfert();
                  // }
                },
                child: Container(
                  margin: const EdgeInsets.all(4),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 57,
                          height: 57,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey,
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/img/kayaking.png",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Text(
                          "MobMoney",
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 13.60,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  // print('index: $index');
                  // switch (index) {
                  //   case 0:
                  //     return toTransfert();
                  //   default:
                  //     return toTransfert();
                  // }
                },
                child: Container(
                  margin: const EdgeInsets.all(4),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 57,
                          height: 57,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey,
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/img/snorkling.png",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Text(
                          "Banque",
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 13.60,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  // print('index: $index');
                  // switch (index) {
                  //   case 0:
                  //     return toTransfert();
                  //   default:
                  //     return toTransfert();
                  // }
                },
                child: Container(
                  margin: const EdgeInsets.all(4),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 57,
                          height: 57,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.grey,
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/img/snorkling.png",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Text(
                          "Coffre",
                          style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 13.60,
                              fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        );

        // SizedBox(
        //   height: 120,
        //   child: Padding(
        //     padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
        //     child: Center(
        //       child: ListView.builder(
        //           scrollDirection: Axis.horizontal,
        //           itemCount: 5,
        //           itemBuilder: (BuildContext context, int index) {
        //             return
        //
        //
        // InkWell(
        //               onTap: () {
        //                 print('index: $index');
        //                 switch (index) {
        //                   case 0:
        //                     return toTransfert();
        //                   default:
        //                     return toTransfert();
        //                 }
        //               },
        //               child:
        //
        // Container(
        //                 margin: const EdgeInsets.all(4),
        //                 child: Center(
        //                   child: Column(
        //                     crossAxisAlignment: CrossAxisAlignment.center,
        //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                     children: [
        //                       Container(
        //                         width: 57,
        //                         height: 57,
        //                         decoration: BoxDecoration(
        //                           borderRadius: BorderRadius.circular(20),
        //                           color: Colors.grey,
        //                           image: DecorationImage(
        //                             image: AssetImage(
        //                               "assets/img/" +
        //                                   widget.images.keys.elementAt(index),
        //                             ),
        //                             fit: BoxFit.cover,
        //                           ),
        //                         ),
        //                       ),
        //                       Text(
        //                         widget.images.values.elementAt(index),
        //                         style: const TextStyle(
        //                             color: Colors.grey,
        //                             fontSize: 13.60,
        //                             fontWeight: FontWeight.bold),
        //                       )
        //                     ],
        //                   ),
        //                 ),
        //               ),
        //             );
        //           }),
        //     ),
        //   ),
        // );
      },
    );
  }

  Stream<DocumentSnapshot> readCustomer(String customerId) {
    if (customerId.isNotEmpty) {
      return FirebaseFirestore.instance
          .collection("Customers")
          .doc(customerId)
          .snapshots();
    } else {
      throw ArgumentError('ID du document vide');
    }
  }

  SnackBar mySnackBar(String title, String message, ContentType contentType) {
    return SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: AwesomeSnackbarContent(
          title: title,
          message: message,

          /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
          contentType: contentType,
        ),
      ),
    );
  }
}
