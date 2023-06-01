// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/confirm/controller/confirm_to_enter_controller.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/confirm/widgets/number_dial_pad.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/confirm/widgets/pin_input_field.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/parametre/views/custom_button.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/parametre/views/global_constants.dart';

class ConfirmPinToSendMoneyDialPad extends StatefulWidget {
  final VoidCallback onSuccess;
  const ConfirmPinToSendMoneyDialPad({
    Key? key,
    required this.onSuccess,
  }) : super(key: key);

  @override
  State<ConfirmPinToSendMoneyDialPad> createState() =>
      _ConfirmPinToSendMoneyDialPadState();
}

class _ConfirmPinToSendMoneyDialPadState
    extends State<ConfirmPinToSendMoneyDialPad> {
  // final HomeService homeService = HomeService();
  // var selectedindex = 0;
  // String pin = '';

  // addDigit(int digit) {
  //   if (pin.length > 3) {
  //     return;
  //   }
  //   setState(() {
  //     pin = pin + digit.toString();
  //     print('pin is $pin');
  //     selectedindex = pin.length;
  //     if (pin.length > 3) {
  //       // confirmTransactionUsingPin();
  //     }
  //   });
  // }

  // backspace() {
  //   if (pin.isEmpty) {
  //     return;
  //   }
  //   setState(() {
  //     pin = pin.substring(0, pin.length - 1);
  //     selectedindex = pin.length;
  //   });
  // }

  // void confirmTransactionUsingPin() {
  //   // final username =
  //   //     Provider.of<UserProvider>(context, listen: false).user.username;
  //   homeService.confirmPinBeforeTransfer(
  //     context: context,
  //     pin: pin,
  //     username: username,
  //     onSuccess: () {
  //       Navigator.pop(context);
  //       widget.onSuccess();
  //     },
  //   );
  // }

  ConfirmController confirmController = Get.put(ConfirmController());

  var selectedindex = 0;
  String pin = '';

  addDigit(int digit) {
    if (pin.length > 3) {
      return;
    }
    setState(() {
      pin = pin + digit.toString();
      print('pin is $pin');
      selectedindex = pin.length;
      if (pin.length > 3) {
        confirmTransactionUsingPin();
      }
    });
  }

//
  backspace() {
    if (pin.isEmpty) {
      return;
    }
    setState(() {
      pin = pin.substring(0, pin.length - 1);
      selectedindex = pin.length;
    });
  }

  void confirmTransactionUsingPin() {
    // final username =
    // Provider.of<UserProvider>(context, listen: false).user.username;
    confirmController.confirmPinBeforeTransferReal(
      context: context,
      pin: pin,
      // username: username,
      onSuccess: () {
        // Navigator.pop(context);
        widget.onSuccess();
        print("+++++++++++++++++++++++++++ NIVEAU 1 OK");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // final user = Provider.of<UserProvider>(context).user;
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: heightValue20,
            ),
            Text(
              "Enter your 4 digit pin to complete",
              style: TextStyle(fontSize: heightValue25),
            ),
            SizedBox(
              height: heightValue30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PinInputField(
                  index: 0,
                  selectedIndex: selectedindex,
                  pin: pin,
                ),
                PinInputField(index: 1, selectedIndex: selectedindex, pin: pin),
                PinInputField(index: 2, selectedIndex: selectedindex, pin: pin),
                PinInputField(index: 3, selectedIndex: selectedindex, pin: pin),
              ],
            ),
            SizedBox(
              height: heightValue20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberDialPad(onTap: () => addDigit(1), numberText: '1'),
                NumberDialPad(onTap: () => addDigit(2), numberText: '2'),
                NumberDialPad(onTap: () => addDigit(3), numberText: '3'),
              ],
            ),
            SizedBox(
              height: heightValue20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberDialPad(onTap: () => addDigit(4), numberText: '4'),
                NumberDialPad(onTap: () => addDigit(5), numberText: '5'),
                NumberDialPad(onTap: () => addDigit(6), numberText: '6'),
              ],
            ),
            SizedBox(
              height: heightValue20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberDialPad(onTap: () => addDigit(7), numberText: '7'),
                NumberDialPad(onTap: () => addDigit(8), numberText: '8'),
                NumberDialPad(onTap: () => addDigit(9), numberText: '9'),
              ],
            ),
            SizedBox(
              height: heightValue20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                NumberDialPad(
                  onTap: () {},
                  numberText: '',
                ),
                NumberDialPad(
                  onTap: () => addDigit(0),
                  numberText: '0',
                ),
                TextButton(
                  style: ButtonStyle(
                    fixedSize: MaterialStatePropertyAll(
                      Size(heightValue75, heightValue75),
                    ),
                  ),
                  onPressed: () {
                    backspace();
                  },
                  child: Icon(
                    Icons.backspace_outlined,
                    color: defaultAppColor,
                    size: heightValue30,
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          backgroundColor: whiteColor,
                          surfaceTintColor: whiteColor,
                          icon: Image.asset(
                            "assets/icons/info-circle.png",
                            height: value100,
                            width: value100,
                          ),
                          title: Text(
                            "Caution",
                            style: TextStyle(
                              fontSize: heightValue20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          content: Text(
                            "Are you sure you want to cancel the transaction",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: heightValue15,
                              color: Colors.grey[600],
                            ),
                          ),
                          actions: <Widget>[
                            CustomButton(
                              buttonText: "Yes",
                              onTap: () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },
                              buttonColor: defaultAppColor,
                              buttonTextColor: whiteColor,
                            ),
                            SizedBox(
                              height: heightValue10,
                            ),
                            CustomButton(
                              buttonText: "No",
                              onTap: () {
                                Navigator.pop(context);
                              },
                              buttonColor: defaultAppColor,
                              buttonTextColor: whiteColor,
                            )
                          ],
                        ));
              },
              child: Text(
                "Cancel",
                style: TextStyle(
                  fontSize: heightValue25,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
