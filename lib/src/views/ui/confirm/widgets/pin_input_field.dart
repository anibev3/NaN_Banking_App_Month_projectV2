import 'package:flutter/material.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/parametre/views/color_constants.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/parametre/views/global_constants.dart';

class PinInputField extends StatelessWidget {
  final int selectedIndex;
  final int index;
  final String pin;

  const PinInputField({
    Key? key,
    required this.selectedIndex,
    required this.index,
    required this.pin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: heightValue50,
      width: heightValue50,
      margin: EdgeInsets.only(right: value10),
      decoration: BoxDecoration(
        color: greyScale200,
        // shape: BoxShape.circle,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: index == selectedIndex ? defaultAppColor : Colors.transparent,
          width: 2,
        ),
      ),
      child: pin.length > index
          ? Container(
              width: value15,
              height: value15,
              decoration: const BoxDecoration(
                color: defaultAppColor,
                shape: BoxShape.circle,
              ),
            )
          : const SizedBox(),
    );
  }
}
