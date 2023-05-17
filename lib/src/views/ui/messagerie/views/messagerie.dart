import 'package:flutter/material.dart';

class Messagerie extends StatelessWidget {
  const Messagerie({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Center(
              child: Text(
            'messagerie',
            textAlign: TextAlign.center,
          )),
        ],
      ),
    );
  }
}
