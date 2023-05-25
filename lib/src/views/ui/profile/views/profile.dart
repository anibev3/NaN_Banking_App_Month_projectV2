import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/Constant.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/session/controller/auth_repository.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/session/controller/login_controller.dart';
import 'package:nan_banking_app_mai_project/src/views/widgets/lib/utils/logOut_button.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  LoginController loginController = Get.put(LoginController());

  // AuthRepository authController = Get.put(AuthRepository());
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(35),
          child: Column(
            children: [
              const SizedBox(
                height: 45,
              ),
              const Center(
                child: Text(
                  "Mon profile",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    // color: Cst.kPrimary2Color,
                    fontSize: 25,
                  ),
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              ProfilHeader(),
              const SizedBox(
                height: 45,
              ),
              Container(
                padding: const EdgeInsets.only(top: 15, right: 20, left: 20),
                width: MediaQuery.of(context).size.width,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Cst.kprimary4Color,
                  // image: DecorationImage(
                  //   image: AssetImage(
                  //     "assets/img/profil.jpeg",
                  //   ),
                  //   fit: BoxFit.cover,
                  // ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 1),
                      child: GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Icon(Icons.account_balance_rounded),
                            ),
                            Text(
                              "Information personnelles",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                // color: Cst.kPrimary2Color,
                                fontSize: 19,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Divider(
                        height: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 1),
                      child: GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Icon(Icons.account_balance_rounded),
                            ),
                            Text(
                              "Modifier mon code",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                // color: Cst.kPrimary2Color,
                                fontSize: 19,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Divider(
                        height: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 1),
                      child: GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Icon(Icons.account_balance_rounded),
                            ),
                            Text(
                              "Documents",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                // color: Cst.kPrimary2Color,
                                fontSize: 19,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Divider(
                        height: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 1),
                      child: GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Icon(Icons.account_balance_rounded),
                            ),
                            Text(
                              "Noter l'application",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                // color: Cst.kPrimary2Color,
                                fontSize: 19,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfilHeader extends StatefulWidget {
  const ProfilHeader({
    super.key,
  });

  @override
  State<ProfilHeader> createState() => _ProfilHeaderState();
}

class _ProfilHeaderState extends State<ProfilHeader> {
  LoginController loginController = Get.put(LoginController());
  var ddecoCall = false.obs;
  GetStorage box = GetStorage();

  String userConnectedID = "";
  String userConnectedNom = "";
  String userConnectedProfession = "";
  String userConnectedEmail = "";
  String userConnectedPrenoms = "";
  String userConnectedContact = "";

  @override
  void initState() {
    super.initState();
    userConnectedID = box.read('userNawariID');
    userConnectedNom = box.read('userNawariNOM');
    userConnectedPrenoms = box.read('userNawariPRENOM');
    userConnectedProfession = box.read('userNawariPROFESSION');
    userConnectedEmail = box.read('userNawariEMAIL');
    userConnectedContact = box.read('userNawariCONTACT');
    // print(
    //     '<...........On est dans le initState du makeTransaction...........>');
    // showUserValue();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Row(
      children: [
        Container(
          width: 130,
          height: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Cst.kprimary4Color,
            image: const DecorationImage(
              image: AssetImage(
                "assets/img/profil.jpeg",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "$userConnectedPrenoms $userConnectedNom",
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Divider(),
            Text(
              "Tel: +225 $userConnectedContact",
              style: TextStyle(
                color: Colors.grey,

                fontSize: 13,
                // fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Email: $userConnectedEmail",
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey,

                // fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "N°cpt: $userConnectedID",
              style: TextStyle(
                fontSize: 13,
                // fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Obx(
              () => LogOutButton(
                isGestureEnabled: loginController.logOutIndicator.value,
                isloading: loginController.logOutIndicator.value,
                text: "Se déconnecter",
                size: size,
                onTap: () {
                  loginController.logOut_();
                },
              ),
            ),
            Obx(() {
              if (loginController.logOutIndicator.value == true) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: LogOutButton(
                    isGestureEnabled: false,
                    isloading: false,
                    text: "Annuler",
                    size: size,
                    onTap: () {
                      loginController.annulerLogOut_();
                    },
                  ),
                );
              } else {
                return Container();
              }
            })

            // InkWell(
            //   onTap: () {
            //     LoginController.instance.logout();
            //   },
            //   child: Container(
            //     width: 150,
            //     height: 35,
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(10),
            //       color: Colors.red,
            //       // image: DecorationImage(
            //       //   image: AssetImage(
            //       //     "assets/img/profil.jpeg",
            //       //   ),
            //       //   fit: BoxFit.cover,
            //       // ),
            //     ),
            //     child: const Center(
            //       child: Text(
            //         "Se déconnecter",
            //         style: TextStyle(
            //             color: Colors.white,
            //             fontSize: 15,
            //             fontWeight: FontWeight.bold),
            //       ),
            //     ),
            //   ),
            // ),
          ],
        ),
      ],
    );
  }
}
