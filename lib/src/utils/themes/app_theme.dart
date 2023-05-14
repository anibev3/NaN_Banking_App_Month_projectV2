import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/Constant.dart';

final ThemeData appThemeData = ThemeData(
  primaryColor: Cst.kPrimaryColor,
  textTheme: TextTheme(
    displayLarge:
        GoogleFonts.roboto(fontSize: Cst.k4xl, fontWeight: FontWeight.bold),
    displayMedium:
        GoogleFonts.roboto(fontSize: Cst.k2xl, fontWeight: FontWeight.bold),
    displaySmall:
        GoogleFonts.roboto(fontSize: Cst.kxl, fontWeight: FontWeight.bold),
    headlineMedium:
        GoogleFonts.roboto(fontSize: Cst.klg, fontWeight: FontWeight.w400),
    bodyLarge:
        GoogleFonts.roboto(fontSize: Cst.kbase, fontWeight: FontWeight.normal),
    bodyMedium:
        GoogleFonts.montserrat(fontSize: Cst.ksm, fontWeight: FontWeight.w400),
  ),
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF202020),
    onPrimary: Color(0xFF505050),
    secondary: Color(0xFFBBBBBB),
    onSecondary: Color(0xFFEAEAEA),
    error: Color(0xFFF32424),
    onError: Color(0xFFF32424),
    background: Color(0xFFF1F2F3),
    onBackground: Color(0xFFFFFFFF),
    surface: Color(0xFF54B435),
    onSurface: Color(0xFF54B435),
  ),
);

List<Color> gradientColor = [
  Color(0xff185ADB),
  Color(0xff113E98),
];
