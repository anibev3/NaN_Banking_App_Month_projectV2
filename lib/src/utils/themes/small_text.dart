import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SmallText extends StatelessWidget {
  Color? color;
  final String? text;
  double size = 12;
  // TextOverflow overflow;
  double? height = 1.2;

  SmallText({
    Key? key,
    this.color = const Color.fromARGB(255, 85, 87, 86),
    required this.text,
    required this.size,
    // this.overflow = TextOverflow.ellipsis
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      // overflow: overflow,
      style: TextStyle(
          // fontFamily: ,
          color: color,
          fontSize: size,
          fontWeight: FontWeight.bold,
          height: height),
    );
  }
}
