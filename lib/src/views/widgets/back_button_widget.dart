import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/Constant.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/app_global_style.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/app_text_style.dart';

class BlackbuttonWidget extends StatelessWidget {
  final String text;
  final bool isloading;
  final Function onTap;

  const BlackbuttonWidget(
      {super.key,
      required this.text,
      required this.onTap,
      this.isloading = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
          height: 44,
          width: Get.width * 0.6,
          decoration: GlobalCss.blackBox(Colors.black, rad: Cst.kMaxRaduis),
          child: Center(
            child: isloading
                ? LoadingAnimationWidget.staggeredDotsWave(
                    color: Colors.white,
                    size: 25,
                  )
                : Text(text,
                    style: TextCss.dyncoloredSBoldStyle(Colors.white, Cst.klg)),
          )),
    );
  }
}
