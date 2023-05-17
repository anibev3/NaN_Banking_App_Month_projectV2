import 'package:flutter/material.dart';

class Parametre extends StatelessWidget {
  const Parametre({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Center(
              child: Text(
            'Parametre',
            textAlign: TextAlign.center,
          )),
        ],
      ),
    );
  }
}
