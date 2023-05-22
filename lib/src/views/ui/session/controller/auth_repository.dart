import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
// Copyright 2022, the Chromium project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:firebase_auth/firebase_auth.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/home/home.screen.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/session/InfoSup.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/session/models/user_model.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/session/welcome.screen.dart';
import 'package:nan_banking_app_mai_project/src/views/widgets/lib/entry_point.dart';

class AuthRepository extends GetxController {
  static AuthRepository get instance => Get.find();

  //Varoables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    // ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    user == null
        ? Get.offAll(() => const WelcomeScreen())
        : Get.offAll(() => const EntryPoint());
  }
  // on FirebaseAuthException catch(e) {

  // } catch(_){

  // }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);

      // Récupérer les informations de l'utilisateur
      String uid = userCredential.user!.uid;
      dynamic userEmail = userCredential.user!.email;

      // Créer une instance de la classe User
      UserTempon user = UserTempon(uid: uid, email: userEmail);
      // Enregistrer les informations de l'utilisateur dans Firestore

      await FirebaseFirestore.instance
          .collection('UserCreated')
          .doc(uid)
          .set({'userID': uid, 'userMail': userEmail});

      firebaseUser.value != null
          ? Get.offAll(() => InfoSupScreen(user: user))
          : Get.to(() => const WelcomeScreen());
      // print(
      //     '<________________________________________________________________________>');
      // print(
      //     '<________________________ ${firebaseUser.value} _________________________>');
      // print(
      //     '<________________________________________________________________________>');
      print(
          '<_______________________________ Auth repo _______________________________>');
      print(
          '<________________________ ${uid} -- ${userEmail} _________________________>');
      print(
          '<____________________________________  ____________________________________>');
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
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      // firebaseUser.value != null
      //     ? Get.offAll(() => const EntryPoint())
      //     : Get.to(() => const WelcomeScreen());
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

  Future<void> logout() async => await _auth.signOut();
}
