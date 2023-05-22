import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nan_banking_app_mai_project/src/routes/app_pages.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/Constant.dart';
import 'package:nan_banking_app_mai_project/src/views/widgets/lib/models/rive_asset.dart';
import 'package:nan_banking_app_mai_project/src/views/widgets/lib/utils/rive_utils.dart';
import 'package:rive/rive.dart';

import 'info_card.dart';
import 'side_menu_tile.dart';

// Welcome to the Episode 5
class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  RiveAsset selectedMenu = sideMenus.first;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        // color: const Color(0xFF17203A),
        color: const Color(0xFF17203A),
        child: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SizedBox(
              //   height: 40,
              // ),
              Container(
                width: size.width,
                height: size.height / 7.80, //124.32900432900433
                decoration: BoxDecoration(
                    // color: Cst.kPrimary2Color,
                    ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: const InfoCard(
                    name: "Vianney Anibe",
                    profession: "Devéloppeur Mobile Flutter",
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 24, //
                  top: 32, //
                  bottom: 16, //
                ),
                child: Text(
                  "Navigation".toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white70),
                ),
              ),
              ...sideMenus.map(
                (menu) => SideMenuTile(
                  menu: menu,
                  riveonInit: (artboard) {
                    // Let me show you if user click on the menu how to show the animation
                    StateMachineController controller =
                        RiveUtils.getRiveController(artboard,
                            stateMachineName: menu.stateMachineName);
                    menu.input = controller.findSMI("active") as SMIBool;
                    // See as we click them it start animate
                  },
                  press: () {
                    menu.input!.change(true);
                    Future.delayed(const Duration(seconds: 1), () {
                      menu.input!.change(false);
                    });
                    setState(() {
                      selectedMenu = menu;
                    });
                    print(
                        "<___________________ ${size.width} _____________________>");
                    print(
                        "<___________________ ${size.height} _____________________>");
                    print(
                        "<___________________ ${size.height * 0.006} _____________________>");
                    if (menu.title == "Service client") {
                      Get.toNamed(Routes.MESSAGERIE);
                    } else if (menu.title == "Accueil") {
                      Get.toNamed(Routes.HOME);
                    } else if (menu.title == "Recherche") {
                      Get.toNamed(Routes.TRANSFERT);
                    } else if (menu.title == "Favoris") {
                      Get.toNamed(Routes.EPARGNE);
                    }
                  },
                  isActive: selectedMenu == menu,
                ),
              ),
              // SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left: 24, top: 18, bottom: 16),
                child: Text(
                  "Historique".toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.white70),
                ),
              ),
              ...sideMenu2.map(
                (menu) => SideMenuTile(
                  menu: menu,
                  riveonInit: (artboard) {
                    // Let me show you if user click on the menu how to show the animation
                    StateMachineController controller =
                        RiveUtils.getRiveController(artboard,
                            stateMachineName: menu.stateMachineName);
                    menu.input = controller.findSMI("active") as SMIBool;
                    // See as we click them it start animate
                  },
                  press: () {
                    menu.input!.change(true);
                    Future.delayed(const Duration(seconds: 1), () {
                      menu.input!.change(false);
                    });
                    setState(() {
                      selectedMenu = menu;
                    });
                    print(
                        "<___________________ ${menu.title} _____________________>");
                    if (menu.title == "Historique") {
                      Get.toNamed(Routes.STATISTIC);
                    } else if (menu.title == "Notifications") {
                      Get.toNamed(Routes.PROFILE);
                    }
                  },
                  isActive: selectedMenu == menu,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 40, top: 10, bottom: 6, right: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/img/logo.png",
                          width: 18,
                          color: Colors.white38,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        const Text(
                          "NaWari",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white38,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/img/logoNaN.png",
                          width: 15,
                          color: Colors.white38,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        const Text(
                          "NaN Academy",
                          style: TextStyle(
                            fontSize: 11,
                            color: Colors.white38,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 5,
              ),

              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Cst.kprimary4Color,
                      border: Border.all(
                        color: Color(0xFF17203A),
                        width: 1.0,
                        style: BorderStyle.solid,
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Gagner 1.000 FCFA par invité",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 9,
                      ),
                      const Text(
                        "Vous recevrez 1.000 FCFA la premiere fois que votre \ninvité effectue un paiement avec NaWari",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.black38,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Code de parrainage: ANI225",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.5,
                        height: 35,
                        decoration: BoxDecoration(
                            color: Cst.kprimary3Color,
                            borderRadius: BorderRadius.circular(50),
                            boxShadow: const <BoxShadow>[
                              BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 1.0,
                                  offset: Offset(0.0, 0.75))
                            ]),
                        child: const Center(
                            child: Text(
                          "Inviter un ami",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
