import 'package:flutter/material.dart';

class Epargne extends StatelessWidget {
  const Epargne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Center(
              child: Text(
            'Epargne',
            textAlign: TextAlign.center,
          )),
        ],
      ),
    );
  }
}
