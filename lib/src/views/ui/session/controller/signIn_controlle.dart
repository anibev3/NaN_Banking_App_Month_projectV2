// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/session/controller/auth_repository.dart';

// import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:get/state_manager.dart';
final singUpController = Get.put(SignInController());

class SignInController extends GetxController {
  static SignInController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  // final phoneNo = TextEditingController();

  void loginUser(String email, String password) {
    AuthRepository.instance.loginWithEmailAndPasseword(email, password);
  }
}
