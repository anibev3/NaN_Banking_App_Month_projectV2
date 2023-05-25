import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nan_banking_app_mai_project/src/routes/app_pages.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/Constant.dart';

class PaiementSuccess extends StatelessWidget {
  const PaiementSuccess({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Get.toNamed(Routes.HOME);
            },
            icon: const Icon(
              Icons.close,
              color: Colors.black38,
            )),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right: 10),
        //     child: IconButton(
        //         onPressed: () {
        //           Navigator.of(context).pop();
        //         },
        //         icon: const Icon(
        //           Icons.menu,
        //           color: Colors.black38,
        //         )),
        //   ),
        // ],
      ),
      body: SafeArea(
        child: SizedBox(
          height: size.height,
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 110, top: 30),
                      child: Image.asset("assets/img/Vector.png"),
                    ),
                    Image.asset("assets/img/Vector (2).png"),
                    Center(
                      child: Image.asset(
                        "assets/img/Illustration(1).png",
                        color: Cst.kPrimary2Color,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Text(
                    "Succes",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 44,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Text(
                    "Votre transaction s’est déroulé avec succès",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      // fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "17 MAI 2023 à 01h51",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 200,
                ),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(Routes.HOME);
                  },
                  child: Container(
                    width: 250,
                    height: 55,
                    decoration: BoxDecoration(
                        color: Cst.kPrimary2Color,
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Text(
                        "Accueil",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
