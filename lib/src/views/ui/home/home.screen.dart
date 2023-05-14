import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/Constant.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/app_theme.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/home/models/transaction_model.dart';
import 'package:nan_banking_app_mai_project/src/views/widgets/lib/constants.dart';

List<TransactionModel> recentTransactions = [
  TransactionModel(
    image: 'assets/img/balloning.png',
    title: 'Transaction 1',
    date: '2023-05-01',
    price: 10.99,
  ),
  TransactionModel(
    image: 'assets/img/hiking.png',
    title: 'Transaction 2',
    date: '2023-05-02',
    price: -5.99,
  ),
  TransactionModel(
    image: 'assets/img/kayaking.png',
    title: 'Transaction 3',
    date: '2023-05-03',
    price: 20.0,
  ),
  TransactionModel(
    image: 'assets/img/snorkling.png',
    title: 'Transaction 4',
    date: '2023-05-04',
    price: -15.0,
  ),
  TransactionModel(
    image: 'assets/img/snorkling.png',
    title: 'Transaction 5',
    date: '2023-05-05',
    price: 8.5,
  ),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // int _currentIndex = 0;
  // void _onItemTapped(int index) {
  //   setState(() {
  //     _currentIndex = index;
  //   });
  // }

  var images = {
    "balloning.png": "Balloning",
    "hiking.png": "hiking",
    "kayaking.png": "kayaking",
    "snorkling.png": "snorkling",
    "button-one.png": "button",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 225, 221, 221),
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Column(
              children: [
                SoldeSection2(),

                // const SoldeSection(),
                ActionItemSection(images: images),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Divider(),
                ),
                StatMois(),
                AfterHistorique(),
                SizedBox(
                  height: 5,
                ),
                // ...recentTransactions
                //     .map((e) => RecentTransaction(e: e))
                //     .toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SoldeSection2 extends StatelessWidget {
  const SoldeSection2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment(0.0, 0.0),
            end: Alignment(0.987, 0.208),
            colors: gradientColor),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [],
      ),
    );
  }
}

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
              Text(
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

class StatMois extends StatelessWidget {
  const StatMois({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, top: 8),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Text(
              "Janvier",
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.grey,
                fontSize: 18,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 162,
                height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: shadowColorLight,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Total recu",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    Text(
                      "1000.00 Fcfa",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ],
                ),
              ),
              Container(
                width: 162,
                height: 65,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  color: shadowColorLight,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Total envoyé",
                      style: TextStyle(fontSize: 15, color: Colors.white),
                    ),
                    Text(
                      "000.00 Fcfa",
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class SoldeSection extends StatelessWidget {
  const SoldeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 30),
            child: Container(
              width: 332,
              height: 135,
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 211, 210, 210),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "1000.00 Fcfa",
                      style:
                          TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                    ),
                    const Text(
                      "Solde Actuel",
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Center(
          child: Container(
            width: 68,
            height: 65.48,
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              image: DecorationImage(
                image: AssetImage(
                  "assets/img/photo_profil.jpeg",
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ActionItemSection extends StatelessWidget {
  const ActionItemSection({
    super.key,
    required this.images,
  });

  final Map<String, String> images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Padding(
        padding: const EdgeInsets.only(left: 35, right: 35, top: 30),
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                margin: const EdgeInsets.all(4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // margin: EdgeInsets.all(4),
                      width: 57,
                      height: 57,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.grey,
                        image: DecorationImage(
                          image: AssetImage(
                            "assets/img/" + images.keys.elementAt(index),
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Text(
                      images.values.elementAt(index),
                      style: const TextStyle(
                          color: Colors.grey,
                          fontSize: 13.60,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}

class RecentTransaction extends StatelessWidget {
  final TransactionModel e;
  const RecentTransaction({Key? key, required this.e}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: () {},
        child: Container(
          margin: EdgeInsets.only(top: size.height / 100 * 1.5),
          padding: EdgeInsets.symmetric(
            horizontal: size.width / 100 * 4,
            vertical: size.height / 100 * 1,
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                  color: Colors.grey, width: 1, style: BorderStyle.solid)),
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Container(
              height: 53,
              width: 53,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Center(
                // child: SvgPicture.asset(e.image),
                child: Image.asset(
                  e.image,
                  fit: BoxFit.cover,
                ),
                // SvgPicture.asset(e.image),
              ),
            ),
            title: Text(
              e.title,
              style: TextStyle(),
            ),
            subtitle: Text(
              e.date,
              style: TextStyle(),
            ),
            trailing: Text(
              e.price >= 0
                  ? '\${e.price.toString()}'
                  : '-\${e.price.toString()}',
              style: TextStyle(
                color: e.price >= 0 ? Colors.green : Colors.red,
              ),
            ),
          ),
        ));
  }
}
