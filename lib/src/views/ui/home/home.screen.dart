import 'package:flutter/material.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/home/components/actionItemSection.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/home/components/afterHistorique.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/home/components/recentTransaction.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/home/components/soldeSection.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/home/components/stat_credit_mois.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/home/components/stat_debit_mois.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/home/models/transaction_model.dart';

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

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var images = {
    "balloning.png": "Tranfert",
    "hiking.png": "Epagne",
    "kayaking.png": "Mobile",
    "snorkling.png": "Banque",
    "button-one.png": "Coffre",
  };

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Column(
            children: [
              const SoldeSection(),
              SizedBox(
                height: size.height / 1.61,
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    ActionItemSection(images: images),
                    const Padding(
                      padding: EdgeInsets.only(left: 30, right: 30),
                      child: Divider(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        StatCreditMois(),
                        StatDebitMois(),
                      ],
                    ),
                    const AfterHistorique(),
                    const SizedBox(
                      height: 5,
                    ),
                    RecentTransaction()
                    // ...recentTransactions
                    //     .map((e) => RecentTransaction())
                    //     .toList(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
