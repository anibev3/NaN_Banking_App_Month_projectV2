import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/Constant.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/app_global_style.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/app_text_style.dart';
import 'package:unicons/unicons.dart';

const imgPro =
    "https://i.pinimg.com/originals/40/ea/19/40ea19b3d87c276b5a6bd57b3b7c9296.jpg";

class MessageTileWidget extends StatelessWidget {
  const MessageTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: () {
          // Get.toNamed(Routes.CHATSESSION);
        },
        leading: Container(
          padding: EdgeInsets.all(1.3),
          margin: EdgeInsets.all(1),
          decoration:
              GlobalCss.blackBox(Colors.red.shade700, rad: Cst.kMaxRaduis * 2),
          child: GFAvatar(
            // backgroundImage: NetworkImage(imgPro),
            backgroundColor: Cst.kPrimary2Color,
            child: Icon(UniconsLine.user),
          ),
        ),
        title: Text(
          "nom du correspondant",
          style: TextCss.dyncoloredBoldStyle(Colors.black54, Cst.klg),
        ),
        subtitle: Text(
          "Message tronqueé",
          style: TextCss.dyncoloredBoldStyle(Colors.black12, Cst.kbase),
        ),
        trailing: SizedBox(
          width: 40,
          height: 40,
          child: Center(
              child: Badge(
            backgroundColor: Cst.kPrimaryColor,
            label: Text("1"),
            child: Container(),
          )),
        ),
      ),
    );
  }
}
