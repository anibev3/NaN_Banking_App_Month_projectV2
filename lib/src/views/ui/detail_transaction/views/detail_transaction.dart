import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/Constant.dart';

class DetailTransaction extends StatefulWidget {
  const DetailTransaction({
    super.key,
  });

  @override
  State<DetailTransaction> createState() => _DetailTransactionState();
}

class _DetailTransactionState extends State<DetailTransaction> {
  GetStorage box = GetStorage();
  // String userConnectedId = "";
  late String transacID = "";

  @override
  void initState() {
    super.initState();
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
            fontSize: 13,
            // fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
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
          // final prenoms = data['prenoms'];
          final montant = data['montant'].toString().replaceAllMapped(
                RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                (match) => '${match[1]} ',
              );
          // final transactions = data['transaction'] as List<dynamic>;
          // final freeze = data['freeze'];
          // final nombreTransaction = data['nombreTransaction'];

          // Afficher les informations récupérées
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              height: size.height,
              width: size.width,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "+100 F CFA",
                            style: GoogleFonts.dmSans(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "De Akadgé Frederic",
                            style: GoogleFonts.dmSans(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            width: size.width - 150,
                            height: size.height - 250,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 219, 91, 82),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Text(
                              "De Akadgé Frederic",
                              style: GoogleFonts.dmSans(
                                color: Colors.red,
                                fontSize: 10,
                                // fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                  Container(),
                  Container(),
                  Container(),
                  Container(),
                  Container(),
                ],
              ),
            ),
          );
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
