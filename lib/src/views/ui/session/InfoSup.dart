import 'package:another_flushbar/flushbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nan_banking_app_mai_project/src/routes/app_pages.dart';
import 'package:nan_banking_app_mai_project/src/utils/helpers/signIn_button.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/Constant.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/session/components/constants.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/session/components/customers.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/session/components/dropButton.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/session/components/radioHF.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/session/controller/register_controller.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/session/models/user_model.dart';

class InfoSupScreen extends StatefulWidget {
  InfoSupScreen({
    super.key,
  });

  @override
  State<InfoSupScreen> createState() => _InfoSupScreenState();
}

class _InfoSupScreenState extends State<InfoSupScreen> {
  RegisterController registerController = Get.put(RegisterController());

  GetStorage box = GetStorage();

  final _formKey = GlobalKey<FormState>();

  final controllerNom = TextEditingController();

  final controllerPrenom = TextEditingController();

  final controllerProfession = TextEditingController();

  final controllerNumID = TextEditingController();

  final controllerPhone = TextEditingController();

  final controllerMontant = TextEditingController();

  final controllerSolde = TextEditingController();

  late DateTime selectDate;

  String nextId = "";

  var issubmitLoading = false.obs;

  var isGestureEnabled = false.obs;

  var isPassword = true.obs;

  var isEmptyAll = false.obs;

  var isEmptyMail = false.obs;

  var isEmptyPassword = false.obs;

  var isError = false.obs;

  var isOk = false.obs;

  RxString errorConnexion = ''.obs;
  String local_uid = '';
  String local_email = '';
  String local_contact = '';

