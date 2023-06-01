import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:nan_banking_app_mai_project/src/routes/app_pages.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/Constant.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/app_text_style.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/icon_et_text.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/home/components/recentTransaction.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/home/components/recentTransactionCredit.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/home/components/soldeSection.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/home/components/stat_credit_mois.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/home/components/stat_debit_mois.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/home/models/transaction_model.dart';
import 'package:unicons/unicons.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List imgs = [
    "bpop.jpeg",
    "bpop.jpeg",
    "bpop.jpeg",
    "bpop.jpeg",
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: SizedBox(
            height: size.height,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                SoldeSection(),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    StatCreditMois(),
                    StatDebitMois(),
                  ],
                ),
                //
                SizedBox(
                  height: 300,
                  child: DefaultTabController(
                    length: 2,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 15, right: 15, top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Transactions",
                                style: TextCss.dyncoloredBoldStyle(
                                    Colors.grey, Cst.kbase2),
                              ),
                              ButtonsTabBar(
                                height: 35,
                                backgroundColor: Colors.grey[600],
                                unselectedBackgroundColor: Colors.grey[300],
                                unselectedLabelStyle:
                                    TextStyle(color: Colors.black),
                                labelStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                                tabs: [
                                  Tab(
                                    icon: Icon(UniconsLine.arrow_circle_up),
                                    text: "Débit",
                                  ),
                                  Tab(
                                    text: "Crédit",
                                    icon: Icon(UniconsLine.arrow_circle_down),
                                  ),
                                ],
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.toNamed(Routes.ALLTRANSACTION);
                                },
                                child: Text(
                                  "Tout afficher",
                                  style: TextCss.dyncoloredBoldStyle(
                                      Cst.kprimary3Color, Cst.kbase2),
                                ),
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 1,
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
                SizedBox(
                  // height: 300,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 1, left: 7, right: 7),
                    child: SizedBox(
                      height: 163,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.all(10),
                              padding: EdgeInsets.symmetric(vertical: 2),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 4,
                                        spreadRadius: 2)
                                  ]),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width / 1.4,
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: CircleAvatar(
                                        radius: 25,
                                        backgroundImage: AssetImage(
                                            "assets/img/${imgs[index]}"),
                                      ),
                                      title: Text(
                                        "Nawari Bk Cocody",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          // color: Colors.black54
                                        ),
                                      ),
                                      subtitle: Text("+225 0140990499"),
                                      trailing: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                            size: 17,
                                          ),
                                          Text(
                                            "4.9",
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              // color: Colors.black54
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      child: Text(
                                        "Retrouver toute nos offres de service, fraie de transaction sur notre platforme web et ou en passant dans notre agence situé  Cocody",
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 11,
                                          fontWeight: FontWeight.bold,
                                          // color: Colors.black54
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        IconEtText(
                                            icon: Icons.circle_sharp,
                                            text: "+225 01 40990499",
                                            iconColor: Cst.kWarningColor),
                                        IconEtText(
                                            icon: Icons.location_on,
                                            text: "Cocody",
                                            iconColor: Cst.kSuccesColor),
                                        IconEtText(
                                            icon: Icons.access_time_rounded,
                                            text: "08h30",
                                            iconColor: Cst.kDangerColor),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
