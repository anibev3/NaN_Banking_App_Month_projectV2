import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/home/components/recentTransaction.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/home/components/recentTransactionCredit.dart';

class AllTransaction extends StatefulWidget {
  AllTransaction({Key? key}) : super(key: key);

  @override
  _AllTransactionState createState() => _AllTransactionState();
}

class _AllTransactionState extends State<AllTransaction> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          'Detail Transaction',
          style: GoogleFonts.dmSans(
            color: Colors.black,
            fontSize: 17,
            // fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 40),
          child: SizedBox(
            height: size.height,
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: <Widget>[
                  ButtonsTabBar(
                    backgroundColor: Colors.red,
                    unselectedBackgroundColor: Colors.grey[300],
                    unselectedLabelStyle: TextStyle(color: Colors.black),
                    labelStyle: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                    tabs: [
                      Tab(
                        // icon: Icon(Icons.arrow_back),
                        text: "Débit",
                      ),
                      Tab(
                        text: "Crédit",
                        // icon: Icon(Icons.arrow_back),
                      ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: <Widget>[
                        RecentTransaction(),
                        RecentTransactionCredit(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
