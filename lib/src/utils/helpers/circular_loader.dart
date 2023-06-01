import 'package:flutter/material.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/parametre/views/global_constants.dart';

class CircularLoader extends StatelessWidget {
  const CircularLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: heightValue43,
        width: heightValue43,
        child: const CircularProgressIndicator(),
      ),
    );
  }
}
