import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:nan_banking_app_mai_project/src/routes/app_pages.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/Constant.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/app_text_style.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/home/components/payment_options_column.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/home/controllers/solde_controller.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/home/payment_containers.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/parametre/views/global_constants.dart';

class SoldeSection extends StatelessWidget {
  SoldeSection({
    super.key,
  });

  final SoldeController soldeController = Get.put(SoldeController());

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: soldeController.readCustomer(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Afficher un indicateur de chargement
          return LoadingAnimationWidget.staggeredDotsWave(
            color: Cst.kPrimary2Color,
            size: 25,
          );
        }
        if (snapshot.hasError) {
          // Gérer les erreurs éventuelles
          return Text(
            "Une erreur s'est produit \n Erreur: ${snapshot.error} \n veuillez revenir plus tard",
            style: TextCss.dyncoloredBoldStyle(
              Cst.kPrimary2Color,
              Cst.ksm,
            ),
          );
        }
        if (!snapshot.hasData || !snapshot.data!.exists) {
          // Si le document n'existe pas ou n'a pas de données
          return Center(
            child: Text(
              "Une erreur s'est produit veuillez revenir plus tard",
              style: TextCss.dyncoloredBoldStyle(
                Cst.kPrimary2Color,
                Cst.ksm,
              ),
            ),
          );
        }

        // Le document existe et a des données, vous pouvez accéder aux champs
        final data = snapshot.data!.data() as Map<String, dynamic>;
        print("<.............FireStore Data..................>");
        print(data);
        // box.write('userNawariID', data!['id']);
        // box.write('userNawariNOM', data!['nom']);
        // box.write('userNawariPRENOM', data!['prenoms']);
        // box.write('userNawariSEXE', data!['sexe']);
        // box.write('userNawariPROFESSION', data!['profession']);
        // box.write('userNawariCONTACT', data!['numTel']);
        // box.write('userNawariPIECE', data!['numPce']);
        // box.write('userNawariID2', data!['signUpID']);
        // box.write('userNawariSOLD', data!['solde']);
        // print("<.............................................>");

        final nom = data['nom'];

        final prenoms = data['prenoms'];
        final solde = data['solde'].toString().replaceAllMapped(
              RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
              (match) => '${match[1]} ',
            );
        // final transactions = data['transaction'] as List<dynamic>;
        soldeController.isFrees = data['freeze'];

        // final nombreTransaction = data['nombreTransaction'];

