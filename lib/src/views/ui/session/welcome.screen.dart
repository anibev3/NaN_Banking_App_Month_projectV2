// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:nan_banking_app_mai_project/src/routes/app_pages.dart';
// import 'package:nan_banking_app_mai_project/src/utils/themes/Constant.dart';
// import 'package:nan_banking_app_mai_project/src/utils/themes/app_button_style.dart';
// import 'package:nan_banking_app_mai_project/src/utils/themes/app_text_style.dart';
// import 'package:unicons/unicons.dart';

// class WelcomeScreen extends StatelessWidget {
//   const WelcomeScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         // backgroundColor: Cst.kPrimary2Color,
//         backgroundColor: Color(0xFF21899C),
//         body: SizedBox(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height,
//           // color: Colors.white,
//           child: Stack(children: [
//             Positioned(
//               left: -34,
//               top: 181.0,
//               child: SvgPicture.string(
//                 // Group 3178
//                 '<svg viewBox="-34.0 181.0 99.0 99.0" ><path transform="translate(-34.0, 181.0)" d="M 74.25 0 L 99 49.5 L 74.25 99 L 24.74999618530273 99 L 0 49.49999618530273 L 24.7500057220459 0 Z" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-26.57, 206.25)" d="M 0 0 L 42.07500076293945 16.82999992370605 L 84.15000152587891 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(15.5, 223.07)" d="M 0 56.42999649047852 L 0 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
//                 width: 99.0,
//                 height: 99.0,
//               ),
//             ),
//             // right side background design. I use a svg image here
//             Positioned(
//               right: -52,
//               top: 45.0,
//               child: SvgPicture.string(
//                 // Group 3177
//                 '<svg viewBox="288.0 45.0 139.0 139.0" ><path transform="translate(288.0, 45.0)" d="M 104.25 0 L 139 69.5 L 104.25 139 L 34.74999618530273 139 L 0 69.5 L 34.75000762939453 0 Z" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(298.42, 80.45)" d="M 0 0 L 59.07500076293945 23.63000106811523 L 118.1500015258789 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(357.5, 104.07)" d="M 0 79.22999572753906 L 0 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
//                 width: 139.0,
//                 height: 139.0,
//               ),
//             ),
//             Center(
//               child: SizedBox(
//                   width: 200,
//                   height: Get.height * 0.8,
//                   child: Column(
//                     children: [
//                       Expanded(child: Container()),
//                       ColorFiltered(
//                           colorFilter: ColorFilter.mode(
//                               Cst.kNeutreColor, BlendMode.srcIn),
//                           child: Image.asset(
//                             "assets/img/logo.png",
//                           )),
//                       Text(
//                         "NaWari",
//                         style: TextCss.whiteBoldStyle(55),
//                       ),
//                       Center(
//                         child: Text(
//                           "Transférer de l’argent facilement entre vos proche",
//                           textAlign: TextAlign.center,
//                           style: TextCss.whiteSemiBoldStyle(13),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 60,
//                       ),
//                       ElevatedButton.icon(
//                         onPressed: () {
//                           Get.toNamed(Routes.LOGIN);
//                         },
//                         style: ButtonCss.dndefaultOutlineButtonStyle(
//                             borderColor: Colors.grey.shade800,
//                             width: Get.width),
//                         label: Text("Commencer",
//                             style: TextCss.dyncoloredSBoldStyle(
//                                 Colors.grey.shade800, Cst.kbase)),
//                         icon: Icon(UniconsLine.arrow_right,
//                             color: Colors.grey.shade800),
//                       ),

//                       Expanded(child: Container()),
//                       // CircularProgressIndicator(
//                       //   color: Cst.kNeutreColor,
//                       // )
//                     ],
//                   )),
//             ),
//           ]),
//         ));
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nan_banking_app_mai_project/src/routes/app_pages.dart';
import 'package:nan_banking_app_mai_project/src/utils/helpers/utils.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/parametre/views/color_constants.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/parametre/views/custom_button.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/parametre/views/global_constants.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: value20),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: SizedBox(
                      width: isTablet ? screenWidth / 1.5 : screenWidth,
                      height: isTablet ? heightValue280 : heightValue275,
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: value20),
                            child: Container(
                              height: heightValue275,
                              width: screenWidth,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(value45),
                                color: const Color(0xFF2248A9),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: value10),
                            child: Container(
                              height: heightValue260,
                              width: screenWidth,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(value40),
                                  color: const Color(0xFFEBB850)),
                            ),
                          ),
                          Stack(
                            children: [
                              Container(
                                height: heightValue240,
                                width: screenWidth,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(value30),
                                  color: defaultAppColor,
                                ),
                                child: Image.asset(
                                  "assets/img/onBoardingImage.png",
                                ),
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(
                                      heightValue30,
                                    ),
                                  ),
                                  child: CustomPaint(
                                    size: Size(
                                      heightValue180,
                                      (heightValue180 * 0.5567901611328125)
                                          .toDouble(),
                                    ),
                                    painter: CurvedContainerPath(isFirst: true),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: heightValue100),
                            child: const Text("Envoyer & Reçevoir de l'argent"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: heightValue50,
                  ),
                  Text(
                    "Envoyer & Reçevoir de l'argent",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: heightValue30,
                    ),
                  ),
                  SizedBox(
                    height: heightValue10,
                  ),
                  Text(
                    "Envoyez ou recevez des paiements de vos comptes avec facilité et confort.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: heightValue18,
                      color: greyScale500,
                    ),
                  )
                ],
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.only(top: heightValue30),
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/img/full_logo.png",
                        height: heightValue100,
                      ),
                      SizedBox(
                        height: heightValue10,
                      ),
                      Text(
                        "La meilleure façon de transférer de l'argent en toute sécurité",
                        style: TextStyle(
                          fontSize: heightValue15,
                          color: greyScale500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: heightValue20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      CustomButton(
                          buttonText: "Créer un compte",
                          buttonColor: defaultAppColor,
                          buttonTextColor: whiteColor,
                          onTap: () {
                            Get.offAndToNamed(Routes.LOGIN);
                          }),
                      SizedBox(
                        height: heightValue10,
                      ),
                      TextButton(
                        onPressed: () {
                          Get.offAndToNamed(Routes.REGISTER);
                        },
                        child: Text(
                          "Vous avez déjâ un compte ?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: heightValue18,
                          ),
                        ),
                      )
                    ],
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