  @override
  void onReady() {}

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    local_uid = box.read('userNawariIdTEMPOM');
    local_email = box.read('userNawariEMAIL');
    local_contact = box.read('userNawariCONTACT');
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
                              Container(
                                margin: const EdgeInsets.only(top: 10),
                                child: const Text(
                                  "Informations supplementaire",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 40,
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
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    // decoration: BoxDecoration(
                                    //   borderRadius: BorderRadius.circular(10.0),
                                    //   color: const Color(0xFF4DA1B0),
                                    // ),
                                    constraints:
                                        const BoxConstraints(maxWidth: 140),
                                    padding: const EdgeInsets.only(right: 5),
                                    child: DateTimeFormField(
                                      dateFormat: DateFormat.yMd('en_US'),
                                      mode: DateTimeFieldPickerMode.date,
                                      decoration: const InputDecoration(
                                        focusColor: Colors.white70,
                                        hoverColor: Colors.white70,
                                        fillColor: Colors.white70,
                                        helperStyle:
                                            TextStyle(color: Colors.white70),
                                        prefixStyle:
                                            TextStyle(color: Colors.white70),
                                        suffixStyle:
                                            TextStyle(color: Colors.white70),
                                        // floatingLabelStyle:
                                        //     TextStyle(color: Colors.white70),
                                        floatingLabelStyle:
                                            TextStyle(color: Colors.white70),
                                        labelStyle:
                                            TextStyle(color: Colors.white70),
                                        iconColor: Colors.white70,
                                        hintStyle:
                                            TextStyle(color: Colors.white70),
                                        errorStyle:
                                            TextStyle(color: Colors.redAccent),
                                        border: OutlineInputBorder(),
                                        prefixIcon: Icon(Icons.event_note),
                                        prefixIconColor: Colors.white70,
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
                                  Container(
                                      constraints: const BoxConstraints(
                                          maxWidth: 205, maxHeight: 70),
                                      child: const DropdownButtonCpt()),
                                ],
                              ),
                              SizedBox(
                                height: 20,
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
                              // SizedBox(
                              //   height: 8,
                              // ),
                              // const SizedBox(
                              //   height: 8,
                              // ),
                              // const SizedBox(
                              //   height: 8,
                              // ),
                              // SizedBox(
                              //   height: 30,
                              // ),

                              Expanded(child: Container()),

                              Obx(
                                () => SignInButton(
                                  isGestureEnabled: isGestureEnabled.value,
                                  isloading: issubmitLoading.value,
                                  text: "Continuer",
                                  size: size,
                                  onTap: () {
                                    final Customer customer = Customer(
                                        id: "",
                                        nom: controllerNom.text,
                                        prenoms: controllerPrenom.text,
                                        dateNaissance: selectDate,
                                        profession: controllerProfession.text,
                                        numPce: controllerNumID.text,
                                        numTel: controllerPhone.text,
                                        // solde:
                                        //     double.parse(controllerSolde.text),
                                        solde: 0,
                                        mail: local_email,
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

                                    // ScaffoldMessenger.of(context).showSnackBar(
                                    //   const SnackBar(
                                    //     backgroundColor: Colors.green,
                                    //     content: Text('Compte créer'),
                                    //   ),
                                    // );
                                  },
                                ),
                              ),
                              Expanded(
                                  child:
                                      SizedBox(height: 1, child: Container())),
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
    issubmitLoading(true);
    isGestureEnabled(true);
    if (customer.nom != "" &&
        customer.prenoms != "" &&
        customer.profession != "" &&
        customer.numPce != "") {
      final docUserLengthRef =
          FirebaseFirestore.instance.collection("Customers");
      QuerySnapshot snapshot = await docUserLengthRef.get();
      int docUserLength = snapshot.size;
      nextId = "NAW001" + (docUserLength++).toString().padLeft(3, '0');
      final docUser = FirebaseFirestore.instance
          .collection("Customers")
          .doc(nextId); //"NAW001"+"v"
      final json = {
        "id": docUser.id, // later
        "signUpID": local_uid,
        "nom": customer.nom,
        "prenoms": customer.prenoms,
        "dateCreat": customer.dateCreat,
        "dateNaissance": customer.dateNaissance,
        "gestionnaire": customer.gestionnaire,
        "mail": customer.mail,
        "numPce": customer.numPce,
        "numTel": local_contact,
        "profession": customer.profession,
        "sexe": customer.sexe,
        "solde": double.parse(customer.solde.toString()),
        "freeze": false,
        "typeCpt": customer.typeCpt,
        "nbTransac": customer.nbTransac,
        "transactions": [],
        "securityPin": "1234",
      };
      print(nextId);
      await docUser.set(json);

      print(docUserLengthRef);

      if (docUserLengthRef != null) {
        await box.write('userNawariID', nextId);
        await box.write('userNawariIdTEMPOM', local_uid);
        await box.write('userNawariEMAIL', local_email);
        await box.write('userNawariNOM', customer.nom);
        await box.write('userNawariPRENOM', customer.prenoms);
        await box.write('userNawariSEXE', customer.sexe);
        await box.write('userNawariPROFESSION', customer.profession);
        await box.write('userNawariCONTACT', local_contact);
        await box.write('userNawariPIECE', customer.numPce);
        await box.write('userNawariID2', local_uid);
        await box.write("IS_TMP_LOGGED", false);
        await box.write("IS_LOGGED", true);
        await box.write('userNawariPIN', "1234");

        print("La valeur du nextID++++++++++++++++++++$nextId");
        await Flushbar(
          backgroundColor: Colors.green,
          title: "Erreur",
          margin: EdgeInsets.only(top: 50),
          message: "Bienvenu  sur Nawari Bank",
          duration: Duration(seconds: 3),
          flushbarPosition: FlushbarPosition.TOP,
        ).show(Get.context!);
        Get.toNamed(Routes.HOME);
      }
    } else if (customer.nom == "" &&
        customer.prenoms == "" &&
        customer.profession == "" &&
        customer.numPce == "") {
      await Flushbar(
        backgroundColor: Colors.red,
        title: "Erreur",
        margin: EdgeInsets.only(top: 50),
        message:
            "Veuillez renseigner le nom,\n-le prenom,\n-la profession,\n-la date de naissance,\n-le type de compte\n-et le numero de la piece d'identité",
        duration: Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
      ).show(Get.context!);
      print("tous les champs sont vide...............................");
      isEmptyAll(true);
      Future.delayed(Duration(seconds: 1), () {
        isEmptyAll(false);
        issubmitLoading(false);
        isGestureEnabled(false);
      });
    } else if (customer.nom == "") {
      print("le nom est vide...............................");
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
    } else if (customer.profession == "") {
      print("la profession est vide...............................");
      await Flushbar(
        backgroundColor: Colors.red,
        title: "Erreur",
        margin: EdgeInsets.only(top: 50),
        message: "Veuillez renseigner la profession",
        duration: Duration(seconds: 3),
        flushbarPosition: FlushbarPosition.TOP,
      ).show(Get.context!);
      isEmptyPassword(true);
      Future.delayed(Duration(seconds: 1), () {
        isEmptyPassword(false);
        issubmitLoading(false);
        isGestureEnabled(false);
      });
    } else if (customer.numPce == "") {
      print("le numero de piece est vide...............................");
      await Flushbar(
        backgroundColor: Colors.red,
        title: "Erreur",
        margin: EdgeInsets.only(top: 50),
        message: "Veuillez renseigner le numero de la piece d'identité",
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

  String getSexe(Genre genre) => (genre == Genre.homme) ? "HOMME" : "FEMME";
}
