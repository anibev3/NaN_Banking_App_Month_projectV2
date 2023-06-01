// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/parametre/views/global_constants.dart';

class CustomButton extends StatelessWidget {
  final String buttonText;
  Color buttonColor;
  Color buttonTextColor;
  final VoidCallback onTap;
  final bool isGestureEnabled;
  final bool isloading;
  CustomButton({
    Key? key,
    required this.buttonText,
    required this.buttonColor,
    required this.buttonTextColor,
    required this.onTap,
    this.isGestureEnabled = false,
    this.isloading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      ignoring: isGestureEnabled,
      child: Opacity(
        opacity: isGestureEnabled ? 0.8 : 1,
        child: ElevatedButton(
          onPressed: onTap,
          style: ButtonStyle(
              overlayColor: MaterialStatePropertyAll(
                whiteColor.withOpacity(0.2),
              ),
              backgroundColor: MaterialStatePropertyAll(
                buttonColor,
              ),
              fixedSize: MaterialStatePropertyAll(
                Size(screenWidth, heightValue50),
              ),
              shape: MaterialStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              )),
          child: Center(
            child: isloading
                ? LoadingAnimationWidget.staggeredDotsWave(
                    color: Colors.white,
                    size: 25,
                  )
                : Text(
                    buttonText,
                    style: TextStyle(
                      fontSize: heightValue17,
                      color: buttonTextColor,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
