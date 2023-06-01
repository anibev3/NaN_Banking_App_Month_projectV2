import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nan_banking_app_mai_project/src/routes/app_pages.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/Constant.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/parametre/views/global_constants.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/parametre/views/test/testWidgets/transaction_details_container.dart';

class DetailTransaction extends StatefulWidget {
  const DetailTransaction({
    super.key,
  });

  @override
  State<DetailTransaction> createState() => _DetailTransactionState();
}

class _DetailTransactionState extends State<DetailTransaction> {
  GetStorage box = GetStorage();
  String userConnectedId = "";
  late String transacID = "";

  @override
  void initState() {
    super.initState();
    userConnectedId = box.read('userNawariID');

    print(
        '<...........On est dans le initState du detail transaction...........>');
    // showUserValue();
  }

  // void showUserValue() async {
  //   userConnectedId = await box.read('userNawariID');

  //   if (userConnectedId != null) {
  //     print('Utilisateur : ${userConnectedId}');
  //   } else {
  //     print('Aucun utilisateur connecté');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // String usedId = box.read('userNawariID');
    final dynamic arguments = Get.arguments;
    final transacRef = arguments['variable'];
    transacID = transacRef;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Cst.kprimary4Color,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          'Detail Transaction',
          style: GoogleFonts.dmSans(
            color: Colors.black,
            fontSize: 17,
            // fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor: Cst.kprimary4Color,
      ),
      body: StreamBuilder<DocumentSnapshot>(
        stream: readCustomer(transacRef.toString()),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            // Afficher un indicateur de chargement
            return Container(
              width: 53,
              height: 53,
              child: const CircularProgressIndicator(),
            );
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
          final reference = data['ref'];
          final montant = data['montant'].toString().replaceAllMapped(
                RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                (match) => '${match[1]} ',
              );
          final numCliCred = data['numCliCred'] as String;
          final nomCliCred = data['nomCliCred'] as String;
          final dateEffectue = data['dateEffect'] as Timestamp;
          DateTime date = dateEffectue.toDate();
          String formattedDate =
              DateFormat('dd MMMM yyyy à HH:mm', 'fr_FR').format(date);
          // final transactions = data['transaction'] as List<dynamic>;
          // final freeze = data['freeze'];
          // final nombreTransaction = data['nombreTransaction'];

          // Afficher les informations récupérées
          return SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: value20),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: heightValue10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: value40,
                          width: value40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(value35),
                            color: scaffoldBackgroundColor,
                          ),
                          child: Center(
                            child: Image.asset(
                              (numCliCred == userConnectedId)
                                  ? "assets/icons/credit_icon.png"
                                  : "assets/icons/debit_icon.png",
                              // getTrnxSummary(transactions)[1],

                              height: value25,
                              // color: transactions.trnxType == "Debit"
                              //     ? Colors.red
                              //     : Colors.green,
                              color: (numCliCred == userConnectedId)
                                  ? Colors.green
                                  : Colors.red,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: value10,
                        ),
                        Text(
                          (numCliCred == userConnectedId) ? "Crédit" : "Débit",
                          style: TextStyle(
                            fontSize: heightValue30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: heightValue20,
                    ),
                    Text(
                      formattedDate,
                      style: TextStyle(fontSize: heightValue19),
                    ),
                    SizedBox(
                      height: heightValue15,
                    ),
                    TransactionDetailsContainer(
                      isAmount: true,
                      label: "Montant",
                      content: (numCliCred == userConnectedId)
                          ? '- ${montant.toString()} XOF'
                          : '+ ${montant.toString()} XOF',
                      // "${transactions.trnxType == "Debit" ? "- " : "+ "}₦${amountFormatter.format(transactions.amount)}",
                      amountColor: (numCliCred == userConnectedId)
                          ? Colors.green
                          : Colors.red,
                    ),
                    TransactionDetailsContainer(
                      label: 'Envoyé à',
                      content: nomCliCred,
                    ),
                    // TransactionDetailsContainer(
                    //   label: "Description",
                    //   content: 'transactions.description',
                    // ),
                    TransactionDetailsContainer(
                      label: "Reference",
                      content: reference,
                    ),
                    TransactionDetailsContainer(
                      label: "N°Compte destinataire",
                      content: numCliCred,
                    ),
                    const TransactionDetailsContainer(
                      label: "Status",
                      content: "Successful",
                      isRow: true,
                    ),
                    SizedBox(
                      height: heightValue30,
                    ),
                    Text(
                      "Des problèmes ou des questions ?",
                      style: TextStyle(
                        fontSize: heightValue20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: heightValue15,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.offNamed(Routes.COMINGSOON);
                      },
                      child: Container(
                        height: heightValue60,
                        width: screenWidth,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(heightValue20),
                          color: Colors.red,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/icons/info-circle.png",
                              height: heightValue30,
                            ),
                            SizedBox(
                              width: value10,
                            ),
                            Text(
                              "Signaler la transaction",
                              style: TextStyle(
                                fontSize: heightValue20,
                                color: whiteColor,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: heightValue15,
                    )
                  ],
                ),
              ),
            ),
          );

          // Padding(
          //   padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
          //   child: Container(
          //     height: size.height,
          //     width: size.width,
          //     child: ListView(
          //       scrollDirection: Axis.vertical,
          //       children: [
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.start,
          //           children: [
          //             Column(
          //               mainAxisAlignment: MainAxisAlignment.start,
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Text(
          //                   (numCliCred == userConnectedId)
          //                       ? '${montant.toString()} XOF'
          //                       : '-${montant.toString()} XOF',
          //                   style: GoogleFonts.dmSans(
          //                     color: (numCliCred == userConnectedId)
          //                         ? Colors.green
          //                         : Colors.red,
          //                     fontSize: 25,
          //                     fontWeight: FontWeight.bold,
          //                   ),
          //                 ),
          //                 Text(
          //                   " $montant F CFA",
          //                 ),
          //                 Text(
          //                   "$nomCliCred",
          //                   style: GoogleFonts.dmSans(
          //                     color: Colors.black,
          //                     fontSize: 25,
          //                     fontWeight: FontWeight.bold,
          //                   ),
          //                 ),
          //                 Container(
          //                   width: size.width - 150,
          //                   height: size.height - 250,
          //                   decoration: BoxDecoration(
          //                     color: Color.fromARGB(255, 219, 91, 82),
          //                     borderRadius: BorderRadius.circular(15),
          //                   ),
          //                   child: Text(
          //                     "De Akadgé Frederic",
          //                     style: GoogleFonts.dmSans(
          //                       color: Colors.red,
          //                       fontSize: 10,
          //                       // fontWeight: FontWeight.bold,
          //                     ),
          //                   ),
          //                 )
          //               ],
          //             )
          //           ],
          //         ),
          //         Container(),
          //         Container(),
          //         Container(),
          //         Container(),
          //         Container(),
          //       ],
          //     ),
          //   ),
          // );
        },
      ),
    );
  }

  Stream<DocumentSnapshot> readCustomer(String transacID) {
    if (transacID.isNotEmpty) {
      return FirebaseFirestore.instance
          .collection("Transactions")
          .doc(transacID)
          .snapshots();
    } else {
      throw ArgumentError('ID du document vide');
    }
  }
}
