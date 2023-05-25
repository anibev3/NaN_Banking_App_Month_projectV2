import 'package:another_flushbar/flushbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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
        : Get.to(() => const EntryPoint());
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
  var logOut = false.obs;
  var logOutIndicator = false.obs;
  var annulerLogOut = false.obs;

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
        await fetchCustomerData(userCredential.user!.uid);
        setUser(userCredential.user);
        firebaseUser.value != null
            ? Get.offAll(() => const EntryPoint())
            : Get.to(() => const WelcomeScreen());
        // : Get.to(() => const WelcomeScreen());
        // await _customerController.fetchCustomerData(userCredential.user!.uid);

        print('< Auth repo...');
        print('< ${userCredential.user} _________________________>');
        print('<...>');
        // await box.write('serLoginIed', uid);
        print('ID_User - ${userCredential.user!.uid}');
        // await fetchDocumentBySignUpID(uid);
        Flushbar(
          backgroundColor: Colors.green,
          title: "Connexion reussi",
          margin: EdgeInsets.only(top: 50),
          message: "Heureux de vous revoir ${userCredential.user!.email}",
          duration: Duration(seconds: 4),
          flushbarPosition: FlushbarPosition.TOP,
        ).show(Get.context!);
        if (userCredential.user!.uid != null) {
          issubmitLoading(false);
          isGestureEnabled(false);

          // Get.toNamed(Routes.HOME);
        }
        await Flushbar(
          backgroundColor: Colors.green,
          title: "Connexion reussi",
          margin: EdgeInsets.only(top: 50),
          message: "Heureux de vous revoir ${userCredential.user!.email}",
          duration: Duration(seconds: 4),
          flushbarPosition: FlushbarPosition.TOP,
        ).show(Get.context!);
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

        print("DATA1 --> ${data['id']}");
        String userConnectedId = box.read('userNawariID');
        print("DATA2 --> $userConnectedId");

        Get.toNamed(Routes.HOME);
        // Get.toNamed(Routes.HOME, arguments: {'variable': data['id']});

        // if (data != null) {
        //   String id = data['id'];
        //   String signUpID = data['signUpID'];
        //   String nom = data['nom'];
        //   String prenoms = data['prenoms'];
        //   String email = data['mail'];
        //   String profession = data['profession'];
        //   // Timestamp dateNaissance = data['dateNaissance'];
        //   // Timestamp dateCreat = data['dateCreat'];
        //   String sexe = data['sexe'];
        //   String typeCpt = data['typeCpt'];
        //   String numTel = data['numTel'];
        //   // List<String> transactions = data['transactions'];
        //   bool freeze = data['freeze'];
        //   // bool freeze = data['freeze'].value ?? false;
        //   String numPce = data['numPce'];
        //   String gestionnaire = data['gestionnaire'];
        //   double solde = data['solde'];
        //   int nbTransac = data['nbTransac'];
        //   // await box.write('userNawariID', id);

        //   // Faites quelque chose avec les données récupérées
        print('<.....................Les données du customers: $data. ...');
        //   print(
        //       '<.....................Les données du customers: $profession. ...');
        //   // Mettre à jour le contrôleur avec les nouvelles informations
        //   // _customerController.setCustomerInfo(
        //   //   id,
        //   //   signUpID,
        //   //   nom,
        //   //   prenoms,
        //   //   email,
        //   //   profession,
        //   //   dateNaissance,
        //   //   dateCreat,
        //   //   sexe,
        //   //   typeCpt,
        //   //   numTel,
        //   //   // transactions,
        //   //   //
        //   //   freeze,
        //   //   //
        //   //   // numPce,
        //   //   // gestionnaire,
        //   //   solde,
        //   //   // nbTransac,
        //   // );
        // }
      } else {
        print('Aucun document trouvé avec le signUpID spécifié...');
      }
    } catch (e) {
      print('Erreur lors de la récupération du document: $e ...');
    }

    // List<String> names = List<String>.from(customerDocument['names']);
    // List<bool> boolValues = List<bool>.from(customerDocument['boolValues']);
    // List<Timestamp> dateTimestamps =
    //     List<Timestamp>.from(customerDocument['dates']);
    // List<DateTime> dates =
    //     dateTimestamps.map((timestamp) => timestamp.toDate()).toList();
  }

  Future<void> annulerLogOut_() async {
    print("Fonction annler aplé VALEUR DE LOGOUT: $logOut");
    logOut(false);
    logOutIndicator(false);
  }

  Future<void> logOut_() async {
    logOutIndicator(true);
    print("VALEUR DE LOGOUT: $logOut");

    await Future.delayed(Duration(seconds: 4), () {
      logOut(true);
      logOutIndicator(false);
      print("VALEUR DE LOGOUT: $logOut");

      // annulerLogOut_();
    });

    if (logOut.value == true) {
      print("VALEUR DE LOGOUT: DECONNEXION REUSSI");

      await _auth.signOut();
      await box.erase();
      setUser(null);
      Get.toNamed(Routes.INITIAL);
    } else {
      print("VALEUR DE LOGOUT: $logOut");
      return;
    }
  }
}
