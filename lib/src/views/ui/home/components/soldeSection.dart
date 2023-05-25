import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/Constant.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/session/controller/login_controller.dart';

class SoldeSection extends StatefulWidget {
  const SoldeSection({
    super.key,
  });

  @override
  State<SoldeSection> createState() => _SoldeSectionState();
}

class _SoldeSectionState extends State<SoldeSection> {
  final LoginController _authController = Get.find<LoginController>();

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
          return LoadingAnimationWidget.staggeredDotsWave(
            color: Cst.kPrimary2Color,
            size: 25,
          );
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

        final nom = data['nom'];

        final prenoms = data['prenoms'];
        final solde = data['solde'].toString().replaceAllMapped(
              RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
              (match) => '${match[1]} ',
            );
        // final transactions = data['transaction'] as List<dynamic>;
        final freeze = data['freeze'];
        // final nombreTransaction = data['nombreTransaction'];

        // Afficher les informations récupérées
        return Container(
            height: 190,
            margin:
                const EdgeInsets.only(left: 20, right: 20, top: 8, bottom: 5),
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
                        (freeze)
                            ? const Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.red,
                                    child: Icon(
                                      Icons.close,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                            : const Expanded(
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.green,
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              )
                      ],
                    )
                  ],
                )
              ],
            ));
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
}
