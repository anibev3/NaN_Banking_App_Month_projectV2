import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/Constant.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/statistic/views/components/debit.dart';

class Statistic extends StatefulWidget {
  @override
  State<Statistic> createState() => _StatisticState();
}

class _StatisticState extends State<Statistic> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.only(left: 25, top: 80, right: 25),
          child: Column(
            children: [
              SizedBox(
                height: 584,
                child: DefaultTabController(
                  length: 12,
                  child: Column(
                    children: <Widget>[
                      ButtonsTabBar(
                        onTap: (p0) {
                          if (kDebugMode) {
                            print("onTap : $p0");
                          }
                        },
                        radius: 8,
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 12),
                        borderWidth: 1,
                        borderColor: Colors.transparent,
                        center: true,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: <Color>[
                              Color(0xFF21899C),
                              Color.fromARGB(255, 115, 171, 181),
                              Color.fromARGB(255, 165, 216, 223),
                            ],
                          ),
                        ),
                        // backgroundColor: Cst.kPrimary2Color,
                        unselectedBackgroundColor: Colors.white,
                        // unselectedLabelStyle: TextStyle(color: Colors.black38),
                        unselectedLabelStyle:
                            TextStyle(color: Cst.kPrimary2Color),
                        // labelStyle: const TextStyle(
                        //     color: Colors.white, fontWeight: FontWeight.bold),
                        labelStyle: const TextStyle(color: Colors.white),
                        // height: 56,

                        tabs: const [
                          Tab(
                            // icon: Icon(Icons.directions_car),
                            text: "Janvier",
                          ),
                          Tab(
                            // icon: Icon(Icons.directions_transit),
                            text: "Février",
                          ),
                          Tab(
                            text: "Mars",
                          ),
                          Tab(
                            text: "Avril",
                          ),
                          Tab(
                            text: "Mais",
                          ),
                          Tab(
                            text: "Juin",
                          ),
                          Tab(
                            text: "Juillet",
                          ),
                          Tab(
                            text: "Aout",
                          ),
                          Tab(
                            text: "Sesptembre",
                          ),
                          Tab(
                            text: "Octobre",
                          ),
                          Tab(
                            text: "Novembre",
                          ),
                          Tab(
                            text: "Décembre",
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: TabBarView(
                          children: <Widget>[
                            TabView1(),
                            Center(
                              child: Icon(Icons.directions_transit),
                            ),
                            Center(
                              child: Icon(Icons.directions_bike),
                            ),
                            Center(
                              child: Icon(Icons.directions_car),
                            ),
                            Center(
                              child: Icon(Icons.directions_transit),
                            ),
                            Center(
                              child: Icon(Icons.directions_bike),
                            ),
                            Center(
                              child: Icon(Icons.directions_car),
                            ),
                            Center(
                              child: Icon(Icons.directions_transit),
                            ),
                            Center(
                              child: Icon(Icons.directions_bike),
                            ),
                            Center(
                              child: Icon(Icons.directions_car),
                            ),
                            Center(
                              child: Icon(Icons.directions_transit),
                            ),
                            Center(
                              child: Icon(Icons.directions_bike),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