        // Afficher les informations récupérées
        return Column(
          children: [
            Container(
                height: 190,
                margin: const EdgeInsets.only(
                    left: 20, right: 20, top: 8, bottom: 5),
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  gradient: const SweepGradient(
                    center: AlignmentDirectional(1, -1),
                    startAngle: 1.7,
                    endAngle: 3,
                    colors: <Color>[
                      Color(0xFF21899C),
                      Color(0xFF21899C),
                      Color.fromARGB(255, 6, 115, 134),
                      Color.fromARGB(255, 6, 115, 134),
                      Color(0xFF21899C),
                      Color(0xFF21899C),
                    ],
                    stops: <double>[0.0, 0.3, 0.3, 0.7, 0.7, 1.0],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "VISA",
                          style: TextStyle(
                              fontSize: 24.30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Image.asset(
                                "assets/img/logoNaN.png",
                                width: 20,
                              ),
                            ),
                            const Text(
                              "NaN Academy",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "$solde",
                          style: const TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const Text(
                          "Franc Cfa",
                          style: TextStyle(
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "propiétaire",
                                    style: TextStyle(
                                        fontSize: 12,
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "$prenoms $nom",
                                    style: const TextStyle(
                                        fontSize: 12,
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text(
                                    "Expiries",
                                    style: TextStyle(
                                        fontSize: 12,
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    "10\t/\t24",
                                    style: TextStyle(
                                        fontSize: 12,
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                ],
                              ),
                            ),
                            (soldeController.isFrees)
                                ? Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Column(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Colors.red,
                                            child: Icon(
                                              Icons.close,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            "suspendu",
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.red,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                : Expanded(
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: Column(
                                        children: [
                                          CircleAvatar(
                                            backgroundColor: Colors.green,
                                            child: Icon(
                                              Icons.check,
                                              color: Colors.white,
                                            ),
                                          ),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          Text(
                                            "actif",
                                            style: TextStyle(
                                              fontSize: 10,
                                              color: Colors.green,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                          ],
                        )
                      ],
                    )
                  ],
                )),
            Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: value90,
                          child: Column(
                            children: [
                              PaymentContainers(
                                icon: "assets/icons/add_icon.png",
                                color: const Color(0xFFDFAD2C),
                                onTap: () {
                                  soldeController.goToCominfSoon();
                                },
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Fond",
                                style: TextStyle(
                                  color: defaultAppColor,
                                  fontSize: heightValue17,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: value90,
                          child: Column(
                            children: [
                              PaymentContainers(
                                icon: "assets/icons/send_icon.png",
                                color: const Color(0xFFA9224A),
                                onTap: () {
                                  soldeController.toTransfert();
                                },
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Transfert",
                                style: TextStyle(
                                  color: defaultAppColor,
                                  fontSize: heightValue17,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: value90,
                          child: Column(
                            children: [
                              PaymentContainers(
                                icon: "assets/icons/bills_icon.png",
                                color: const Color(0xFF2248A9),
                                onTap: () {
                                  // Navigator.pushNamed(context, CommingSoonScreen.route);
                                },
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Paiement",
                                style: TextStyle(
                                  color: defaultAppColor,
                                  fontSize: heightValue17,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: value90,
                          child: Column(
                            children: [
                              PaymentContainers(
                                icon: "assets/icons/budget_icon.png",
                                color: const Color(0xFF0F975E),
                                onTap: () {
                                  // Navigator.pushNamed(context, CommingSoonScreen.route);
                                },
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Text(
                                "Budget",
                                style: TextStyle(
                                  color: defaultAppColor,
                                  fontSize: heightValue17,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                )

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //   children: [
                //     GestureDetector(
                //       onTap: () {
                //         // Get.toNamed(Routes.TRANSFERT);
                //         soldeController.toTransfert();
                //       },
                //       child: Container(
                //         margin: const EdgeInsets.all(4),
                //         child: Center(
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.center,
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Container(
                //                 width: 57,
                //                 height: 57,
                //                 decoration: BoxDecoration(
                //                   borderRadius: BorderRadius.circular(20),
                //                   color: Colors.grey,
                //                   image: DecorationImage(
                //                     image: AssetImage(
                //                       "assets/img/balloning.png",
                //                     ),
                //                     fit: BoxFit.cover,
                //                   ),
                //                 ),
                //               ),
                //               SizedBox(
                //                 height: 9,
                //               ),
                //               Text(
                //                 "Transfert",
                //                 style: TextCss.dyncoloredBoldStyle(
                //                     Colors.grey, Cst.kbase2),
                //               )
                //             ],
                //           ),
                //         ),
                //       ),
                //     ),
                //     InkWell(
                //       onTap: () {
                //         Get.toNamed(Routes.COMINGSOON);
                //       },
                //       child: Container(
                //         margin: const EdgeInsets.all(4),
                //         child: Center(
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.center,
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Container(
                //                 width: 57,
                //                 height: 57,
                //                 decoration: BoxDecoration(
                //                   borderRadius: BorderRadius.circular(20),
                //                   color: Colors.grey,
                //                   image: DecorationImage(
                //                     image: AssetImage(
                //                       "assets/img/hiking.png",
                //                     ),
                //                     fit: BoxFit.cover,
                //                   ),
                //                 ),
                //               ),
                //               SizedBox(
                //                 height: 9,
                //               ),
                //               Text(
                //                 "Epargne",
                //                 style: TextCss.dyncoloredBoldStyle(
                //                     Colors.grey, Cst.kbase2),
                //               )
                //             ],
                //           ),
                //         ),
                //       ),
                //     ),
                //     InkWell(
                //       onTap: () {
                //         // print('index: $index');
                //         // switch (index) {
                //         //   case 0:
                //         //     return toTransfert();
                //         //   default:
                //         //     return toTransfert();
                //         // }
                //       },
                //       child: Container(
                //         margin: const EdgeInsets.all(4),
                //         child: Center(
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.center,
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Container(
                //                 width: 57,
                //                 height: 57,
                //                 decoration: BoxDecoration(
                //                   borderRadius: BorderRadius.circular(20),
                //                   color: Colors.grey,
                //                   image: DecorationImage(
                //                     image: AssetImage(
                //                       "assets/img/kayaking.png",
                //                     ),
                //                     fit: BoxFit.cover,
                //                   ),
                //                 ),
                //               ),
                //               SizedBox(
                //                 height: 9,
                //               ),
                //               Text(
                //                 "MobMoney",
                //                 style: TextCss.dyncoloredBoldStyle(
                //                     Colors.grey, Cst.kbase2),
                //               )
                //             ],
                //           ),
                //         ),
                //       ),
                //     ),
                //     InkWell(
                //       onTap: () {
                //         // print('index: $index');
                //         // switch (index) {
                //         //   case 0:
                //         //     return toTransfert();
                //         //   default:
                //         //     return toTransfert();
                //         // }
                //       },
                //       child: Container(
                //         margin: const EdgeInsets.all(4),
                //         child: Center(
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.center,
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Container(
                //                 width: 57,
                //                 height: 57,
                //                 decoration: BoxDecoration(
                //                   borderRadius: BorderRadius.circular(20),
                //                   color: Colors.grey,
                //                   image: DecorationImage(
                //                     image: AssetImage(
                //                       "assets/img/snorkling.png",
                //                     ),
                //                     fit: BoxFit.cover,
                //                   ),
                //                 ),
                //               ),
                //               SizedBox(
                //                 height: 9,
                //               ),
                //               Text(
                //                 "Banque",
                //                 style: TextCss.dyncoloredBoldStyle(
                //                     Colors.grey, Cst.kbase2),
                //               )
                //             ],
                //           ),
                //         ),
                //       ),
                //     ),
                //     InkWell(
                //       onTap: () {
                //         // print('index: $index');
                //         // switch (index) {
                //         //   case 0:
                //         //     return toTransfert();
                //         //   default:
                //         //     return toTransfert();
                //         // }
                //       },
                //       child: Container(
                //         margin: const EdgeInsets.all(4),
                //         child: Center(
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.center,
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: [
                //               Container(
                //                 width: 57,
                //                 height: 57,
                //                 decoration: BoxDecoration(
                //                   borderRadius: BorderRadius.circular(20),
                //                   color: Colors.grey,
                //                   image: DecorationImage(
                //                     image: AssetImage(
                //                       "assets/img/snorkling.png",
                //                     ),
                //                     fit: BoxFit.cover,
                //                   ),
                //                 ),
                //               ),
                //               SizedBox(
                //                 height: 9,
                //               ),
                //               Text(
                //                 "Coffre",
                //                 style: TextCss.dyncoloredBoldStyle(
                //                     Colors.grey, Cst.kbase2),
                //               )
                //             ],
                //           ),
                //         ),
                //       ),
                //     )
                //   ],
                // ),
                )
          ],
        );
      },
    );
  }
}
