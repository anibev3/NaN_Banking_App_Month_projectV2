import 'package:flutter/material.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/Constant.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/app_text_style.dart';

class FormCss {
  static InputDecoration defaultInputStyle(String label, String hint,
          {Widget? prefix, Widget? suffix, double? borderStroke}) =>
      InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blueGrey.shade100,
            width: borderStroke ?? 2,
          ),
          borderRadius: BorderRadius.circular(Cst.kDefaultRaduis),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue.shade600,
            width: borderStroke ?? 2,
          ),
          borderRadius: BorderRadius.circular(Cst.kDefaultRaduis),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Cst.kDangerColor,
            width: borderStroke ?? 2,
          ),
          borderRadius: BorderRadius.circular(Cst.kDefaultRaduis),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Cst.kDangerColor.withOpacity(0.6),
            width: borderStroke ?? 2,
          ),
          borderRadius: BorderRadius.circular(Cst.kDefaultRaduis),
        ),
        labelStyle: TextCss.normalStyle,
        hintStyle: TextCss.normalStyle,
        contentPadding: const EdgeInsetsDirectional.fromSTEB(15, 5, 10, 5),
        hintText: hint,
        suffixIcon: suffix,
        prefixIcon: prefix,
      );

  static InputDecoration noneInputStyle(String label, String hint,
          {Widget? prefix, double? borderStroke}) =>
      InputDecoration(
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade300,
            width: borderStroke ?? 1,
          ),
          // borderRadius: BorderRadius.circular(Cst.kDefaultRaduis),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: borderStroke ?? 1,
          ),
          // borderRadius: BorderRadius.circular(Cst.kDefaultRaduis),
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Cst.kDangerColor,
            width: borderStroke ?? 1,
          ),
          // borderRadius: BorderRadius.circular(Cst.kDefaultRaduis),
        ),
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Cst.kDangerColor.withOpacity(0.6),
            width: borderStroke ?? 1,
          ),
          // borderRadius: BorderRadius.circular(Cst.kDefaultRaduis),
        ),
        labelStyle: TextCss.normalStyle,
        hintStyle: TextCss.normalStyle,
        contentPadding: const EdgeInsetsDirectional.fromSTEB(5, 1, 10, 1),
        hintText: hint,
        prefixIcon: prefix,
      );

  static InputDecoration borderedInputStyle(String label, String hint) =>
      InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade500,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(Cst.kBorderRaduis),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.blue.shade400,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(Cst.kBorderRaduis),
          ),
          labelStyle: TextCss.normalStyle,
          labelText: label,
          hintText: hint);

  static InputDecoration borderedDefaultInputStyle(String label, String hint,
          {Color? fillColor,
          Widget? mypassword,
          Widget? prefix,
          double? rad}) =>
      InputDecoration(
          labelText: label,
          labelStyle: TextCss.normalStyle,
          hintText: hint,
          hintStyle: TextCss.lightStyle,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey.shade500,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(rad ?? Cst.kBorderRaduis),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue.shade400, width: 1),
            borderRadius: BorderRadius.circular(rad ?? Cst.kBorderRaduis),
          ),
          filled: true,
          fillColor: fillColor,
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Cst.kDangerColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(rad ?? Cst.kBorderRaduis),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Cst.kDangerColor.withOpacity(0.6),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(rad ?? Cst.kBorderRaduis),
          ),
          contentPadding: EdgeInsetsDirectional.fromSTEB(30, 10, 10, 10),
          prefixIcon: prefix,
          suffixIcon: mypassword);

  static InputDecoration outlinedDefaultInputStyle(String label, String hint,
          {Color? fillColor, Widget? sufix, Widget? prefix, double? rad}) =>
      InputDecoration(
          labelText: label,
          labelStyle: TextCss.lightStyle,
          hintText: hint,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          hintStyle: TextCss.lightStyle,
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(rad ?? Cst.kBorderRaduis),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.transparent, width: 1),
            borderRadius: BorderRadius.circular(rad ?? Cst.kBorderRaduis),
          ),
          filled: true,
          fillColor: Colors.white,
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Cst.kDangerColor,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(rad ?? Cst.kBorderRaduis),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Cst.kDangerColor.withOpacity(0.6),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(rad ?? Cst.kBorderRaduis),
          ),
          contentPadding:
              EdgeInsetsDirectional.fromSTEB(prefix == null ? 15 : 30, 2, 0, 0),
          prefixIcon: prefix,
          suffixIcon: sufix);

  static InputDecoration transparentInputStyle() => InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(Cst.kDefaultRaduis),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(Cst.kDefaultRaduis),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(Cst.kDefaultRaduis),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(Cst.kDefaultRaduis),
        ),
        labelStyle: TextCss.normalStyle,
        hintStyle: TextCss.normalStyle,
        contentPadding: const EdgeInsetsDirectional.fromSTEB(15, 5, 10, 0),
      );
}
