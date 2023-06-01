import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/Constant.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/app_text_style.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/home/controllers/transaction_controller.dart';

class StatCreditMois extends StatelessWidget {
  final TransactionRepository _transactionRepository = TransactionRepository();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return StreamBuilder<QuerySnapshot>(
      stream: _transactionRepository.getTransactionsBynumCliCred(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return LoadingAnimationWidget.staggeredDotsWave(
            color: Cst.kPrimary2Color,
            size: 25,
          );
        }
        if (snapshot.hasError) {
          return Text('Erreur: ${snapshot.error}');
        }
        double totalMontant = snapshot.data!.docs.fold(
          0,
          (previousValue, transaction) =>
              previousValue + (transaction['montant'] ?? 0),
        );
        String totalMontant__ = totalMontant.toString().replaceAllMapped(
              RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
              (match) => '${match[1]} ',
            );

        return Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 8),
          child: SizedBox(
            height: 66,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 4.45),
                  child: Container(
                    width: 155,
                    height: 65,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.green,
                        width: 1.0,
                        style: BorderStyle.solid,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(8),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Total recu",
                          style: TextCss.dyncoloredBoldStyle(
                              Colors.green, Cst.klg),
                        ),
                        (!snapshot.hasData || snapshot.data!.docs.isEmpty)
                            ? Column(
                                children: [
                                  Text(
                                    "000.00 Fcfa",
                                    style: TextCss.dyncoloredBoldStyle(
                                        Colors.green, Cst.k2xl),
                                  ),
                                  Text(
                                    "Aucune transaction éffectué",
                                    style: TextCss.dyncoloredBoldStyle(
                                        Colors.green, Cst.ksm),
                                  ),
                                ],
                              )
                            : Text(
                                "$totalMontant__ Fcfa",
                                style: TextCss.dyncoloredBoldStyle(
                                    Colors.green, Cst.kxl),
                              )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
