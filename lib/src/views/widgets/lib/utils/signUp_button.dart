import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/Constant.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/app_global_style.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/app_text_style.dart';

class SignUpButton extends StatelessWidget {
  final String text;
  final bool isloading;
  final Function onTap;
  final Size size;
  final bool isGestureEnabled;

  const SignUpButton({
    super.key,
    required this.text,
    required this.onTap,
    required this.size,
    this.isloading = false,
    this.isGestureEnabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: IgnorePointer(
        ignoring: isGestureEnabled,
        child: Opacity(
          opacity: isGestureEnabled ? 0.8 : 1,
          child: Container(
            alignment: Alignment.center,
            height: size.height / 13,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: const Color(0xFFF56B3F),
            ),
            child: isloading
                ? LoadingAnimationWidget.staggeredDotsWave(
                    color: Colors.white,
                    size: 25,
                  )
                : Text(text,
                    style: GoogleFonts.dmSans(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w500)

                    // GoogleFonts.inter(
                    //   fontSize: 16.0,
                    //   color: Colors.white,
                    //   fontWeight: FontWeight.w600,
                    // ),
                    ),
          ),
        ),
      ),
    );
  }
}
