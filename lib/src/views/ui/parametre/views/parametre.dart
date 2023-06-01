import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getwidget/getwidget.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/Constant.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/app_global_style.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/app_text_style.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/parametre/controller/parametre_controller.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/session/controller/login_controller.dart';
import 'package:unicons/unicons.dart';

class Parametre extends StatelessWidget {
  ParamsController paramsController = Get.put(ParamsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: Colors.white,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: Cst.k3xl),
          scrollDirection: Axis.vertical,
          children: [
            const SizedBox(height: 70),
            buildHeader(),
            const SizedBox(height: 15),
            // buildUserPicHeader(),
            const SizedBox(height: 15),
            Text("Gestion"),
            buildUserResidenceManage(),
            const SizedBox(height: 15),
            Text("Notifications"),
            buildUserNotificationSection(),
            const SizedBox(height: 15),
            Text("Compte"),
            buildUserCompteSection(),
          ],
        ),
      )),
      // bottomNavigationBar: const CustomBottomNavigationBar(
      // activeIndex: 4,
      // ),
    );
  }

  Widget buildHeader() {
    return SizedBox(
      height: 40,
      width: Get.width,
      child: Text(
        "Paramètre",
        style: TextCss.dyncoloredBoldStyle(Colors.black, Cst.k2xl),
      ),
    );
  }

  Widget buildUserResidenceManage() {
    return Column(
      children: [
        // ListTile(
        //   onTap: () {
        //     // Get.toNamed(Routes.CREATERESIDENCE);
        //   },
        //   contentPadding: EdgeInsets.symmetric(horizontal: 0),
        //   // trailing: Icon(UniconsLine.home_alt),
        //   leading: Container(
        //     padding: EdgeInsets.all(7),
        //     decoration:
        //         GlobalCss.blackBox(Colors.black, rad: Cst.kMaxRaduis * 2),
        //     child: Icon(UniconsLine.plus, color: Colors.white, size: 20),
        //   ),
        //   title: Text(
        //     "Ajouter residences",
        //     style: TextCss.dyncoloredSBoldStyle(Colors.black, Cst.klg),
        //   ),
        // ),
        ListTile(
          onTap: () {
            // Get.toNamed(Routes.MESRESIDENCES);
          },
          contentPadding: EdgeInsets.symmetric(horizontal: 0),
          trailing: Icon(UniconsLine.angle_right),
          leading: Container(
            padding: EdgeInsets.all(7),
            decoration: GlobalCss.blackBox(Colors.indigo.shade400,
                rad: Cst.kMaxRaduis * 2),
            child: Icon(UniconsLine.angle_right, color: Colors.white, size: 20),
          ),
          title: Text(
            "Mon gestionnaire",
            style: TextCss.dyncoloredSBoldStyle(Colors.black, Cst.klg),
          ),
        ),

        ListTile(
          onTap: () {
            // Get.toNamed(Routes.MESDEMANDES);
          },
          contentPadding: EdgeInsets.symmetric(horizontal: 0),
          trailing: Icon(UniconsLine.angle_right),
          leading: Container(
            padding: EdgeInsets.all(7),
            decoration: GlobalCss.blackBox(Colors.green.shade400,
                rad: Cst.kMaxRaduis * 2),
            child: Icon(UniconsLine.receipt_alt, color: Colors.white, size: 20),
          ),
          title: Text(
            "Liste des transactions",
            style: TextCss.dyncoloredSBoldStyle(Colors.black, Cst.klg),
          ),
        ),
        // ListTile(
        //   contentPadding: EdgeInsets.symmetric(horizontal: 0),
        //   trailing: Icon(UniconsLine.angle_right),
        //   leading: Container(
        //     padding: EdgeInsets.all(7),
        //     decoration: GlobalCss.blackBox(Colors.blue.shade600,
        //         rad: Cst.kMaxRaduis * 2),
        //     child: Icon(UniconsLine.comment_alt_message,
        //         color: Colors.white, size: 20),
        //   ),
        //   title: Text(
        //     "Mes conversations",
        //     style: TextCss.dyncoloredSBoldStyle(Colors.black, Cst.klg),
        //   ),
        // ),
      ],
    );
  }

  Widget buildUserNotificationSection() {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 0),
          trailing: GFToggle(
            onChanged: (val) {},
            value: true,
            type: GFToggleType.ios,
          ),
          leading: Container(
            padding: EdgeInsets.all(7),
            decoration: GlobalCss.blackBox(Colors.indigo.shade400,
                rad: Cst.kMaxRaduis * 2),
            child: Icon(UniconsLine.bell, color: Colors.white, size: 20),
          ),
          title: Text(
            "Notifications",
            style: TextCss.dyncoloredSBoldStyle(Colors.black, Cst.klg),
          ),
        ),
        // ListTile(
        //   contentPadding: EdgeInsets.symmetric(horizontal: 0),
        //   trailing: Icon(UniconsLine.angle_right),
        //   leading: Container(
        //     padding: EdgeInsets.all(7),
        //     decoration: GlobalCss.blackBox(Colors.blue.shade600,
        //         rad: Cst.kMaxRaduis * 2),
        //     child: Icon(UniconsLine.envelopes, color: Colors.white, size: 20),
        //   ),
        //   title: Text(
        //     "Boite de reception",
        //     style: TextCss.dyncoloredSBoldStyle(Colors.black, Cst.klg),
        //   ),
        // )
      ],
    );
  }

  buildUserCompteSection() {
    return Column(
      children: [
        ListTile(
          onTap: () {
            // Get.toNamed(Routes.FAVORISHOME);
          },
          contentPadding: EdgeInsets.symmetric(horizontal: 0),
          trailing: Icon(UniconsLine.angle_right),
          leading: Container(
            padding: EdgeInsets.all(7),
            decoration: GlobalCss.blackBox(Colors.orange.shade700,
                rad: Cst.kMaxRaduis * 2),
            child: Icon(UniconsLine.heart_alt, color: Colors.white, size: 20),
          ),
          title: Text(
            "Boite à suggestion",
            style: TextCss.dyncoloredSBoldStyle(Colors.black, Cst.klg),
          ),
        ),
        ListTile(
          onTap: () {
            paramsController.goToUpdatePinPage();
          },
          contentPadding: EdgeInsets.symmetric(horizontal: 0),
          trailing: Icon(UniconsLine.angle_right),
          leading: Container(
            padding: EdgeInsets.all(7),
            decoration: GlobalCss.blackBox(Colors.yellow.shade800,
                rad: Cst.kMaxRaduis * 2),
            child: Icon(UniconsLine.wrench, color: Colors.white, size: 20),
          ),
          title: Text(
            "Modifier mot de passe d'entré",
            style: TextCss.dyncoloredSBoldStyle(Colors.black, Cst.klg),
          ),
        ),
        ListTile(
          onTap: () {
            paramsController.goToTest1Page();
          },
          contentPadding: EdgeInsets.symmetric(horizontal: 0),
          trailing: Icon(UniconsLine.angle_right),
          leading: Container(
            padding: EdgeInsets.all(7),
            decoration: GlobalCss.blackBox(Colors.red.shade800,
                rad: Cst.kMaxRaduis * 2),
            child: Icon(UniconsLine.signout, color: Colors.white, size: 20),
          ),
          title: Text(
            "Test page 1",
            style: TextCss.dyncoloredSBoldStyle(Colors.black, Cst.klg),
          ),
        ),
        ListTile(
          onTap: () {
            paramsController.goToTest2Page();
          },
          contentPadding: EdgeInsets.symmetric(horizontal: 0),
          trailing: Icon(UniconsLine.angle_right),
          leading: Container(
            padding: EdgeInsets.all(7),
            decoration: GlobalCss.blackBox(Colors.red.shade800,
                rad: Cst.kMaxRaduis * 2),
            child: Icon(UniconsLine.signout, color: Colors.white, size: 20),
          ),
          title: Text(
            "Test page 2",
            style: TextCss.dyncoloredSBoldStyle(Colors.black, Cst.klg),
          ),
        ),
        ListTile(
          onTap: () {
            paramsController.goToTest3Page();
          },
          contentPadding: EdgeInsets.symmetric(horizontal: 0),
          trailing: Icon(UniconsLine.angle_right),
          leading: Container(
            padding: EdgeInsets.all(7),
            decoration: GlobalCss.blackBox(Colors.red.shade800,
                rad: Cst.kMaxRaduis * 2),
            child: Icon(UniconsLine.signout, color: Colors.white, size: 20),
          ),
          title: Text(
            "Test page 3",
            style: TextCss.dyncoloredSBoldStyle(Colors.black, Cst.klg),
          ),
        )
      ],
    );
  }
}
