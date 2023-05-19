import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nan_banking_app_mai_project/src/routes/app_pages.dart';

class ActionItemSection extends StatelessWidget {
  const ActionItemSection({
    super.key,
    required this.images,
  });

  final Map<String, String> images;
  void toTransfert() {
    Get.toNamed(Routes.TRANSFERT);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 30),
        child: Center(
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    print('index: $index');
                    switch (index) {
                      case 0:
                        return toTransfert();
                      default:
                        return toTransfert();
                    }
                  },
                  child: Container(
                    margin: const EdgeInsets.all(4),
                    child: Center(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
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
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
