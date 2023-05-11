import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/Constant.dart';

class TextCss {
  static TextStyle bigTitreStyle = GoogleFonts.dmSans(
      color: Colors.black, fontSize: Cst.k2xl, fontWeight: FontWeight.bold);

  static TextStyle mediumTitreStyle = GoogleFonts.dmSans(
      wordSpacing: 2.0,
      color: Colors.black,
      fontSize: Cst.k2xl,
      fontWeight: FontWeight.w600);

  static TextStyle btnTextStyle = GoogleFonts.dmSans(
      color: Colors.black, fontSize: Cst.klg, fontWeight: FontWeight.w600);

  static TextStyle lightStyle = GoogleFonts.dmSans(
      color: Colors.grey.shade700,
      fontSize: Cst.kbase,
      fontWeight: FontWeight.normal);

  static TextStyle whiteBoldStyle(double taille) => GoogleFonts.dmSans(
      color: Colors.white, fontSize: taille, fontWeight: FontWeight.bold);

  static TextStyle whiteSemiBoldStyle(double taille) => GoogleFonts.lexendDeca(
      color: Colors.white, fontSize: taille, fontWeight: FontWeight.w500);

  static TextStyle buttonStyle = GoogleFonts.lexendDeca(
    color: Colors.blue.shade500,
    fontSize: 16,
    fontWeight: FontWeight.w500,
  );

//  ===============================================

  static TextStyle fnmediumTitreStyle(Color cl) => GoogleFonts.dmSans(
      color: cl, fontSize: Cst.k2xl, fontWeight: FontWeight.w600);

  static TextStyle h3blackStyle = GoogleFonts.dmSans(
      color: Colors.black, fontSize: Cst.klg, fontWeight: FontWeight.normal);

  static TextStyle hStyle(double taille) => GoogleFonts.dmSans(
      color: Colors.black, fontSize: taille, fontWeight: FontWeight.bold);

  static TextStyle fnh3Style(Color cl) => GoogleFonts.dmSans(
      color: cl, fontSize: Cst.klg, fontWeight: FontWeight.w600);

  static TextStyle fnh2Style(Color cl) => GoogleFonts.dmSans(
      color: cl, fontSize: Cst.k2xl, fontWeight: FontWeight.w600);

  static TextStyle fnh3OutfitStyle(Color cl) => GoogleFonts.dmSans(
      color: cl, fontSize: Cst.kxl, fontWeight: FontWeight.w600);

  static TextStyle coloredNormalStyle(Color cl) => GoogleFonts.dmSans(
      color: cl, fontSize: Cst.kbase, fontWeight: FontWeight.normal);

  static TextStyle coloredONormalStyle(Color cl) => GoogleFonts.openSans(
      color: cl, fontSize: Cst.kbase, fontWeight: FontWeight.normal);

  static TextStyle dyncoloredONormalStyle(Color cl, double size) =>
      GoogleFonts.openSans(
          color: cl, fontSize: size, fontWeight: FontWeight.normal);

  static TextStyle dyncoloredNormalStyle(Color cl, double size) =>
      GoogleFonts.dmSans(
          color: cl, fontSize: size, fontWeight: FontWeight.normal);

  static TextStyle dyncoloredBoldStyle(Color cl, double size,
          {bool isfalse = false}) =>
      GoogleFonts.dmSans(
          decorationThickness: 3,
          decoration:
              isfalse ? TextDecoration.lineThrough : TextDecoration.none,
          color: cl,
          fontSize: size,
          fontWeight: FontWeight.w800);

  static TextStyle dyncoloredSBoldStyle(Color cl, double size) =>
      GoogleFonts.dmSans(
          color: cl, fontSize: size, fontWeight: FontWeight.w500);

  static TextStyle dyncoloredSBoldBebaStyle(Color cl, double size) =>
      GoogleFonts.bebasNeue(
          color: cl, fontSize: size, fontWeight: FontWeight.w500);

  static TextStyle dynbtnTextStyle(
          {Color color = Colors.black, double size = Cst.klg}) =>
      GoogleFonts.dmSans(
          color: color, fontSize: size, fontWeight: FontWeight.w600);

  static TextStyle littleBigStyle = GoogleFonts.dmSans(
      color: Colors.black, fontSize: Cst.kxl, fontWeight: FontWeight.w600);

  static TextStyle normalStyle = GoogleFonts.dmSans(
      color: Colors.black, fontSize: Cst.kbase, fontWeight: FontWeight.normal);

  static TextStyle coloredOSmallStyle(Color cl) => GoogleFonts.openSans(
      color: cl, fontSize: Cst.ksm, fontWeight: FontWeight.normal);

  static TextStyle smallStyle = GoogleFonts.dmSans(
      color: Colors.black, fontSize: Cst.ksm, fontWeight: FontWeight.normal);
}
