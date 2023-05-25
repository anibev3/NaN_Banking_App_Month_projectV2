import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Bigtext extends StatelessWidget {
  Color? color;
  final String? text;
  double size = 23;
  TextOverflow overflow;

  Bigtext(
      {Key? key,
      this.color = const Color.fromARGB(255, 3, 150, 28),
      required this.text,
      required this.size,
      this.overflow = TextOverflow.ellipsis})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(
          // fontFamily: ,
          color: color,
          fontSize: size,
          fontWeight: FontWeight.bold),
    );
  }
}
