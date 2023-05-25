import 'dart:convert';

import 'package:intl/intl.dart';

List<Pharmacie> listPharmacieFromJson(String str) =>
    List<Pharmacie>.from(json.decode(str).map((x) => Pharmacie.fromMap(x)));

String listPharmacieToJson(List<Pharmacie> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toMap())));

class Pharmacie {
  Pharmacie({
    this.id,
    this.nom,
    this.uniqueID,
    this.createdAt,
    this.updatedAt,
    this.adresse,
    this.contact,
    this.logoPath,
    this.imagePath,
  });

  String? id;
  String? nom;
  String? uniqueID;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? adresse;
  String? contact;
  String? imagePath;
  String? logoPath;

  // List<String>? roles;

  factory Pharmacie.fromJson(String str) => Pharmacie.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Pharmacie.fromMap(Map<String, dynamic> json) => Pharmacie(
        id: json["id"],
        nom: json["nom"],
        uniqueID: json["uniqueID"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        adresse: json["adresse"],
        contact: json["contact"],
        logoPath: json["logoPath"],
        imagePath: json["imagePath"],
        // roles: List<String>.from(json["roles"].map((x) => x)),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "nom": nom,
        "uniqueID": uniqueID,
        "createdAt": createdAt == null
            ? null
            : DateFormat("yyyy-MM-dd HH:mm:ss").format(createdAt!),
        "updatedAt": updatedAt == null
            ? null
            : DateFormat("yyyy-MM-dd HH:mm:ss").format(updatedAt!),
        "adresse": adresse,
        "contact": contact,
        "logoPath": logoPath,
        "imagePath": imagePath,
        // "roles":
        // roles == null ? null : List<dynamic>.from(roles!.map((x) => x)),
      };
}
