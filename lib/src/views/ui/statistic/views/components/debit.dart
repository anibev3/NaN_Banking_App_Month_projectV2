import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/Constant.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/home/models/transaction_model.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/statistic/views/components/recentTransaction.dart';

class TabView1 extends StatelessWidget {
  List<TransactionModel> recentTransactions = [
    TransactionModel(
      image: 'assets/img/balloning.png',
      title: 'Transaction 1',
      date: '2023-05-01',
      price: 1000,
    ),
    TransactionModel(
      image: 'assets/img/hiking.png',
      title: 'Transaction 2',
      date: '2023-05-02',
      price: -5000,
    ),
    TransactionModel(
      image: 'assets/img/kayaking.png',
      title: 'Transaction 3',
      date: '2023-05-03',
      price: 4600,
    ),
    TransactionModel(
      image: 'assets/img/snorkling.png',
      title: 'Transaction 4',
      date: '2023-05-04',
      price: -900000,
    ),
    TransactionModel(
      image: 'assets/img/snorkling.png',
      title: 'Transaction 5',
      date: '2023-05-05',
      price: 200000,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      children: [
        Container(
            width: MediaQuery.of(context).size.width,
            height: 230,
            decoration: BoxDecoration(
              color: Cst.kprimary4Color,
              borderRadius:
                  BorderRadius.circular(10), // image: DecorationImage(
              image: const DecorationImage(
                image: AssetImage(
                  "assets/img/graph.png",
                ),
                fit: BoxFit.cover,
              ),
            )),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          color: Cst.kPrimary2Color,
                          borderRadius: BorderRadius.circular(3),
                        )),
                  ),
                  const Text(
                    "Débit",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Cst.kprimary3Color,
                        borderRadius:
                            BorderRadius.circular(3), // image: DecorationImage(
                      )),
                ),
                const Text(
                  "Crédit",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ],
            )
          ],
        ),
        Text("Voir le détail des transactions"),
        // SizedBox(
        //   height: 240,
        //   child: DefaultTabController(
        //     length: 2,
        //     child: Column(
        //       children: <Widget>[
        //         ButtonsTabBar(
        //           onTap: (p0) {
        //             if (kDebugMode) {
        //               print("onTap : $p0");
        //             }
        //           },
        //           radius: 8,
        //           contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        //           // borderWidth: 1,
        //           borderColor: Colors.transparent,
        //           center: true,
        //           decoration: const BoxDecoration(
        //             gradient: LinearGradient(
        //               colors: <Color>[
        //                 Color(0xFF21899C),
        //                 Color.fromARGB(255, 115, 171, 181),
        //                 Color.fromARGB(255, 165, 216, 223),
        //               ],
        //             ),
        //           ),
        //           // backgroundColor: Cst.kPrimary2Color,
        //           unselectedBackgroundColor: Colors.white,
        //           // unselectedLabelStyle: TextStyle(color: Colors.black38),
        //           unselectedLabelStyle: TextStyle(color: Cst.kPrimary2Color),
        //           // labelStyle: const TextStyle(
        //           //     color: Colors.white, fontWeight: FontWeight.bold),
        //           labelStyle: const TextStyle(color: Colors.white),
        //           height: 35,

        //           tabs: [
        //             Tab(
        //               icon: Icon(Icons.directions_car),
        //               text: "Débit",
        //             ),
        //             Tab(
        //               icon: Icon(Icons.directions_transit),
        //               text: "Crédit",
        //               // child: Column(
        //               //   children: [Text("1,2 M XOF")],
        //               // ),
        //             ),
        //           ],
        //         ),
        //         const SizedBox(
        //           height: 20,
        //         ),
        //         Expanded(
        //           child: TabBarView(
        //             children: <Widget>[
        //               Column(
        //                 children: [
        //                   ...recentTransactions
        //                       .map((e) => RecentTransaction(e: e))
        //                       .toList(),
        //                 ],
        //               ),
        //               const Center(
        //                 child: Icon(Icons.directions_bike),
        //               ),
        //             ],
        //           ),
        //         ),
        //       ],
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
