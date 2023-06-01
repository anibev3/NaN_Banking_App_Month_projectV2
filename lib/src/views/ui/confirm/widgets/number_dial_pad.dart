import 'package:flutter/material.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/parametre/views/global_constants.dart';

class NumberDialPad extends StatelessWidget {
  final VoidCallback onTap;
  final String numberText;
  const NumberDialPad({
    Key? key,
    required this.onTap,
    required this.numberText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onTap,
      style: ButtonStyle(
        fixedSize: MaterialStatePropertyAll(
          Size(heightValue75, heightValue75),
        ),
      ),
      child: Text(
        numberText,
        style: TextStyle(
          fontSize: heightValue35,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
