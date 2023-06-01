import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nan_banking_app_mai_project/src/utils/services/notification_service.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/Constant.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/app_global_style.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/app_text_style.dart';
import 'package:unicons/unicons.dart';

class NotificationHomeScreen extends StatelessWidget {
  NotificationService notificationService = Get.find<NotificationService>();
  NotificationHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Cst.kxl),
          child: Column(
            children: [
              const SizedBox(height: 10),
              buildHeader(),
              const SizedBox(height: 15),

              // buildSearchBar(),
            ],
          ),
        ),
      )),
    );
  }

  Widget buildHeader() {
    return SizedBox(
      height: 60,
      width: Get.width,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(UniconsLine.arrow_left)),
        Text(
          "Notifications",
          style: TextCss.dyncoloredBoldStyle(Colors.black, Cst.k2xl),
        ),
        SizedBox(
          width: 40,
        )
      ]),
    );
  }

  // Widget buildNotificationListe() {
  //   return SizedBox(
  //       height: Get.height * 0.8,
  //       child: ListView(
  //           children: notificationService.currentBox.value.notifications!
  //               .map((notif) => Container(
  //                     padding: EdgeInsets.symmetric(vertical: Cst.ksm),
  //                     margin: EdgeInsets.only(bottom: Cst.kbase),
  //                     decoration: GlobalCss.containerStyle(Colors.white),
  //                     child: ListTile(
  //                       style: ListTileStyle.list,
  //                       dense: true,
  //                       title: Text("${notif.title}"),
  //                       subtitle: Text("${notif.content}"),
  //                     ),
  //                   ))
  //               .toList()));
  // }
}
