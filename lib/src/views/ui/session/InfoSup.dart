import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nan_banking_app_mai_project/src/routes/app_pages.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/Constant.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/messagerie/views/components/constants.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/messagerie/views/components/customers.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/messagerie/views/components/dropButton.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/messagerie/views/components/radioHF.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/session/models/user_model.dart';

class InfoSupScreen extends StatelessWidget {
  final UserTempon user;
  late String uid;
  late String userEmail;
  late TextEditingController? emailController;

  InfoSupScreen({super.key, required this.user}) {
    uid = user.uid;
    userEmail = user.email;
    emailController = TextEditingController(text: user.email ?? '');
  }

  final _formKey = GlobalKey<FormState>();
  final controllerNom = TextEditingController();
  final controllerPrenom = TextEditingController();
  final controllerProfession = TextEditingController();
  final controllerNumID = TextEditingController();
  final controllerPhone = TextEditingController();
  final controllerMontant = TextEditingController();
  late DateTime selectDate;
  String nextId = "";

  @override
  void onReady() {
    print(
        '<__________________________________ infoSup ______________________________>');
    print(
        '<________________________ ${uid} -- ${userEmail} _________________________>');
    print(
        '<________________________________________________________________________>');
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Cst.kPrimary2Color,
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(top: 3),
          height: size.height,
          child: Stack(children: [
            //left side background design. I use a svg image here
            Positioned(
              left: -34,
              top: 181.0,
              child: SvgPicture.string(
                // Group 3178
                '<svg viewBox="-34.0 181.0 99.0 99.0" ><path transform="translate(-34.0, 181.0)" d="M 74.25 0 L 99 49.5 L 74.25 99 L 24.74999618530273 99 L 0 49.49999618530273 L 24.7500057220459 0 Z" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(-26.57, 206.25)" d="M 0 0 L 42.07500076293945 16.82999992370605 L 84.15000152587891 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(15.5, 223.07)" d="M 0 56.42999649047852 L 0 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                width: 99.0,
                height: 99.0,
              ),
            ),

            // right side background design. I use a svg image here
            Positioned(
              right: -52,
              top: 45.0,
              child: SvgPicture.string(
                // Group 3177
                '<svg viewBox="288.0 45.0 139.0 139.0" ><path transform="translate(288.0, 45.0)" d="M 104.25 0 L 139 69.5 L 104.25 139 L 34.74999618530273 139 L 0 69.5 L 34.75000762939453 0 Z" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(298.42, 80.45)" d="M 0 0 L 59.07500076293945 23.63000106811523 L 118.1500015258789 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /><path transform="translate(357.5, 104.07)" d="M 0 79.22999572753906 L 0 0" fill="none" stroke="#ffffff" stroke-width="1" stroke-opacity="0.25" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                width: 139.0,
                height: 139.0,
              ),
            ),

            Positioned(
              top: 5.0,
              child: SizedBox(
                width: size.width,
                height: size.height,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * 0.06),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // // SizedBox(
                      // //   height: 30,
                      // // ),
                      // Container(
                      //   margin: const EdgeInsets.only(top: 1),
                      //   child: const Text(
                      //     "Informations relatives",
                      //   ),
                      // ),
                      // SizedBox(
                      //   height: 1,
                      // ),
                      Form(
                        key: _formKey,
                        child: SizedBox(
                          width: size.width,
                          height: size.height,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              // Container(
                              //   margin: const EdgeInsets.only(top: 10),
                              //   child: const Text(
                              //     "Informations relatives",
                              //   ),
                              // ),
                              // SizedBox(
                              //   height: 30,
                              // ),
                              Container(
                                alignment: Alignment.center,
                                height: size.height / 12,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: const Color(0xFF4DA1B0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      //mail icon
                                      const Icon(
                                        Icons.mail_rounded,
                                        color: Colors.white70,
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),

                                      //divider svg
                                      SvgPicture.string(
                                        '<svg viewBox="99.0 332.0 1.0 15.5" ><path transform="translate(99.0, 332.0)" d="M 0 0 L 0 15.5" fill="none" fill-opacity="0.6" stroke="#ffffff" stroke-width="1" stroke-opacity="0.6" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                        width: 1.0,
                                        height: 15.5,
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),

                                      //email address textField
                                      Expanded(
                                        child: TextFormField(
                                          controller: controllerNom,
                                          maxLines: 1,
                                          cursorColor: Colors.white70,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          style: GoogleFonts.inter(
                                            fontSize: 14.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          decoration: InputDecoration(
                                            hintText: 'Nom',
                                            hintStyle: GoogleFonts.inter(
                                              fontSize: 14.0,
                                              color: Colors.white70,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            border: InputBorder.none,
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Champ obligatoire !';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: 8,
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: size.height / 12,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: const Color(0xFF4DA1B0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      //mail icon
                                      const Icon(
                                        Icons.mail_rounded,
                                        color: Colors.white70,
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),

                                      //divider svg
                                      SvgPicture.string(
                                        '<svg viewBox="99.0 332.0 1.0 15.5" ><path transform="translate(99.0, 332.0)" d="M 0 0 L 0 15.5" fill="none" fill-opacity="0.6" stroke="#ffffff" stroke-width="1" stroke-opacity="0.6" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                        width: 1.0,
                                        height: 15.5,
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),

                                      //email address textField
                                      Expanded(
                                        child: TextFormField(
                                          controller: controllerPrenom,
                                          maxLines: 1,
                                          cursorColor: Colors.white70,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          style: GoogleFonts.inter(
                                            fontSize: 14.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          decoration: InputDecoration(
                                            hintText: 'Prénom',
                                            hintStyle: GoogleFonts.inter(
                                              fontSize: 14.0,
                                              color: Colors.white70,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            border: InputBorder.none,
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Champ obligatoire !';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: size.height / 12,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: const Color(0xFF4DA1B0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      //mail icon
                                      const Icon(
                                        Icons.mail_rounded,
                                        color: Colors.white70,
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),

                                      //divider svg
                                      SvgPicture.string(
                                        '<svg viewBox="99.0 332.0 1.0 15.5" ><path transform="translate(99.0, 332.0)" d="M 0 0 L 0 15.5" fill="none" fill-opacity="0.6" stroke="#ffffff" stroke-width="1" stroke-opacity="0.6" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                        width: 1.0,
                                        height: 15.5,
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),

                                      //email address textField
                                      Expanded(
                                        child: TextFormField(
                                          controller: controllerProfession,
                                          maxLines: 1,
                                          cursorColor: Colors.white70,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          style: GoogleFonts.inter(
                                            fontSize: 14.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          decoration: InputDecoration(
                                            hintText: 'Profession',
                                            hintStyle: GoogleFonts.inter(
                                              fontSize: 14.0,
                                              color: Colors.white70,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            border: InputBorder.none,
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Champ obligatoire !';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              const SizedBox(
                                height: 8,
                              ),
                              Flexible(
                                child: Container(
                                  constraints:
                                      const BoxConstraints(maxWidth: 200),
                                  padding: const EdgeInsets.only(right: 5),
                                  child: DateTimeFormField(
                                    dateFormat: DateFormat.yMd('en_US'),
                                    mode: DateTimeFieldPickerMode.date,
                                    decoration: const InputDecoration(
                                      hintStyle:
                                          TextStyle(color: Colors.white70),
                                      errorStyle:
                                          TextStyle(color: Colors.redAccent),
                                      border: OutlineInputBorder(),
                                      suffixIcon: Icon(Icons.event_note),
                                      labelText: 'Date de naissance',
                                    ),
                                    firstDate: DateTime(2020, 1, 1),
                                    // .add(const Duration(days: 10)),
                                    initialDate: DateTime(2023, 5, 5),
                                    autovalidateMode: AutovalidateMode.always,
                                    validator: (DateTime? e) =>
                                        (e?.day ?? 0) == 1
                                            ? 'Please not the first day'
                                            : null,
                                    onDateSelected: (value) {
                                      print(value.runtimeType);
                                      selectDate = value;
                                    },
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: 8,
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: size.height / 12,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: const Color(0xFF4DA1B0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      //mail icon
                                      const Icon(
                                        Icons.mail_rounded,
                                        color: Colors.white70,
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),

                                      //divider svg
                                      SvgPicture.string(
                                        '<svg viewBox="99.0 332.0 1.0 15.5" ><path transform="translate(99.0, 332.0)" d="M 0 0 L 0 15.5" fill="none" fill-opacity="0.6" stroke="#ffffff" stroke-width="1" stroke-opacity="0.6" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                        width: 1.0,
                                        height: 15.5,
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),

                                      //email address textField
                                      Expanded(
                                        child: TextFormField(
                                          controller: controllerNumID,
                                          maxLines: 1,
                                          cursorColor: Colors.white70,
                                          keyboardType: TextInputType.text,
                                          style: GoogleFonts.inter(
                                            fontSize: 14.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          decoration: InputDecoration(
                                            hintText: "N°Pièce d'identité",
                                            hintStyle: GoogleFonts.inter(
                                              fontSize: 14.0,
                                              color: Colors.white70,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            border: InputBorder.none,
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Champ obligatoire !';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: 8,
                              ),
                              Container(
                                alignment: Alignment.center,
                                height: size.height / 12,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: const Color(0xFF4DA1B0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      //mail icon
                                      const Icon(
                                        Icons.mail_rounded,
                                        color: Colors.white70,
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),

                                      //divider svg
                                      SvgPicture.string(
                                        '<svg viewBox="99.0 332.0 1.0 15.5" ><path transform="translate(99.0, 332.0)" d="M 0 0 L 0 15.5" fill="none" fill-opacity="0.6" stroke="#ffffff" stroke-width="1" stroke-opacity="0.6" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                        width: 1.0,
                                        height: 15.5,
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),

                                      //email address textField
                                      Expanded(
                                        child: TextFormField(
                                          controller: controllerPhone,
                                          maxLines: 1,
                                          cursorColor: Colors.white70,
                                          keyboardType: TextInputType.phone,
                                          style: GoogleFonts.inter(
                                            fontSize: 14.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          decoration: InputDecoration(
                                            hintText: "Numéro de téléphone",
                                            hintStyle: GoogleFonts.inter(
                                              fontSize: 14.0,
                                              color: Colors.white70,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            border: InputBorder.none,
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Champ obligatoire !';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              const SizedBox(
                                height: 8,
                              ),
                              // TextFormField(
                              //   enabled: false,
                              //   controller:
                              //       emailController ?? TextEditingController(),
                              //   // The validator receives the text that the user has entered.
                              //   textCapitalization: TextCapitalization.characters,
                              //   decoration: const InputDecoration(
                              //       label: Text("Adresse mail"),
                              //       hintText: "xx@yy.zz",
                              //       contentPadding: EdgeInsets.symmetric(
                              //           horizontal: 8, vertical: 5),
                              //       border: OutlineInputBorder()),
                              //   validator: (value) {
                              //     if (value == null || value.isEmpty) {
                              //       return 'Champ obligatoire !';
                              //     }
                              //     return null;
                              //   },
                              // ),
                              // Container(
                              //     margin: const EdgeInsets.only(top: 10),
                              //     child: const Text("Ouverture du compte")),
                              const SizedBox(
                                height: 8,
                              ),
                              Flexible(
                                child: Container(
                                    constraints:
                                        const BoxConstraints(maxWidth: 200),
                                    child: const DropdownButtonCpt()),
                              ),
                              const SizedBox(
                                height: 8,
                              ),

                              Container(
                                alignment: Alignment.center,
                                height: size.height / 12,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: const Color(0xFF4DA1B0),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      //mail icon
                                      const Icon(
                                        Icons.mail_rounded,
                                        color: Colors.white70,
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),

                                      //divider svg
                                      SvgPicture.string(
                                        '<svg viewBox="99.0 332.0 1.0 15.5" ><path transform="translate(99.0, 332.0)" d="M 0 0 L 0 15.5" fill="none" fill-opacity="0.6" stroke="#ffffff" stroke-width="1" stroke-opacity="0.6" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                        width: 1.0,
                                        height: 15.5,
                                      ),
                                      const SizedBox(
                                        width: 16,
                                      ),

                                      //email address textField
                                      Expanded(
                                        child: TextFormField(
                                          controller: controllerMontant,
                                          maxLines: 1,
                                          cursorColor: Colors.white70,
                                          keyboardType:
                                              TextInputType.emailAddress,
                                          style: GoogleFonts.inter(
                                            fontSize: 14.0,
                                            color: Colors.white,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          decoration: InputDecoration(
                                            hintText: "Montant a l'ouverture",
                                            hintStyle: GoogleFonts.inter(
                                              fontSize: 14.0,
                                              color: Colors.white70,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            border: InputBorder.none,
                                          ),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Champ obligatoire !';
                                            }
                                            return null;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              InkWell(
                                onTap: () {
                                  // Get.toNamed(Routes.LOGINOTP);
                                  // print(drpValue);
                                  print(
                                      '<___________________ $userEmail ____________________>');
                                  print(
                                      '<___________________ $uid ____________________>');
                                  // Validate returns true if the form is valid, or false otherwise.
                                  if (_formKey.currentState!.validate()) {
                                    final Customer customer = Customer(
                                        id: "",
                                        nom: controllerNom.text,
                                        prenoms: controllerPrenom.text,
                                        dateNaissance: selectDate,
                                        profession: controllerProfession.text,
                                        numPce: controllerNumID.text,
                                        numTel: controllerPhone.text,
                                        solde: double.parse(
                                            controllerMontant.text),
                                        mail: userEmail,
                                        sexe: getSexe(genreCus),
                                        typeCpt: drpValue,
                                        gestionnaire: "GEST001",
                                        dateCreat: DateTime.now(),
                                        nbTransac: 0);

                                    creatCustomer(customer: customer);
                                    controllerNom.clear();
                                    controllerPrenom.clear();
                                    controllerProfession.clear();
                                    controllerNumID.clear();
                                    controllerPhone.clear();
                                    controllerMontant.clear();
                                    // controllerEmail.clear();
                                    // If the form is valid, display a snackbar. In the real world,
                                    // you'd often call a server or save the information in a database.
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          backgroundColor: Colors.green,
                                          content: Text('Compte créer')),
                                    );
                                  }
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: size.height / 13,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: const Color(0xFFF56B3F),
                                  ),
                                  child: Text(
                                    "Continuer",
                                    style: GoogleFonts.inter(
                                      fontSize: 16.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Future creatCustomer({required Customer customer}) async {
    final docUserLengthRef = FirebaseFirestore.instance.collection("Customers");
    // QuerySnapshot snapshot = await docUserLengthRef.get();
    // int docUserLength = snapshot.size;
    // nextId = "NAW001" + (docUserLength++).toString().padLeft(3, '0');
    final docUser = FirebaseFirestore.instance
        .collection("Customers")
        .doc(uid); //"NAW001"+"v"
    final json = {
      "id": uid, // later
      "nom": customer.nom,
      "prenoms": customer.prenoms,
      "dateCreat": customer.dateCreat,
      "dateNaissance": customer.dateNaissance,
      "gestionnaire": customer.gestionnaire,
      "mail": customer.mail,
      "numPce": customer.numPce,
      "numTel": customer.numTel,
      "profession": customer.profession,
      "sexe": customer.sexe,
      "solde": customer.solde,
      "typeCpt": customer.typeCpt,
      "nbTransac": customer.nbTransac,
      "transactions": []
    };
    // print(nextId);
    await docUser.set(json);

    print(docUserLengthRef);
    if (docUserLengthRef != null) {
      Get.toNamed(Routes.HOME);
    }
  }

  String getSexe(Genre genre) => (genre == Genre.homme) ? "HOMME" : "FEMME";
}
