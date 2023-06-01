import 'package:flutter/material.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/Constant.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/app_text_style.dart';

class IconEtText extends StatelessWidget {
  final IconData icon;
  final String text;
  // final Colors textColor;
  Color iconColor = Color(0xFFFC4A12);

  IconEtText({
    Key? key,
    required this.icon,
    required this.text,
    required this.iconColor,
    // required this.textColor
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: iconColor,
        ),
        SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: TextCss.dyncoloredBoldStyle(Cst.kprimary3Color, Cst.k10),
        )
      ],
    );
  }
}
