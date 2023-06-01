import 'package:flutter/material.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/Constant.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/bigtext.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/icon_et_text.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/small_text.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/home/components/detail_pharmacie_view.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/home/models/Pharmacie.model.dart';

class ListPharmacie extends StatefulWidget {
  const ListPharmacie({
    Key? key,
    // required this.items
  }) : super(key: key);
  // final List<Pharmacie> items;

  @override
  State<ListPharmacie> createState() => _ListPharmacieState();
}

class _ListPharmacieState extends State<ListPharmacie> {
  PageController pageController = PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  final double _scaleFactor = 0.8;
  double _height = 220;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
        // if (kDebugMode) {
        //   print("Current page value is $_currentPageValue");
        // }
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // color: Colors.redAccent,
          height: 310,
          child: PageView.builder(
              controller: pageController,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, position) {
                return _BuildPageItem(position);
              }),
        ),
        // new DotsIndicator(
        //   dotsCount: 5,
        //   position: _currentPageValue,
        //   decorator: DotsDecorator(
        //     activeColor: Cst.kSuccesColor,
        //     size: const Size.square(9.0),
        //     activeSize: const Size(18.0, 9.0),
        //     activeShape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(5.0)),
        //   ),
        // )
      ],
    );
  }

  Widget _BuildPageItem(int index) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() + 1) {
      var currentScale =
          _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else if (index == _currentPageValue.floor() - 1) {
      // var currentScale =
      //     _scaleFactor + (_currentPageValue - index + 1) * (1 - _scaleFactor);
      var currentScale = 1 - (_currentPageValue - index) * (1 - _scaleFactor);
      var currTrans = _height * (1 - currentScale) / 2;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1);
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currentScale = 0.8;
      matrix = Matrix4.diagonal3Values(1, currentScale, 1)
        ..setTranslationRaw(0, _height * (1 - _scaleFactor) / 2, 1);
    }

    return Transform(
      transform: matrix,
      child: Stack(children: [
        Container(
          height: 220,
          margin: const EdgeInsets.only(left: 10, right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: index.isEven
                  ? const Color(0xFFFCC112)
                  : const Color(0xFFFC4A12),
              image: const DecorationImage(
                  image: AssetImage("assets/img/shutterstock_1233990421.webp"),
                  fit: BoxFit.cover)),
        ),
        InkWell(
          onTap: () => Navigator.of(context).push(MaterialPageRoute<void>(
              builder: (BuildContext context) => DetailPharmacieView())),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 115,
              margin: const EdgeInsets.only(left: 30, right: 30, bottom: 40),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 5.0,
                        offset: Offset(0, 5)),
                    BoxShadow(
                        color: Colors.white,
                        // blurRadius: 5.0,
                        offset: Offset(-5, 0)),
                    BoxShadow(
                        color: Colors.white,
                        // blurRadius: 5.0,
                        offset: Offset(0, 5)),
                  ]),
              child: Container(
                padding: const EdgeInsets.only(top: 15, left: 15, right: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Bigtext(text: "Nawari Bank cocody", size: 18),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Wrap(
                            children: List.generate(5, (index) {
                          return Icon(
                            Icons.star,
                            color: Cst.kSuccesColor,
                            size: 13,
                          );
                        })),
                        const SizedBox(
                          width: 7,
                        ),
                        SmallText(text: "4,5", size: 12),
                        const SizedBox(
                          width: 7,
                        ),
                        SmallText(text: "1287", size: 12),
                        const SizedBox(
                          width: 7,
                        ),
                        SmallText(text: "commentaires", size: 12),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconEtText(
                            icon: Icons.circle_sharp,
                            text: "Normal",
                            iconColor: Cst.kWarningColor),
                        IconEtText(
                            icon: Icons.location_on,
                            text: "Bingerville",
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
            ),
          ),
        )
      ]),
    );
  }
}
