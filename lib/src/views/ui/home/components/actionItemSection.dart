import 'package:flutter/material.dart';

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
