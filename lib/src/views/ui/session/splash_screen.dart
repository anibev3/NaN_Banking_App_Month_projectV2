import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/Constant.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/session/controller/splash_controller.dart';

class SplashScreen extends StatefulWidget {
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashController controller = Get.put(SplashController());

  // @override
  // void initState() {
  //   super.initState();
  //   controller.onReady();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: Colors.white,
      child: Center(
        child: SizedBox(
            width: 200,
            height: Get.height * 0.8,
            child: Column(
              children: [
                Expanded(child: Container()),
                // ColorFiltered(
                //     colorFilter:
                //         ColorFilter.mode(Cst.kPrimaryColor, BlendMode.srcIn),
                //     child: Image.asset(
                //       "assets/img/NawariLogo.png",
                //     )),
                Expanded(child: Container()),
                CircularProgressIndicator(
                  color: Cst.kPrimary2Color,
                )
              ],
            )),
      ),
    ));
  }
}
