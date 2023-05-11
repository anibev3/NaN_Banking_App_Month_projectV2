import 'package:flutter/material.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/Constant.dart';

class GlobalCss {
  static BoxDecoration containerStyle(Color bgcolor,
          {rad: Cst.kBorderRaduis,
          bool topOnly = false,
          BoxShadow? shadow,
          Border? border}) =>
      BoxDecoration(
          border: border,
          borderRadius: topOnly
              ? BorderRadius.vertical(top: Radius.circular(rad))
              : BorderRadius.all(Radius.circular(rad)),
          color: bgcolor,
          boxShadow: [
            shadow ??
                BoxShadow(
                    blurRadius: rad / 4,
                    color: Colors.black.withOpacity(0.1),
                    offset: Offset(0, 0))
          ]);

  static BoxDecoration containerStyleWithoutShadow(Color bgcolor,
          {rad: Cst.kBorderRaduis, Border? border}) =>
      BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(rad)),
        color: bgcolor,
        border: border,
      );

  static BoxDecoration blackBox(Color bgcolor, {rad: Cst.kBorderRaduis}) =>
      BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(rad)),
          color: bgcolor,
          // border: Border.all(color: kGrayBg, width: 2),
          boxShadow: [
            BoxShadow(
                blurRadius: Cst.kBorderRaduis / 4,
                color: Colors.black.withOpacity(0.5),
                offset: Offset(0, 0))
          ]);

  static BoxDecoration cmdCard = BoxDecoration(color: Colors.white, boxShadow: [
    BoxShadow(
        color: Colors.grey.withOpacity(0.4), blurRadius: 2.0, spreadRadius: 1.0)
  ]);
}
