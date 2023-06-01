import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/home/models/transaction_model.dart';

class RecentTransaction extends StatelessWidget {
  final TransactionModel e;
  const RecentTransaction({
    Key? key,
    required this.e,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: CupertinoButton(
          padding: EdgeInsets.zero,
          // color: ,
          onPressed: () {
            if (kDebugMode) {
              print(
                  "<_____________________Detail transaction______________________>");
            }
          },
          child: Container(
            margin: EdgeInsets.only(top: size.height / 100 * 0.9),
            padding: EdgeInsets.symmetric(
              horizontal: size.width / 100 * 3,
              vertical: size.height / 100 * 0.000005,
            ),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                border: Border.all(
                  color: Colors.grey,
                  width: 1,
                  style: BorderStyle.solid,
                )),
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: Container(
                height: 53,
                width: 53,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(160),
                  color: Colors.white,
                ),
                child: Center(
                  // child: SvgPicture.asset(e.image),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      e.image,
                      fit: BoxFit.cover,
                    ),
                  ),
                  // SvgPicture.asset(e.image),
                ),
              ),
              title: Text(
                e.title,
                style: const TextStyle(),
              ),
              subtitle: Text(
                e.date,
                style: const TextStyle(),
              ),
              trailing: Text(
                e.price >= 0 ? "" : '${e.price.toString()} FCFA',
                // : '${e.price.toString()} FCFA',
                style: TextStyle(
                  color: e.price >= 0 ? Colors.green : Colors.red,
                ),
              ),
            ),
          )),
    );
  }
}
