import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/Constant.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/app_text_style.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/parametre/views/global_constants.dart';
import 'package:unicons/unicons.dart';

class CommingSoonScreen extends StatelessWidget {
  const CommingSoonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: value30),
            child: Column(
              children: [
                const SizedBox(height: 10),
                buildHeader(),
                SizedBox(
                  height: heightValue30,
                ),
                Image.asset(
                  "assets/img/full_logo.png",
                  height: value145,
                ),
                SizedBox(
                  height: heightValue20,
                ),
                Text(
                  "Comming Soon",
                  style: TextStyle(
                    fontSize: value25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: heightValue20,
                ),
                Image.asset("assets/img/empty_list.png"),
                SizedBox(
                  height: heightValue20,
                ),
                Text(
                  "This feature is Comming Soon. Stay tuned",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: value25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHeader() {
    return SizedBox(
      height: 60,
      width: Get.width,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(UniconsLine.arrow_left)),
        Text(
          "",
          style: TextCss.dyncoloredBoldStyle(Colors.black, Cst.k2xl),
        ),
        SizedBox(
          width: 40,
        )
      ]),
    );
  }
}
