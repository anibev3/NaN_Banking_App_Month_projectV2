// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/session/controller/auth_repository.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:get/state_manager.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final contact = TextEditingController();

  void registerUser(String email, String password, String contact) {
    AuthRepository.instance
        .createUserWithEmailAndPassword(email, password, contact);
  }
}
