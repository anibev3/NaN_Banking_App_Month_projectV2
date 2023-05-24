import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nan_banking_app_mai_project/src/routes/app_pages.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/Constant.dart';

class PaiementFailed extends StatelessWidget {
  const PaiementFailed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      "assets/img/Illustration.png",
                      color: Cst.kprimary3Color,
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  "Paiement Echoué",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 40,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 3),
                child: Text(
                  "Quelque chose s’est passé une notification concernant l’erreur vous sera envoyé",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.HOME);
                    },
                    child: Container(
                      width: 130,
                      height: 55,
                      decoration: BoxDecoration(
                          color: Cst.kprimary3Color,
                          borderRadius: BorderRadius.circular(30)),
                      child: Center(
                        child: Text(
                          "Accueil",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            // fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 55,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30)),
                    child: Center(
                      child: Text(
                        "Service client",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          // fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 17,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              InkWell(
                onTap: () {
                  Get.toNamed(Routes.HOME);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 55,
                  decoration: BoxDecoration(
                      color: Cst.kprimary3Color,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Text(
                      "Accueil",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
