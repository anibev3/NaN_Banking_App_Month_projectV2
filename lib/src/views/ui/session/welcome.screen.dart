import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nan_banking_app_mai_project/src/routes/app_pages.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/Constant.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/app_button_style.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/app_text_style.dart';
import 'package:unicons/unicons.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Cst.kPrimaryColor,
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          // color: Colors.white,
          child: Center(
            child: SizedBox(
                width: 200,
                height: Get.height * 0.8,
                child: Column(
                  children: [
                    Expanded(child: Container()),
                    ColorFiltered(
                        colorFilter:
                            ColorFilter.mode(Cst.kNeutreColor, BlendMode.srcIn),
                        child: Image.asset(
                          "assets/img/logo.png",
                        )),
                    Text(
                      "NaWari",
                      style: TextCss.whiteBoldStyle(55),
                    ),
                    Center(
                      child: Text(
                        "Transférer de l’argent facilement entre vos proche",
                        textAlign: TextAlign.center,
                        style: TextCss.whiteSemiBoldStyle(13),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        Get.toNamed(Routes.REGISTER);
                      },
                      style: ButtonCss.dndefaultOutlineButtonStyle(
                          borderColor: Colors.grey.shade800, width: Get.width),
                      label: Text("Commencer",
                          style: TextCss.dyncoloredSBoldStyle(
                              Colors.grey.shade800, Cst.kbase)),
                      icon: Icon(UniconsLine.arrow_right,
                          color: Colors.grey.shade800),
                    ),

                    Expanded(child: Container()),
                    // CircularProgressIndicator(
                    //   color: Cst.kNeutreColor,
                    // )
                  ],
                )),
          ),
        ));
  }
}
