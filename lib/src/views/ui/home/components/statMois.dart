import 'package:flutter/material.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/Constant.dart';
import 'package:nan_banking_app_mai_project/src/views/widgets/lib/constants.dart';

class StatMois extends StatelessWidget {
  const StatMois({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15, top: 8),
      child: SizedBox(
        height: 66,
        child: Column(
          children: [
            // Padding(
            //   padding: EdgeInsets.only(bottom: 10),
            //   child: Row(
            //     children: const [
            //       Text(
            //         "Janvier",
            //         textAlign: TextAlign.start,
            //         style: TextStyle(
            //           fontSize: 14,
            //           color: Colors.grey,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 4.45),
                  child: Container(
                    width: 162,
                    height: 65,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.green,
                        width: 1.0,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                      // color: Cst.kPrimary2Color,
                      // color: Colors.green,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Total recu",
                          style: TextStyle(fontSize: 15, color: Colors.green),
                        ),
                        Text(
                          "1000.00 Fcfa",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 4.45,
                  ),
                  child: Container(
                    width: 162,
                    height: 65,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      // color: Cst.kPrimary2Color,
                      // color: Colors.red,
                      border: Border.all(
                        color: Colors.red,
                        width: 1.0,
                        style: BorderStyle.solid,
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Total envoyé",
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.red,
                          ),
                        ),
                        Text(
                          "000.00 Fcfa",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
