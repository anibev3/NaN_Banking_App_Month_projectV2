import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/Constant.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/app_global_style.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/app_text_style.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/parametre/views/custom_button.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/parametre/views/global_constants.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/parametre/views/profile_card.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/session/controller/login_controller.dart';
import 'package:unicons/unicons.dart';

class Profile extends StatefulWidget {
  Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
    // final user = Provider.of<UserProvider>(context).user;
    return Scaffold(
      backgroundColor: scaffoldBackgroundColor,
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: value20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // CircleAvatar(
            //   backgroundColor: Cst.kPrimary2Color,
            //   radius: value40,
            //   child: Center(
            //     child: Icon(UniconsLine.user),
            //     // Text(
            //     //   "Vainney Anibe",
            //     //   style: TextStyle(fontSize: value25),
            //     // ),
            //   ),
            // ),

            buildUserPicHeader(),

            SizedBox(
              height: heightValue20,
            ),

            SizedBox(
              height: heightValue20,
            ),
            ProfileCard(
              iconImage: "assets/icons/profile_icon.png",
              profileOperation: "Modifier profil",
              profileOperationDescription: "Information personnel, nom, etc",
              onPressed: () {
                // Navigator.pushNamed(context, CommingSoonScreen.route);
              },
            ),
            SizedBox(
              height: heightValue20,
            ),
            ProfileCard(
              iconImage: "assets/icons/settings_icon.png",
              profileOperation: "Sécurité",
              profileOperationDescription: "Mot de passe, Emprunte",
              onPressed: () {
                // Navigator.pushNamed(context, ChangeLoginPinScreen.route);
              },
            ),
            SizedBox(
              height: heightValue20,
            ),
            ProfileCard(
              iconImage: "assets/icons/logout_icon.png",
              profileOperation: "Se déconnecter",
              profileOperationDescription: "Se déconnecter de mon compte",
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          backgroundColor: whiteColor,
                          surfaceTintColor: whiteColor,
                          icon: Image.asset(
                            "assets/icons/info-circle.png",
                            height: value100,
                            width: value100,
                          ),
                          title: Text("Caution",
                              style: TextStyle(
                                fontSize: value18,
                                fontWeight: FontWeight.bold,
                              )),
                          content: Text(
                            "Êtes-vous sûr de vouloir vous déconnecter ?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: heightValue15,
                              color: Colors.grey[600],
                            ),
                          ),
                          actions: <Widget>[
                            CustomButton(
                              buttonText: "Oui",
                              onTap: () {
                                loginController.logOut_();
                              },
                              buttonColor: Colors.red,
                              buttonTextColor: whiteColor,
                            ),
                            SizedBox(
                              height: heightValue10,
                            ),
                            CustomButton(
                              buttonText: "Annuler",
                              onTap: () {
                                Navigator.pop(context);
                              },
                              buttonColor: defaultAppColor,
                              buttonTextColor: whiteColor,
                            )
                          ],
                        ));
              },
            ),
          ],
        ),
      )),
    );
  }

  Widget buildUserPicHeader() {
    return Container(
      width: 250,
      // decoration: BoxDecoration(color: Colors.red),
      child: ListTile(
        onTap: () {
          // Get.toNamed(Routes.UPDATEPROFILE);
        },
        contentPadding: EdgeInsets.symmetric(horizontal: 0),
        // trailing: Icon(UniconsLine.pen, color: Colors.black),
        leading: Container(
          padding: EdgeInsets.all(1.3),
          margin: EdgeInsets.all(1),
          decoration:
              GlobalCss.blackBox(Colors.red.shade700, rad: Cst.kMaxRaduis * 2),
          child:
              // Obx(() => Visibility(
              //       visible: controller.currentUser.value.avatar != null &&
              //           controller.currentUser.value.avatar != "",
              // replacement:
              Container(
            width: 50,
            height: 50,
            decoration: GlobalCss.containerStyle(Colors.grey.shade700,
                rad: Cst.kMaxRaduis * 100),
            child: const Icon(UniconsLine.user, size: 30, color: Colors.white),
          ),
          // child: GFAvatar(
          //   backgroundColor: Colors.amber,
          // backgroundImage: NetworkImage(
          //     ImgeHelper.imgPath(controller.currentUser.value.avatar)),
          // ),
          // )),
        ),
        title: Text(
          "$userConnectedPrenoms $userConnectedNom",
          style: TextCss.dyncoloredBoldStyle(Colors.black, Cst.kxl),
        ),
        subtitle: Text(
            "Email: $userConnectedEmail \nTel: +225 $userConnectedContact\nN° de compte: $userConnectedID"),
      ),
    );
  }
}
