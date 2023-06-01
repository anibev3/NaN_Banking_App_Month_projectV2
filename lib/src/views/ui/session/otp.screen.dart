import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:nan_banking_app_mai_project/src/routes/app_pages.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/Constant.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/app_text_style.dart';
import 'package:nan_banking_app_mai_project/src/views/widgets/back_button_widget.dart';

class OtpLoginScreen extends StatelessWidget {
  const OtpLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Cst.kPrimary2Color,
        body: SafeArea(
            child: SingleChildScrollView(
          child: Stack(children: [
            //left side background design. I use a svg image here
            Positioned(
              left: -34,
              top: 181.0,
              child: SvgPicture.string(
                // Group 3178
                '<svg viewBox="-34.0 181.0 99.0 99.0" ><path transform="translate(-34.0, 181.0)" d="M 74.25 0 L 99 49.5 L 74.25 99 L 24.74999618530273 99 L 0 49.49999618530273 L 24.7500057220459 0 Z" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-26.57, 206.25)" d="M 0 0 L 42.07500076293945 16.82999992370605 L 84.15000152587891 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(15.5, 223.07)" d="M 0 56.42999649047852 L 0 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                width: 99.0,
                height: 99.0,
              ),
            ),

            //right side background design. I use a svg image here
            Positioned(
              right: -52,
              top: 45.0,
              child: SvgPicture.string(
                // Group 3177
                '<svg viewBox="288.0 45.0 139.0 139.0" ><path transform="translate(288.0, 45.0)" d="M 104.25 0 L 139 69.5 L 104.25 139 L 34.74999618530273 139 L 0 69.5 L 34.75000762939453 0 Z" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(298.42, 80.45)" d="M 0 0 L 59.07500076293945 23.63000106811523 L 118.1500015258789 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(357.5, 104.07)" d="M 0 79.22999572753906 L 0 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                width: 139.0,
                height: 139.0,
              ),
            ),

            SizedBox(
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
                          color: Colors.white,
                        ),
                        colorFilter:
                            ColorFilter.mode(Colors.white, BlendMode.dst),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),

                  ///Page Title
                  Text("Entrez votre otp ",
                      textAlign: TextAlign.center,
                      style: TextCss.hStyle(Cst.k3xl)),

                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: Cst.kxl),
                    child: Text("Veuillez saisir le OTP reçu par SMS",
                        // " \n +${vaController.currentUser.value.utilisateurcontact}",
                        textAlign: TextAlign.center,
                        style: TextCss.dyncoloredNormalStyle(
                            Colors.white, Cst.klg)),
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
                              content:
                                  Text('Code entered is $verificationCode'),
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
                                color: Colors.white, size: Cst.kbase)),
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
                        Get.toNamed(Routes.HOME);
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
          ]),
        )));
  }
}
