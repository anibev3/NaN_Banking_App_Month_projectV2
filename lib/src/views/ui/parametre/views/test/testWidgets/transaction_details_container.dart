import 'package:flutter/material.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/parametre/views/color_constants.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/parametre/views/global_constants.dart';

class TransactionDetailsContainer extends StatelessWidget {
  final String label;
  final String content;
  final Color amountColor;
  final bool isRow;
  final bool isAmount;
  const TransactionDetailsContainer({
    Key? key,
    required this.label,
    required this.content,
    this.amountColor = defaultAppColor,
    this.isRow = false,
    this.isAmount = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: heightValue15),
      child: Container(
        width: screenWidth,
        height: heightValue100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(heightValue10),
          color: greyScale100,
        ),
        child: Padding(
          padding: EdgeInsets.only(left: value10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: heightValue15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              isRow
                  ? Row(
                      children: [
                        Image.asset(
                          "assets/img/dialog_success_image.png",
                          height: heightValue25,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text(
                          content,
                          style: TextStyle(
                            fontSize: heightValue24,
                            color: amountColor,
                          ),
                        ),
                      ],
                    )
                  : Text(
                      content,
                      style: TextStyle(
                        fontSize: heightValue24,
                        color: amountColor,
                        fontWeight:
                            isAmount ? FontWeight.bold : FontWeight.normal,
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
