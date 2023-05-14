import 'package:flutter/material.dart';

class SoldeSection extends StatelessWidget {
  const SoldeSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 180,
        margin: const EdgeInsets.only(left: 20, right: 20, top: 8, bottom: 5),
        width: double.infinity,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: const SweepGradient(
            center: AlignmentDirectional(1, -1),
            startAngle: 1.7,
            endAngle: 3,
            colors: <Color>[
              Color(0xff148535),
              Color(0xff148535),
              Color(0xff0D6630),
              Color(0xff0D6630),
              Color(0xff148535),
              Color(0xff148535),
            ],
            stops: <double>[0.0, 0.3, 0.3, 0.7, 0.7, 1.0],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "VISA",
                  style: TextStyle(
                      fontSize: 24.30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 5),
                      child: Image.asset(
                        "assets/img/logoNaN.png",
                        width: 20,
                      ),
                    ),
                    const Text(
                      "NaN Academy",
                      style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  "1\t000\t000.00",
                  style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                Text(
                  "Franc Cfa",
                  style: TextStyle(
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "propiétaire",
                            style: TextStyle(
                                fontSize: 12,
                                // fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Vianney Anibe",
                            style: TextStyle(
                                fontSize: 12,
                                // fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            "Expiries",
                            style: TextStyle(
                                fontSize: 12,
                                // fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "10\t/\t24",
                            style: TextStyle(
                                fontSize: 12,
                                // fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                    const Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: CircleAvatar(
                          backgroundColor: Colors.green,
                          child: Icon(
                            Icons.check,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ));
  }
}
