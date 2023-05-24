import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nan_banking_app_mai_project/src/routes/app_pages.dart';
import 'package:nan_banking_app_mai_project/src/utils/helpers/controller.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/messagerie/views/messagerie.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/session/welcome.screen.dart';
import 'package:nan_banking_app_mai_project/src/views/widgets/lib/entry_point.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  final Controller _customerController = Get.put(Controller());

  Rx<User?> user = Rx<User?>(null);

  void setUser(User? newUser) {
    user.value = newUser;
  }

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  GetStorage box = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const WelcomeScreen())
        : Get.offAll(() => const EntryPoint());
    // : Get.offAll(() => Messagerie());
  }

  var issubmitLoading = false.obs;
  var isGestureEnabled = false.obs;
  var isPassword = true.obs;
  var isEmptyAll = false.obs;
  var isEmptyMail = false.obs;
  var isEmptyPassword = false.obs;
  var isError = false.obs;
  var isOk = false.obs;
  RxString errorConnexion = ''.obs;

  Future<void> loginWithEmailAndPasseword(String email, String password) async {
    print("calling submit with password ...");
    issubmitLoading(true);
    isGestureEnabled(true);
    print("issubmitLoading ... $issubmitLoading");
    print("email ... $email.          Passeword ... $password");

    if (email != "" && password != "") {
      try {
        isOk(true);
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
            email: email, password: password);
        setUser(userCredential.user);
        // firebaseUser.value != null
        //     ? Get.offAll(() => const EntryPoint())
        //     : Get.to(() => Messagerie());
        // : Get.to(() => const WelcomeScreen());

        //
        print('< Auth repo...');
        print('< ${userCredential.user} _________________________>');
        print('<...>');
        // await box.write('userLoginId', uid);
        print('ID_User - ${userCredential.user!.uid}');
        // await fetchDocumentBySignUpID(uid);
        await _customerController.fetchCustomerData(userCredential.user!.uid);

        await Future.delayed(const Duration(seconds: 4), () {
          issubmitLoading(false);
          isGestureEnabled(false);

          Get.toNamed(Routes.MESSAGERIE);
        });
        // Get.toNamed(Routes.MESSAGERIE);
      } on FirebaseAuthException catch (e) {
        isError(true);
        // final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
        print('<_________________________>');
        print('FIREBASE AUTH EXCEPTION - ${e.code}');
        errorConnexion.value = e.code;
        print('errorConnexion - $errorConnexion');
        Future.delayed(const Duration(seconds: 1), () {
          issubmitLoading(false);
          isGestureEnabled(false);

          isError(false);
        });
        print('<_________________________>');
        if (errorConnexion.value == "user-not-found") {
          await Flushbar(
            backgroundColor: Colors.red,
            title: "Erreur",
            margin: EdgeInsets.only(top: 50),
            message:
                "Utilisateur introuvable, veuillez verifier l'email et le mot de passe ensuite réessayer",
            duration: Duration(seconds: 3),
            flushbarPosition: FlushbarPosition.TOP,
          ).show(Get.context!);
        }
        if (errorConnexion.value == "wrong-password") {
          await Flushbar(
            backgroundColor: Colors.red,
            title: "Erreur",
            margin: EdgeInsets.only(top: 50),
            message:
                "Mot de passe incorrecte, veuillez le verifier et réessayer",
            duration: Duration(seconds: 3),
            flushbarPosition: FlushbarPosition.TOP,
          ).show(Get.context!);
        }
      } catch (_) {
        // const ex = SignUpWithEmailAndPasswordFailure();
        // print('EXCEPTION - ${ex.message}');
        print("CATCH ERROR MSG: $_");
        // throw ex;
      }
    } else if (email == "" && password == "") {
      await Flushbar(
        backgroundColor: Colors.red,
        title: "Erreur",
        margin: EdgeInsets.only(top: 50),
        message: "Veuillez renseigner l'adress email et le mot de passe",
        duration: Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
      ).show(Get.context!);
      print(
          "l'email et le mot de passe sont vide...............................");
      isEmptyAll(true);
      Future.delayed(Duration(seconds: 2), () {
        isEmptyAll(false);
        issubmitLoading(false);
        isGestureEnabled(false);
      });
    } else if (email == "") {
      print("l'email est vide...............................");
      await Flushbar(
        backgroundColor: Colors.red,
        title: "Erreur",
        margin: EdgeInsets.only(top: 50),
        message: "Veuillez renseigner l'adress mail",
        duration: Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
      ).show(Get.context!);
      isEmptyMail(true);
      Future.delayed(Duration(seconds: 2), () {
        isEmptyMail(false);
        issubmitLoading(false);
        isGestureEnabled(false);
      });
    } else if (password == "") {
      print("le mot de passe est vide...............................");
      await Flushbar(
        backgroundColor: Colors.red,
        title: "Erreur",
        margin: EdgeInsets.only(top: 50),
        message: "Veuillez renseigner le mot de passe",
        duration: Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
      ).show(Get.context!);
      isEmptyPassword(true);
      Future.delayed(Duration(seconds: 2), () {
        isEmptyPassword(false);
        issubmitLoading(false);
        isGestureEnabled(false);
      });
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    print("<___________ LogOut a ete cliqué ___________>");
    await box.erase();
    setUser(null);
    Get.toNamed(Routes.INITIAL);
  }
}
