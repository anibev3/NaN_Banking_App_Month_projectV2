import 'package:flutter/material.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/session/components/dropButtonBnk.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/session/components/radioHF.dart';

Color kBackgroundColor = Colors.white;
Color kPrimaryColor = Colors.blue;

String drpValue = list.first; // For getting dropDown customer value
String drpValueBank = listBank.first;

Genre genreCus = Genre.homme;
const List<String> list = <String>[
  "Compte courant",
  "Compte d'epargne",
  "Compte à terme",
  "Compte bancaire offshore",
  "Compte professionnel",
  "Compte joint"
];
