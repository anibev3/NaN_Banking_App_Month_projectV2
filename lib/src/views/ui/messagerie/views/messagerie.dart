// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:nan_banking_app_mai_project/src/views/ui/session/controller/login_controller.dart';

// import '../../../../utils/helpers/custumer_controller.dart';

// class Messagerie extends StatefulWidget {
//   Messagerie({Key? key}) : super(key: key);

//   @override
//   State<Messagerie> createState() => _MessagerieState();
// }

// class _MessagerieState extends State<Messagerie> {
//   final LoginController _authController = Get.find<LoginController>();

//   ClientController clientController = Get.put(ClientController());

//   GetStorage box = GetStorage();
//   String userConnectedId = "";

//   @override
//   void initState() {
//     super.initState();
//     print(
//         '<...........On est dans le initState du makeTransaction...........>');
//     showUserValue();
//   }

//   void showUserValue() async {
//     // UserTempon? user = firebaseUser.value;
//     userConnectedId = await box.read('userNawariID');

//     if (userConnectedId != null) {
//       print('Utilisateur : ${userConnectedId}');
//     } else {
//       print('Aucun utilisateur connecté');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // appBar: AppBar(
//       //   title: const Text('Accueil'),
//       //   actions: [
//       //     IconButton(
//       //       icon: const Icon(Icons.logout),
//       //       onPressed: () => _authController.logOut_(),
//       //     ),
//       //   ],
//       // ),
//       body: Center(
//           child: Text(
//         "Messagerie",
//         textAlign: TextAlign.center,
//       )
//           // Column(
//           //   mainAxisAlignment: MainAxisAlignment.center,
//           //   children: [
//           //     const Text('Bienvenue sur l\'écran d\'accueil !'),
//           //     const SizedBox(height: 16.0),
//           //     Obx(
//           //       () => Text(
//           //           'Utilisateur connecté : ${_authController.firebaseUser.value?.email ?? 'Non connecté'}'),
//           //     ),
//           //     const SizedBox(height: 16.0),
//           //     Obx(
//           //       () => Text(
//           //           'Utilisateur displayName : ${_authController.firebaseUser.value?.displayName ?? 'Non connecté'}'),
//           //     ),
//           //     const SizedBox(height: 16.0),
//           //     Obx(
//           //       () => Text(
//           //           'Utilisateur emailVerified : ${_authController.firebaseUser.value?.emailVerified ?? 'Non connecté'}'),
//           //     ),
//           //     const SizedBox(height: 16.0),
//           //     Obx(
//           //       () => Text(
//           //           'Utilisateur isAnonymous : ${_authController.firebaseUser.value?.isAnonymous ?? 'Non connecté'}'),
//           //     ),
//           //     const SizedBox(height: 16.0),
//           //     Obx(
//           //       () => Text(
//           //           'Utilisateur metadata : ${_authController.firebaseUser.value?.metadata ?? 'Non connecté'}'),
//           //     ),
//           //     const SizedBox(height: 16.0),
//           //     Obx(
//           //       () => Text(
//           //           'Utilisateur phoneNumber : ${_authController.firebaseUser.value?.phoneNumber ?? 'Non connecté'}'),
//           //     ),
//           //     const SizedBox(height: 16.0),
//           //     Obx(
//           //       () => Text(
//           //           'Utilisateur photoURL : ${_authController.firebaseUser.value?.photoURL ?? 'Non connecté'}'),
//           //     ),
//           //     const SizedBox(height: 16.0),
//           //     Obx(
//           //       () => Text(
//           //           'Utilisateur providerData : ${_authController.firebaseUser.value?.providerData ?? 'Non connecté'}'),
//           //     ),
//           //     const SizedBox(height: 16.0),
//           //     Obx(
//           //       () => Text(
//           //           'Utilisateur refreshToken : ${_authController.firebaseUser.value?.refreshToken ?? 'Non connecté'}'),
//           //     ),
//           //     const SizedBox(height: 16.0),
//           //     Obx(
//           //       () => Text(
//           //           'Utilisateur tenantId : ${_authController.firebaseUser.value?.tenantId ?? 'Non connecté'}'),
//           //     ),
//           //     const SizedBox(height: 16.0),
//           //     // Obx(
//           //     //   () => Text(
//           //     //       'Utilisateur uid : ${_authController.firebaseUser ?? 'Non connecté'}'),
//           //     // ),
//           //     Obx(
//           //       () => Text(
//           //           'Utilisateur uid : ${_authController.firebaseUser.value?.uid ?? 'Non connecté'}'),
//           //     ),
//           //     Obx(
//           //       () => Text('Utilisateur uid : ${clientController.email}'),
//           //     ),
//           //     Obx(
//           //       () => Text('Utilisateur uid : ${clientController.dateCreat}'),
//           //     ),
//           //     Obx(
//           //       () => Text('Utilisateur uid : ${clientController.dateNaissance}'),
//           //     ),
//           //     Obx(
//           //       () => Text('Utilisateur uid : ${clientController.gestionnaire}'),
//           //     ),
//           //     Obx(
//           //       () => Text('Utilisateur uid : ${clientController.id}'),
//           //     ),
//           //     Obx(
//           //       () => Text('Utilisateur uid : ${clientController.nbTransac}'),
//           //     ),
//           //     Obx(
//           //       () => Text('Utilisateur uid : ${clientController.nom}'),
//           //     ),
//           //     Obx(
//           //       () => Text('Utilisateur uid : ${clientController.numPce}'),
//           //     ),
//           //     Obx(
//           //       () => Text('Utilisateur uid : ${clientController.numTel}'),
//           //     ),
//           //   ],
//           // ),

