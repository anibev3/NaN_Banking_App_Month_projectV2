// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/parametre/views/global_constants.dart';

class GetTransferUsernameTextField extends StatelessWidget {
  String? labelText;
  final String hintText;
  final TextEditingController controller;
  String? prefixIcon;
  bool obscureText;
  String? errorText;
  String? successMessage;
  GetTransferUsernameTextField({
    super.key,
    this.labelText = "",
    required this.hintText,
    required this.controller,
    this.prefixIcon = '',
    this.obscureText = false,
    this.errorText,
    this.successMessage = '',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            labelText!,
            style: TextStyle(
              fontSize: heightValue15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextFormField(
          obscureText: obscureText,
          controller: controller,
          style: TextStyle(fontSize: heightValue20),
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 212, 211, 211),
              ),
              borderRadius: BorderRadius.circular(heightValue10),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 212, 211, 211),
              ),
              borderRadius: BorderRadius.circular(heightValue10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: defaultAppColor,
              ),
              borderRadius: BorderRadius.circular(heightValue10),
            ),
            hintText: hintText,
            prefixIcon: Padding(
              padding: const EdgeInsets.only(left: 15, top: 6),
              child: Text(
                prefixIcon!,
                style: const TextStyle(fontSize: 25),
              ),
            ),
            errorText: errorText,
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Enter your $hintText';
            }
            return null;
          },
        ),
      ],
    );
  }
}
