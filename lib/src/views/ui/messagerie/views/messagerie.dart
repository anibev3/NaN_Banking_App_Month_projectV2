import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/session/controller/login_controller.dart';

import '../../../../utils/helpers/custumer_controller.dart';

class Messagerie extends StatefulWidget {
  Messagerie({Key? key}) : super(key: key);

  @override
  State<Messagerie> createState() => _MessagerieState();
}

class _MessagerieState extends State<Messagerie> {
  final LoginController _authController = Get.find<LoginController>();

  ClientController clientController = Get.put(ClientController());

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Accueil'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _authController.logout(),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Bienvenue sur l\'écran d\'accueil !'),
            const SizedBox(height: 16.0),
            Obx(
              () => Text(
                  'Utilisateur connecté : ${_authController.firebaseUser.value?.email ?? 'Non connecté'}'),
            ),
            const SizedBox(height: 16.0),
            Obx(
              () => Text(
                  'Utilisateur displayName : ${_authController.firebaseUser.value?.displayName ?? 'Non connecté'}'),
            ),
            const SizedBox(height: 16.0),
            Obx(
              () => Text(
                  'Utilisateur emailVerified : ${_authController.firebaseUser.value?.emailVerified ?? 'Non connecté'}'),
            ),
            const SizedBox(height: 16.0),
            Obx(
              () => Text(
                  'Utilisateur isAnonymous : ${_authController.firebaseUser.value?.isAnonymous ?? 'Non connecté'}'),
            ),
            const SizedBox(height: 16.0),
            Obx(
              () => Text(
                  'Utilisateur metadata : ${_authController.firebaseUser.value?.metadata ?? 'Non connecté'}'),
            ),
            const SizedBox(height: 16.0),
            Obx(
              () => Text(
                  'Utilisateur phoneNumber : ${_authController.firebaseUser.value?.phoneNumber ?? 'Non connecté'}'),
            ),
            const SizedBox(height: 16.0),
            Obx(
              () => Text(
                  'Utilisateur photoURL : ${_authController.firebaseUser.value?.photoURL ?? 'Non connecté'}'),
            ),
            const SizedBox(height: 16.0),
            Obx(
              () => Text(
                  'Utilisateur providerData : ${_authController.firebaseUser.value?.providerData ?? 'Non connecté'}'),
            ),
            const SizedBox(height: 16.0),
            Obx(
              () => Text(
                  'Utilisateur refreshToken : ${_authController.firebaseUser.value?.refreshToken ?? 'Non connecté'}'),
            ),
            const SizedBox(height: 16.0),
            Obx(
              () => Text(
                  'Utilisateur tenantId : ${_authController.firebaseUser.value?.tenantId ?? 'Non connecté'}'),
            ),
            const SizedBox(height: 16.0),
            // Obx(
            //   () => Text(
            //       'Utilisateur uid : ${_authController.firebaseUser ?? 'Non connecté'}'),
            // ),
            Obx(
              () => Text(
                  'Utilisateur uid : ${_authController.firebaseUser.value?.uid ?? 'Non connecté'}'),
            ),
            Obx(
              () => Text('Utilisateur uid : ${clientController.email}'),
            ),
            Obx(
              () => Text('Utilisateur uid : ${clientController.dateCreat}'),
            ),
            Obx(
              () => Text('Utilisateur uid : ${clientController.dateNaissance}'),
            ),
            Obx(
              () => Text('Utilisateur uid : ${clientController.gestionnaire}'),
            ),
            Obx(
              () => Text('Utilisateur uid : ${clientController.id}'),
            ),
            Obx(
              () => Text('Utilisateur uid : ${clientController.nbTransac}'),
            ),
            Obx(
              () => Text('Utilisateur uid : ${clientController.nom}'),
            ),
            Obx(
              () => Text('Utilisateur uid : ${clientController.numPce}'),
            ),
            Obx(
              () => Text('Utilisateur uid : ${clientController.numTel}'),
            ),
          ],
        ),
      ),
    );
  }
}
