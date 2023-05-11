import 'package:flutter/material.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/Constant.dart';

class ButtonCss {
  static ButtonStyle defaultButtonStyle(Color bgcolor) =>
      ElevatedButton.styleFrom(
          backgroundColor: bgcolor,
          minimumSize: Size(170, 40),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(Cst.k2xl)),
          ),
          side: BorderSide(
            color: Colors.transparent,
            width: 1,
          ),
          elevation: 1);

  static ButtonStyle defaultSquaredButtonStyle(Color bgcolor) =>
      ElevatedButton.styleFrom(
          backgroundColor: bgcolor,
          padding: EdgeInsets.symmetric(horizontal: 5),
          minimumSize: Size(60, 40),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(0)),
          ),
          // side: BorderSide(
          //   color: Colors.transparent,
          //   width: 1,
          // ),
          elevation: 0);

  static ButtonStyle dyndefaultButtonStyle(Color bgcolor,
          {double height = 40.0, double width = 170, double raduis = 8}) =>
      ElevatedButton.styleFrom(
          backgroundColor: bgcolor,
          minimumSize: Size(width, height),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(raduis)),
          ),
          side: BorderSide(
            color: Colors.transparent,
            width: 1,
          ),
          elevation: 1);

  static ButtonStyle defaultIconButtonStyle(Color bgcolor) =>
      ElevatedButton.styleFrom(
          backgroundColor: bgcolor,
          minimumSize: Size(20, 40),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          side: BorderSide(
            color: Colors.transparent,
            width: 1,
          ),
          elevation: 1);

  static ButtonStyle dyndefaultIconButtonStyle(Color bgcolor,
          {double height = 40.0, double width = 170, double raduis = 8}) =>
      ElevatedButton.styleFrom(
          backgroundColor: bgcolor,
          fixedSize: Size(width, height),
          minimumSize: Size(20, 40),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(raduis)),
          ),
          side: BorderSide(
            color: Colors.transparent,
            width: 1,
          ),
          padding: EdgeInsets.all(height / 10),
          elevation: 1);

  static ButtonStyle defaultOutlineButtonStyle(
          {Color bgcolor = Colors.white, borderColor = Colors.white}) =>
      ElevatedButton.styleFrom(
          backgroundColor: bgcolor,
          minimumSize: Size(170, 40),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          side: BorderSide(
            color: borderColor,
            width: 1,
          ),
          elevation: 0);

  static ButtonStyle dndefaultOutlineButtonStyle(
          {Color bgcolor = Colors.white,
          borderColor = Colors.white,
          double height = 40.0,
          double width = 170}) =>
      ElevatedButton.styleFrom(
          backgroundColor: bgcolor,
          minimumSize: Size(width, height),
          maximumSize: Size(width, height),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          side: BorderSide(
            color: borderColor,
            width: 1,
          ),
          elevation: 1);
}