//           ),
//     );
//   }
// }

import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/Constant.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/app_form_style.dart';
// import 'package:mobile/app/modules/home/widgets/bottom_navigation_bar_widget.dart';
// import 'package:mobile/app/utils/theme/Constant.dart';
// import 'package:mobile/app/utils/theme/app_form_style.dart';
// import 'package:mobile/app/utils/theme/app_text_style.dart';
// import 'package:mobile/app/widgets/message_tile_widget.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/app_text_style.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/messagerie/widgets/message_tile_widget.dart';
import 'package:unicons/unicons.dart';

class Messagerie extends StatelessWidget {
  const Messagerie({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Cst.k3xl),
          child: Column(
            children: [
              const SizedBox(height: 10),
              buildHeader(),
              const SizedBox(height: 15),
              buildSearchBar(),
              const SizedBox(height: 15),
              Expanded(
                child:
                    ListView(scrollDirection: Axis.vertical, children: const [
                  MessageTileWidget(),
                  MessageTileWidget(),
                  MessageTileWidget(),
                  MessageTileWidget(),
                  MessageTileWidget(),
                  MessageTileWidget(),
                  MessageTileWidget(),
                  MessageTileWidget(),
                  MessageTileWidget(),
                  MessageTileWidget(),
                  MessageTileWidget(),
                  MessageTileWidget(),
                  MessageTileWidget(),
                  MessageTileWidget(),
                  MessageTileWidget(),
                  MessageTileWidget(),
                ]),
              )
            ],
          ),
        ),
      )),
      // bottomNavigationBar: const CustomBottomNavigationBar(
      // activeIndex: 3,
      // ),
    );
  }

  Widget buildHeader() {
    return SizedBox(
      height: 60,
      width: Get.width,
      child: Center(
        child: Text(
          "",
          style: TextCss.dyncoloredBoldStyle(Colors.black, Cst.k2xl),
        ),
      ),
    );
  }

  Widget buildSearchBar() {
    return Container(
      child: TextFormField(
        style: TextCss.normalStyle,
        validator: (value) {
          if (value == null) return "Le nom est obligatoire";
        },
        decoration: FormCss.defaultInputStyle(" ", "Chercher une conversation",
            borderStroke: 1,
            prefix: Icon(
              UniconsLine.search,
              size: 20,
              color: Colors.grey.shade800,
            )),
      ),
    );
  }
}
