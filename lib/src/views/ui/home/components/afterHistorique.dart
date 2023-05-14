import 'package:flutter/material.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/Constant.dart';

class AfterHistorique extends StatelessWidget {
  const AfterHistorique({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Transactions",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
              Text(
                "Tout afficher",
                style: TextStyle(
                  fontSize: 14,
                  color: Cst.kprimary3Color,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
