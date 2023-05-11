import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/Constant.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/app_text_style.dart';
import 'package:nan_banking_app_mai_project/src/views/widgets/back_button_widget.dart';

class OtpLoginScreen extends StatelessWidget {
  const OtpLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
      child: SizedBox(
        height: Get.height * 0.9,
        width: Get.width,
        child: Column(
          children: [
            SizedBox(height: Get.height * 0.1),
            SizedBox(
              width: 180,
              height: 180,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: ColorFiltered(
                  child: Image.asset(
                    "assets/img/logo.png",
                  ),
                  colorFilter: ColorFilter.mode(Colors.white, BlendMode.dst),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),

            ///Page Title
            Text("Entrez votre otp ",
                textAlign: TextAlign.center, style: TextCss.hStyle(Cst.k3xl)),

            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: Cst.kxl),
              child: Text("Veuillez saisir le OTP reçu par SMS",
                  // " \n +${vaController.currentUser.value.utilisateurcontact}",
                  textAlign: TextAlign.center,
                  style: TextCss.dyncoloredNormalStyle(Colors.black, Cst.klg)),
            ),
            const SizedBox(
              height: 20,
            ),
            OtpTextField(
              numberOfFields: 5,
              borderColor: Color(0xFF512DA8),
              //set to true to show as box or false to show as dash
              showFieldAsBox: true,
              //runs when a code is typed in
              onCodeChanged: (String code) {
                //handle validation or checks here
              },
              //runs when every textfield is filled
              onSubmit: (String verificationCode) {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Verification Code"),
                        content: Text('Code entered is $verificationCode'),
                      );
                    });
              }, // end onSubmit
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: Cst.k6xl * 2.3),
            //   child: PinFieldAutoFill(
            //     // controller: controller.tecOtp,
            //     codeLength: 4,
            //     decoration: BoxLooseDecoration(
            //         radius: Radius.circular(Cst.kDefaultRaduis),
            //         strokeColorBuilder: FixedColorBuilder(Colors.black),
            //         bgColorBuilder: FixedColorBuilder(Colors.white),
            //         // colorBuilder: FixedColorBuilder(Colors.black),
            //         textStyle: TextCss.fnh2Style(Colors.black)),
            //     // onCodeChanged: (val) {
            //     // if (kDebugMode) {
            //     //   print(
            //     //       "<____________________________________ $val ___________________________________>");
            //     // }
            //     // if (val != null && val.length == 4) {
            //     //   controller.validateAccount();
            //     // }
            //     // },
            //   ),
            // ),
            Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: TextButton(
                  onPressed: () {
                    // resume OTP
                    // controller.renewOTP();
                  },
                  child: Text("renvoyez le OTP",
                      style: TextCss.dynbtnTextStyle(
                          color: Colors.black, size: Cst.kbase)),
                )),
            Expanded(
              child: Container(),
            ),
            BlackbuttonWidget(
                isloading: false,
                text: "Suivant",
                onTap: () {
                  // controller.submit();
                  // controller.validateAccount();
                }),

            Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                child: TextButton(
                  onPressed: () {
                    // controller.cancelValidation();
                  },
                  child: Text("annuler", style: TextCss.btnTextStyle),
                )),
            const SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    )));
  }
}
