import 'package:another_flushbar/flushbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:nan_banking_app_mai_project/src/routes/app_pages.dart';
import 'package:nan_banking_app_mai_project/src/utils/helpers/session.helper.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  // final Controller _customerController = Get.put(Controller());
  SessionManager prefs = SessionManager();

  Rx<User?> user = Rx<User?>(null);

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  GetStorage box = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();

  var issubmitLoading = false.obs;
  var isGestureEnabled = false.obs;
  var isPassword = true.obs;
  var isEmptyAll = false.obs;
  var isEmptyMail = false.obs;
  var isEmptyPassword = false.obs;
  var isError = false.obs;
  var isOk = false.obs;
  RxString errorConnexion = ''.obs;
  var logOut = false.obs;
  var logOutIndicator = false.obs;
  var annulerLogOut = false.obs;

  Future<void> loginWithEmailAndPasseword(String email, String password) async {
    issubmitLoading(true);
    isGestureEnabled(true);
    if (email != "" && password != "") {
      try {
        isOk(true);
        UserCredential userCredential = await _auth.signInWithEmailAndPassword(
            email: email, password: password);

        if (userCredential.user!.uid != null) {
          await fetchCustomerData(userCredential.user!.uid);
          await prefs.saveUserData();
          Flushbar(
            backgroundColor: Colors.green,
            title: "Connexion reussi",
            margin: EdgeInsets.only(top: 50),
            message: "Heureux de vous revoir ${userCredential.user!.email}",
            duration: Duration(seconds: 4),
            flushbarPosition: FlushbarPosition.TOP,
          ).show(Get.context!);
          issubmitLoading(false);
          isGestureEnabled(false);
          Get.offAllNamed(Routes.HOME);
        }
      } on FirebaseAuthException catch (e) {
        isError(true);
        // final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
        print('+++++++++++++++++++++++++++++++++++');
        print('FIREBASE AUTH EXCEPTION - ${e.code}');
        errorConnexion.value = e.code;
        print('errorConnexion - $errorConnexion');
        Future.delayed(const Duration(seconds: 1), () {
          issubmitLoading(false);
          isGestureEnabled(false);
          isError(false);
        });
        print('+++++++++++++++++++++++++++++++++++');
        if (errorConnexion.value == "invalid-email") {
          await Flushbar(
            backgroundColor: Colors.red,
            title: "Erreur",
            margin: EdgeInsets.only(top: 50),
            message:
                "Utilisateur introuvable, veuillez verifier l'email ensuite réessayer",
            duration: Duration(seconds: 3),
            flushbarPosition: FlushbarPosition.TOP,
          ).show(Get.context!);
        }
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

  Future<void> fetchCustomerData(String idUser) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('Customers')
          .where('signUpID', isEqualTo: idUser)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot documentSnapshot = querySnapshot.docs[0];
        Map<String, dynamic>? data =
            documentSnapshot.data() as Map<String, dynamic>?;
        // box.write('customerData', data); // Stocker les données

        await box.write('userNawariID', data!['id']);
        await box.write('userNawariEMAIL', data!['mail']);
        await box.write('userNawariNOM', data!['nom']);
        await box.write('userNawariPRENOM', data!['prenoms']);
        await box.write('userNawariSEXE', data!['sexe']);
        await box.write('userNawariPROFESSION', data!['profession']);
        await box.write('userNawariCONTACT', data!['numTel']);
        await box.write('userNawariPIECE', data!['numPce']);
        await box.write('userNawariID2', data!['signUpID']);
        await box.write('userNawariPIN', data!['securityPin']);

        print("DATA1 --> ${data['id']}");
        String userConnectedId = box.read('userNawariID');
        print("DATA2 --> $userConnectedId");
        print("userNawariEMAIL --> ${box.read('userNawariEMAIL')}");
        print("userNawariNOM --> ${box.read('userNawariNOM')}");
        print("userNawariPRENOM --> ${box.read('userNawariPRENOM')}");
        print("userNawariSEXE --> ${box.read('userNawariSEXE')}");
        print("userNawariPROFESSION --> ${box.read('userNawariPROFESSION')}");
        print("userNawariCONTACT --> ${box.read('userNawariCONTACT')}");
        print("userNawariPIECE --> ${box.read('userNawariPIECE')}");
        print("userNawariID2 --> ${box.read('userNawariEMAIL')}");
        print("userNawariPIN --> ${box.read('userNawariPIN')}");
        print('<.....................Les données du customers: $data. ...');
        // return box.read('userNawariID');
      } else {
        print('Aucun document trouvé avec le signUpID spécifié...');
      }
    } catch (e) {
      print('Erreur lors de la récupération du document: $e ...');
    }
  }

  Future<void> logOut_() async {
    await _auth.signOut();
    await box.remove("IS_LOGGED");
    await box.remove("IS_TMP_LOGGED");
    await box.remove("userNawariID");
    await box.remove("userNawariEMAIL");
    await box.remove("userNawariNOM");
    await box.remove("userNawariPRENOM");
    await box.remove("userNawariSEXE");
    await box.remove("userNawariPROFESSION");
    await box.remove("userNawariCONTACT");
    await box.remove("userNawariPIECE");
    await box.remove("userNawariID2");
    await box.erase();
    Fluttertoast.showToast(msg: "Déconnecté!", backgroundColor: Colors.green);
    Get.offAllNamed(Routes.INITIAL);
    Fluttertoast.showToast(msg: "Déconnecté!", backgroundColor: Colors.green);
  }
}
