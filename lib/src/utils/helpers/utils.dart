import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nan_banking_app_mai_project/src/utils/helpers/alert_message.dart';
import 'package:nan_banking_app_mai_project/src/utils/helpers/circular_loader.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/parametre/views/global_constants.dart';

// class Utils {
// static var instance;

void showAlertMessage(
    {required BuildContext context,
    required String title,
    required String message,
    required VoidCallback onTap}) {
  showDialog(
    context: context,
    builder: (context) =>
        AlertMessage(title: title, message: message, onTap: onTap),
  );
}

void showErrorMessage(
    {required BuildContext context,
    required String title,
    required String message,
    required VoidCallback onTap}) {
  showDialog(
    context: context,
    builder: (context) => AlertMessage(
      title: title,
      message: message,
      onTap: onTap,
      alertImage: "assets/img/error_image.png",
    ),
  );
}

void showTimeOutError({
  required BuildContext context,
  required String title,
  required String message,
  bool popDialogAndLoader = false,
}) {
  showDialog(
    context: context,
    builder: (context) => AlertMessage(
      title: title,
      // "Erreur!",
      message: message,
      //  "Mot de passe incorect",
      onTap: () {
        if (popDialogAndLoader == false) {
          Navigator.pop(context);
        } else {
          Navigator.pop(context);
          Navigator.of(context, rootNavigator: true).pop('dialog');
        }
      },
      alertImage: "assets/icons/info-circle.png",
    ),
  );
}

void showSessionExpiredDialog({
  required BuildContext context,
  required VoidCallback onTap,
}) {
  showDialog(
    context: context,
    builder: (context) => AlertMessage(
      title: "Time Out",
      message: "Session expired. Please login again",
      onTap: onTap,
      alertImage: "assets/icons/info-circle.png",
    ),
  );
}

void showNoInternetError({
  required BuildContext context,
  bool popDialogAndLoader = false,
}) {
  showDialog(
    context: context,
    builder: (context) => AlertMessage(
      title: "No Internet",
      message: "Please connect to the internet",
      onTap: () {
        if (popDialogAndLoader == false) {
          Navigator.pop(context);
        } else {
          Navigator.pop(context);
          Navigator.of(context, rootNavigator: true).pop('dialog');
        }
      },
      alertImage: "assets/img/no-internet.png",
      buttonColor: Colors.red,
    ),
  );
}

void showDialogLoader(
  BuildContext context,
// bool onWillPop
) {
  showDialog(
    context: context,
    builder: (context) => WillPopScope(
      onWillPop: () async => false,
      child: Center(
        child: AlertDialog(
          backgroundColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          shadowColor: Colors.transparent,
          elevation: 0,
          content: Center(
            child: Container(
              height: heightValue80,
              width: heightValue80,
              decoration: const BoxDecoration(color: whiteColor),
              child: const CircularLoader(),
            ),
          ),
        ),
      ),
    ),
  );
}

void showSnackBar(BuildContext context, String text) {}

void showMaterialBanner({
  required BuildContext context,
  required String image,
  required String description,
  required String amount,
  required Color amountColor,
  String prefix = "",
  String shortDesc = '',
  bool isFromTo = true,
}) {
  ScaffoldMessenger.of(context).showMaterialBanner(
    MaterialBanner(
      shadowColor: Colors.transparent,
      elevation: 10,
      content: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  image,
                  height: heightValue100,
                ),
                Column(
                  children: [
                    Text(
                      description,
                      style: TextStyle(
                        fontSize: heightValue23,
                        color: defaultAppColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          prefix,
                          style: TextStyle(
                            fontSize: heightValue18,
                          ),
                        ),
                        Text(
                          shortDesc,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: heightValue18,
                            fontWeight:
                                isFromTo ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  amount,
                  style: TextStyle(
                    color: amountColor,
                    fontSize: heightValue24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white.withOpacity(0.7),
      actions: const [Text("")],
    ),
  );
}
// }

class CurvedContainerPath extends CustomPainter {
  final bool isFirst;
  CurvedContainerPath({
    required this.isFirst,
  });

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint0 = Paint()
      ..color = isFirst ? const Color(0xFFEBB850) : const Color(0xFF2248A9)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;

    Path path0 = Path();
    path0.moveTo(size.width * 0.4167167, 0);
    path0.lineTo(size.width, 0);
    path0.quadraticBezierTo(size.width * 0.9995000, size.height * 0.3935055,
        size.width, size.height * 0.6614251);
    path0.cubicTo(
        size.width * 0.8579167,
        size.height * 0.2007339,
        size.width * 0.6047750,
        size.height * 0.5215759,
        size.width * 0.4330167,
        size.height * 0.1192999);
    path0.quadraticBezierTo(size.width * 0.3838583, size.height * -0.0282123,
        size.width * 0.4167167, 0);
    path0.close();

    canvas.drawPath(path0, paint0);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
