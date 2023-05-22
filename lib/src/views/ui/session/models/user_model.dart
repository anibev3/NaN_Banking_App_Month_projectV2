import 'package:cloud_firestore/cloud_firestore.dart';

class UserTempon {
  final String uid;
  final String email;
  final String contact;

  UserTempon({required this.uid, required this.email, required this.contact});
}
