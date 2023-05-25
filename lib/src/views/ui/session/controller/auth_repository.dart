import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_auth/firebase_auth.dart';
import 'package:nan_banking_app_mai_project/src/routes/app_pages.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/session/InfoSup.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/session/models/user_model.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/session/welcome.screen.dart';
import 'package:nan_banking_app_mai_project/src/views/widgets/lib/entry_point.dart';

class AuthRepository extends GetxController {
  static AuthRepository get instance => Get.find();
  var issubmitLoading = false.obs;
  var isGestureEnabled = false.obs;

  //Variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  GetStorage box = GetStorage();

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
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password, String contact_) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      // Récupérer les informations de l'utilisateur
      String uid = userCredential.user!.uid;
      dynamic userEmail = userCredential.user!.email;

      // Créer une instance de la classe User
      UserTempon user =
          UserTempon(uid: uid, email: userEmail, contact: contact_);
      // Enregistrer les informations de l'utilisateur dans Firestore

      await FirebaseFirestore.instance
          .collection('UserCreated')
          .doc(uid)
          .set({'userID': uid, 'userMail': userEmail, 'userNumb': contact_});

      await box.write('user', user);

      firebaseUser.value != null
          ? Get.offAll(() => InfoSupScreen(user: user))
          : Get.to(() => const WelcomeScreen());

      print(
          '<_______________________________ Auth repo _______________________________>');
      print(
          '<________________________  -- ${contact_} _________________________>');
      print(
          '<________________________________________________________________________>');
    } on FirebaseAuthException catch (e) {
      // final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      // print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      print('FIREBASE AUTH EXCEPTION}');
    } catch (_) {
      // const ex = SignUpWithEmailAndPasswordFailure();
      // print('EXCEPTION - ${ex.message}');
      // throw ex;
    }
  }

  Future<void> loginWithEmailAndPasseword(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const EntryPoint())
          : Get.to(() => const WelcomeScreen());
      //
      String uid = userCredential.user!.uid;
      dynamic userEmail = userCredential.user!.email;
      //
      // UserTempon user = UserTempon(uid: uid, email: userEmail);
      print('< Auth repo...');
      print('< ${userCredential} _________________________>');
      print('<...>');
      // await box.write('user', user);
      // await box.write('userLoginId', uid);
      await fetchDocumentBySignUpID(uid);
    } on FirebaseAuthException catch (e) {
      // final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      // print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      print('FIREBASE AUTH EXCEPTION}');
    } catch (_) {
      // const ex = SignUpWithEmailAndPasswordFailure();
      // print('EXCEPTION - ${ex.message}');
      // throw ex;
      print('AN ERROR OCCURED WHEN CONNECTED TO FIREBASE}');
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    print("<___________ LogOut a ete cliqué ___________>");
    await box.erase();
    Get.toNamed(Routes.INITIAL);
    Future.delayed(const Duration(seconds: 3), () {
      issubmitLoading(false);
      isGestureEnabled(false);
    });
  }

  Future<void> fetchDocumentBySignUpID(String signUpID) async {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    try {
      QuerySnapshot querySnapshot = await firestore
          .collection('Customers')
          .where('signUpID', isEqualTo: signUpID)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot documentSnapshot = querySnapshot.docs[0];
        Map<String, dynamic>? data =
            documentSnapshot.data() as Map<String, dynamic>?;

        if (data != null) {
          // Accédez aux données individuelles du document
          String? documentId = documentSnapshot.id;
          await box.write('userNawariID', documentId);

          // String? nom = data['nom'];
          // int? email = data['mail'];

          // Faites quelque chose avec les données récupérées
          print('Document ID: $documentId ...');
        }
      } else {
        print('Aucun document trouvé avec le signUpID spécifié...');
      }
    } catch (e) {
      print('Erreur lors de la récupération du document: $e ...');
    }
  }
}
