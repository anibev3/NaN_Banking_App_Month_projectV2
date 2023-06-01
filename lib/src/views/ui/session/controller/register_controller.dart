import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nan_banking_app_mai_project/src/utils/helpers/session.helper.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/session/models/user_model.dart';

class RegisterController extends GetxController {
  static RegisterController get instance => Get.find();

  Rx<User?> user = Rx<User?>(null);
  SessionManager prefs = SessionManager();

  void setUser(User? newUser) {
    user.value = newUser;
  }

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  GetStorage box = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  final contact = TextEditingController();

  var issubmitLoading = false.obs;
  var isGestureEnabled = false.obs;
  var isPassword = true.obs;
  var isEmptyAll = false.obs;
  var isEmptyMail = false.obs;
  var isEmptyPassword = false.obs;
  var isError = false.obs;
  var isOk = false.obs;
  RxString errorConnexion = ''.obs;

  Future<void> createUserWithEmailAndPassword(
      String email, String password, String contact_) async {
    issubmitLoading(true);
    isGestureEnabled(true);
    if (email != "" && password != "" && contact_ != "") {
      try {
        UserCredential userCredential = await _auth
            .createUserWithEmailAndPassword(email: email, password: password);
        UserTempon user = UserTempon(
            uid: userCredential.user!.uid,
            email: userCredential.user!.email.toString(),
            contact: contact_);
        print('USERTEMPOM - $user');

        await prefs.saveTmpUserData(user);
      } on FirebaseAuthException catch (e) {
        // final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
        // print('FIREBASE AUTH EXCEPTION - ${ex.message}');
        isError(true);
        // final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
        print('<_________________________>');
        print('FIREBASE AUTH EXCEPTION - ${e.code}');
        errorConnexion.value = e.code;
        print('errorConnexion - $errorConnexion');
        // Future.delayed(const Duration(seconds: 1), () {
        issubmitLoading(false);
        isGestureEnabled(false);
        isError(false);
        // });
        print('<_________________________>');
        if (errorConnexion.value == "invalid-email") {
          await Flushbar(
            backgroundColor: Colors.red,
            title: "Erreur",
            margin: EdgeInsets.only(top: 50),
            message: "Veuillez Entrer un email valide et réesayer",
            duration: Duration(seconds: 3),
            flushbarPosition: FlushbarPosition.TOP,
          ).show(Get.context!);
        }
        if (errorConnexion.value == "weak-password") {
          await Flushbar(
            backgroundColor: Colors.red,
            title: "Erreur",
            margin: EdgeInsets.only(top: 50),
            message: "mot de passe faible, minimum 6 caracteres",
            duration: Duration(seconds: 3),
            flushbarPosition: FlushbarPosition.TOP,
          ).show(Get.context!);
        }
        print('FIREBASE AUTH EXCEPTION}');
      } catch (_) {
        // const ex = SignUpWithEmailAndPasswordFailure();
        // print('EXCEPTION - ${ex.message}');
        // throw ex;
        print("CATCH ERROR MSG: $_");
      }
    } else if (email == "" && password == "" && contact_ == "") {
      await Flushbar(
        backgroundColor: Colors.red,
        title: "Erreur",
        margin: EdgeInsets.only(top: 50),
        message:
            "Veuillez renseigner l'adress email et le mot de passe et le contact",
        duration: Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
      ).show(Get.context!);
      isEmptyAll(true);
      Future.delayed(Duration(seconds: 1), () {
        isEmptyAll(false);
        issubmitLoading(false);
        isGestureEnabled(false);
      });
    } else if (email == "") {
      await Flushbar(
        backgroundColor: Colors.red,
        title: "Erreur",
        margin: EdgeInsets.only(top: 50),
        message: "Veuillez renseigner l'adress mail",
        duration: Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
      ).show(Get.context!);
      isEmptyMail(true);
      Future.delayed(Duration(seconds: 1), () {
        isEmptyMail(false);
        issubmitLoading(false);
        isGestureEnabled(false);
      });
    } else if (password == "") {
      await Flushbar(
        backgroundColor: Colors.red,
        title: "Erreur",
        margin: EdgeInsets.only(top: 50),
        message: "Veuillez renseigner le mot de passe",
        duration: Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
      ).show(Get.context!);
      isEmptyPassword(true);
      Future.delayed(Duration(seconds: 1), () {
        isEmptyPassword(false);
        issubmitLoading(false);
        isGestureEnabled(false);
      });
    } else if (contact_ == "") {
      await Flushbar(
        backgroundColor: Colors.red,
        title: "Erreur",
        margin: EdgeInsets.only(top: 50),
        message: "Veuillez renseigner le contact",
        duration: Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
      ).show(Get.context!);
      isEmptyPassword(true);
      Future.delayed(Duration(seconds: 1), () {
        isEmptyPassword(false);
        issubmitLoading(false);
        isGestureEnabled(false);
      });
    }
  }
}
