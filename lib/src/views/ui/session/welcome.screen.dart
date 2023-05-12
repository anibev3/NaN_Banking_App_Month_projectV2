import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
        // backgroundColor: Cst.kPrimary2Color,
        backgroundColor: Color(0xFF21899C),
        body: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          // color: Colors.white,
          child: Stack(children: [
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
            // right side background design. I use a svg image here
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
            Center(
              child: SizedBox(
                  width: 200,
                  height: Get.height * 0.8,
                  child: Column(
                    children: [
                      Expanded(child: Container()),
                      ColorFiltered(
                          colorFilter: ColorFilter.mode(
                              Cst.kNeutreColor, BlendMode.srcIn),
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
                          Get.toNamed(Routes.LOGIN);
                        },
                        style: ButtonCss.dndefaultOutlineButtonStyle(
                            borderColor: Colors.grey.shade800,
                            width: Get.width),
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
          ]),
        ));
  }
}
