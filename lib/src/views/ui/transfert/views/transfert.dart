import 'package:another_flushbar/flushbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:nan_banking_app_mai_project/src/routes/app_pages.dart';
import 'package:nan_banking_app_mai_project/src/utils/helpers/alert_message_2.dart';
import 'package:nan_banking_app_mai_project/src/utils/helpers/info_crediteur.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/Constant.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/app_text_style.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/confirm/controller/confirm_to_enter_controller.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/parametre/views/custom_button.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/parametre/views/global_constants.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/parametre/views/test/testWidgets/amount_text_field.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/parametre/views/test/testWidgets/confirm_pin_to_send_money_dialpad.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/parametre/views/test/testWidgets/custom_textfield.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/parametre/views/test/testWidgets/get_transfer_username_textfield.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/session/components/constants.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/session/components/dropButtonBnk.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/session/components/radioHF.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/session/models/user_model.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/transfert/models/transaction_Prototype.dart';
import 'package:nan_banking_app_mai_project/src/views/widgets/lib/utils/sendMoneyButtun.dart';
import 'package:unicons/unicons.dart';

class Transfert extends StatefulWidget {
  const Transfert({super.key});

  @override
  State<Transfert> createState() => _Transfert();
}

class _Transfert extends State<Transfert> {
//
//
//
//
//
//
//
//
//
//
//
//
//
  ConfirmController confirmController = Get.put(ConfirmController());

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController summaryController = TextEditingController();

  String? successText = '';
  String errorText = 'Invalid username';
  bool? error;
  final transferKey = GlobalKey<FormState>();

  void transferMoney() {
    // final user = Provider.of<UserProvider>(context, listen: false).user;
    if (transferKey.currentState!.validate()) {
      // homeService.transferMoney(
      // context: context,
      // sendersUsername: user.username,
      // recipientsUsername: usernameController.text,
      // amount: int.parse(amountController.text),
      // description: summaryController.text,
      // );
    }
  }
//
//
//
//
//
//
//
//
//
//
//
//

  CustomerController customerController = Get.put(CustomerController());

  GetStorage box = GetStorage();

  // List of controller's itmes for text formField
  final _formKey = GlobalKey<FormState>();
  final contrNumCliDeb = TextEditingController();
  final contrNumCliCred = TextEditingController();
  final contrNomClientCred = TextEditingController();
  final contrBanque = TextEditingController();
  final contrMontant = TextEditingController();
  final contrTypeOper = TextEditingController();

  //For the dateFormField value
  DateTime selectDate = DateTime.now();
  DateTime selectDateEFF = DateTime.now();
  String nextId = "";
  // ignore: unnecessary_question_mark
  String userConnectedId = "";

  //for the DropButton of the transactions
  static List<String> list = <String>["Versement", "Virement"];
  Map<String, dynamic> listIcon = {
    "Versement": const Icon(Icons.trending_down),
    "Virement": const Icon(Icons.trending_up)
  };
  bool active = false;
  String dropdownValueTrans = list.first;
  UserTempon? storedUserTenpom;
  //---end--- dropButton items

  //Variables
  late Rx<User?> firebaseUser = Rx<User?>(null);
  final _auth = FirebaseAuth.instance;
  // late final Rx<User?> firebaseUser;

  @override
  void initState() {
    super.initState();
    print('On est dans le initState... du makeTransaction');

    showUserValue();
    onReady();
  }

  void onReady() {
    storedUserTenpom = box.read<UserTempon>('user');
    firebaseUser.value = _auth.currentUser;
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
    showUserValue();
  }

  _setInitialScreen(User? user) {
    print('<____________________>');
    print('< $user >');
    print('<____________________>');
  }

  void showUserValue() async {
    // UserTempon? user = firebaseUser.value;
    userConnectedId = await box.read('userNawariID');

    if (userConnectedId != null) {
      print('ID UTILISATEUR IN TRANSFERT PAGE : ${userConnectedId}');
    } else {
      print('Aucun utilisateur connecté');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildHeader(),
              SizedBox(
                height: value20,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: value20),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: value10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: value250,
                                child: GetTransferUsernameTextField(
                                  labelText:
                                      "Rechercher le compte d'un destinataire",
                                  hintText: "numéro de compte",
                                  prefixIcon: "@",
                                  controller: usernameController,
                                  errorText: error == true ? errorText : null,
                                  // errorText: "",
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  // top: error == true ? heightValue20 : heightValue40,
                                  top: heightValue40,
                                ),
                                child: GestureDetector(
                                  onTap: () {
                                    if (usernameController.text != "") {
                                      customerController.getCustomerName(
                                          usernameController.text);
                                    } else {
                                      Flushbar(
                                        backgroundColor: Colors.red,
                                        title: "Erreur",
                                        margin: EdgeInsets.only(top: 50),
                                        message: "Remplissez le champs",
                                        duration: Duration(seconds: 3),
                                        flushbarPosition: FlushbarPosition.TOP,
                                      ).show(Get.context!);
                                    }
                                  },
                                  child: Container(
                                    height: heightValue65,
                                    width: heightValue65,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: defaultAppColor,
                                    ),
                                    child: Center(
                                      child: Icon(
                                        Icons.search,
                                        color: Colors.white,
                                        size: heightValue27,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Obx(() {
                            if (customerController.customerIsExist == true) {
                              return Padding(
                                padding: EdgeInsets.only(top: heightValue20),
                                child: Stack(
                                  children: [
                                    Container(
                                      width: screenWidth,
                                      height: heightValue240,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            heightValue20),
                                        color: Colors.grey[300],
                                      ),
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: value12,
                                          ),
                                          CircleAvatar(
                                            radius: heightValue25,
                                            child: Center(
                                              child: Icon(UniconsLine.user),
                                            ),
                                          ),
                                          SizedBox(
                                            width: value12,
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Informations client trouvé",
                                                style: TextStyle(
                                                  fontSize: heightValue18,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Nom',
                                                    style: TextStyle(
                                                      fontSize: heightValue18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Obx(() => Text(
                                                        "${customerController.customerPrename} ${customerController.customerName}",
                                                        style: TextStyle(
                                                          fontSize:
                                                              heightValue18,
                                                        ),
                                                      ))
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'Profession',
                                                    style: TextStyle(
                                                      fontSize: heightValue18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Obx(() => Text(
                                                        " ${customerController.customerProfession.toLowerCase()}",
                                                        style: TextStyle(
                                                          fontSize:
                                                              heightValue18,
                                                        ),
                                                      ))
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'N°Compte',
                                                    style: TextStyle(
                                                      fontSize: heightValue18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Obx(
                                                    () => Text(
                                                      " ${customerController.customerID}",
                                                      style: TextStyle(
                                                        fontSize: heightValue18,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    'N°Téléphone',
                                                    style: TextStyle(
                                                      fontSize: heightValue18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  Obx(
                                                    () => Text(
                                                      " ${customerController.customerNumtel}",
                                                      style: TextStyle(
                                                        fontSize: heightValue18,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 10,
                                              ),
                                              (customerController
                                                          .customerIsfreeze ==
                                                      false)
                                                  ? Row(
                                                      children: [
                                                        Image.asset(
                                                          "assets/img/dialog_success_image.png",
                                                          height: heightValue25,
                                                        ),
                                                        SizedBox(
                                                          width: 8,
                                                        ),
                                                        Text(
                                                          'Compte actif',
                                                          style: TextStyle(
                                                            fontSize:
                                                                heightValue18,
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                                  : Row(
                                                      children: [
                                                        Image.asset(
                                                          "assets/img/error_image.png",
                                                          height: heightValue25,
                                                        ),
                                                        SizedBox(
                                                          width: 8,
                                                        ),
                                                        Text(
                                                          'Compte suspendu',
                                                          style: TextStyle(
                                                            fontSize:
                                                                heightValue18,
                                                          ),
                                                        ),
                                                      ],
                                                    )
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 0,
                                      right: 0,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(
                                            heightValue20,
                                          ),
                                          topLeft: Radius.circular(
                                            heightValue25,
                                          ),
                                        ),
                                        child: Container(
                                          height: heightValue25,
                                          width: heightValue25,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFFDFAD2C),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      top: 0,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(
                                            heightValue25,
                                          ),
                                          topLeft: Radius.circular(
                                            heightValue20,
                                          ),
                                        ),
                                        child: Container(
                                          height: heightValue25,
                                          width: heightValue25,
                                          decoration: const BoxDecoration(
                                            color: Color(0xFF5337A5),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            } else {
                              return Container();
                            }
                          }),
                          Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                AmountTextField(
                                  keyboardType: TextInputType.number,
                                  labelText: "Montant",
                                  hintText:
                                      "Entrer le montant de la transaction",
                                  controller: contrMontant,
                                ),
                                CustomTextField(
                                  labelText: "N°Compte",
                                  hintText:
                                      "Entrer le numero de copmte destinataire",
                                  controller: contrNumCliCred,
                                ),
                                const SizedBox(
                                  height: 6,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Ajourner une transaction",
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: heightValue15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 6,
                                    ),
                                    DateTimeFormField(
                                      dateFormat: DateFormat.yMd('en_US'),
                                      mode: DateTimeFieldPickerMode.date,
                                      decoration: const InputDecoration(
                                        hintStyle:
                                            TextStyle(color: Colors.black45),
                                        errorStyle:
                                            TextStyle(color: Colors.redAccent),
                                        border: OutlineInputBorder(),
                                        suffixIcon: Icon(Icons.event_note),
                                        labelText: 'Date effective',
                                      ),
                                      firstDate: DateTime.now(),
                                      // .add(const Duration(days: 10)),
                                      initialDate: DateTime.now(),
                                      autovalidateMode: AutovalidateMode.always,
                                      validator: (DateTime? e) =>
                                          (e?.day ?? 0) == -1
                                              ? 'Please not the first day'
                                              : null,
                                      onDateSelected: (value) {
                                        print(value.runtimeType);
                                        selectDateEFF = value;
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Obx(() => CustomButton(
                              isGestureEnabled:
                                  confirmController.showSpinner.value,
                              isloading: confirmController.showSpinner.value,
                              buttonText: "Envoyer",
                              buttonColor: defaultAppColor,
                              buttonTextColor: whiteColor,
                              onTap: () {
                                // showModalBottomSheet<dynamic>(
                                //   context: context,
                                //   enableDrag: false,
                                //   isDismissible: false,
                                //   isScrollControlled: true,
                                //   constraints: BoxConstraints.loose(
                                //     Size(
                                //       screenWidth,
                                //       screenHeight,
                                //     ),
                                //   ),
                                //   builder: (context) =>
                                //       ConfirmPinToSendMoneyDialPad(
                                //     onSuccess: () {
                                //       // transferMoney();
                                //     },
                                //   ),
                                // );

                                if (_formKey.currentState!.validate()) {
                                  // this is the firebase instance calling | To have the differents response for the following cases..
                                  confirmController.startLoading();

                                  getValueTrans(
                                    idTrans: "Customers",
                                    keyDocSender:
                                        (contrNumCliDeb.text.isNotEmpty)
                                            ? contrNumCliDeb.text
                                            : userConnectedId,
                                    keyDocReceiv: (drpValueBank == "NAWARI")
                                        ? contrNumCliCred.text
                                        : userConnectedId,
                                  ).then((value) {
                                    if (value[0] != -1 && value[1] != -1) {
                                      print("value 1 :${value[0]}");
                                      print("value 1 :${value[1]}");

                                      //Instructions transfert solde débiteur
                                      if (double.parse(contrMontant.text) >
                                          ((value[0]["solde"]) ?? 0)) {
                                        print(
                                            "value == :${((value[0]["solde"]) ?? 0)}");

                                        Flushbar(
                                          backgroundColor:
                                              Color.fromARGB(255, 255, 217, 0),
                                          title: "Solde insuffisant!",
                                          margin: EdgeInsets.only(top: 50),
                                          message:
                                              "Veuillez vérifier le solde de votre compte \n Votre solde est de : ${((value[0]["solde"]) ?? 0)} XOF",
                                          duration: Duration(seconds: 5),
                                          flushbarPosition:
                                              FlushbarPosition.TOP,
                                        ).show(Get.context!);
                                        confirmController.stopLoading();
                                      } else {
                                        showModalBottomSheet<dynamic>(
                                          context: context,
                                          enableDrag: false,
                                          isDismissible: false,
                                          isScrollControlled: true,
                                          constraints: BoxConstraints.loose(
                                            Size(
                                              screenWidth,
                                              screenHeight,
                                            ),
                                          ),
                                          builder: (context) =>
                                              ConfirmPinToSendMoneyDialPad(
                                            onSuccess: () {
                                              confirmController.stopLoading();
                                              print(
                                                  "++++++++++++++++++++++++++++++++++++++ SUCCES C'EST PASSÉ");
                                              // //Instructions pour le transfert possible
                                              var receivName = (drpValueBank ==
                                                      "NAWARI")
                                                  ? "${value[1]["nom"] ?? ""} ${value[1]["prenoms"] ?? ""}"
                                                  : contrNomClientCred.text;
                                              myAlertDialog(
                                                      //  "Vous allez effectué un ${dropdownValueTrans.toLowerCase()} de ${contrMontant.text} XOF \nde ${value[0]["nom"]} ${value[0]["prenoms"] ?? ""},\nvers le client $receivName de la banque $drpValueBank \nVoulez-vous confirmer ?",
                                                      "Vous allez effectué un ${dropdownValueTrans.toLowerCase()} de ${contrMontant.text} XOF au client $receivName",
                                                      context)
                                                  .then(
                                                (vx) {
                                                  if (vx == "CONFIRMER") {
                                                    print("reponse:$vx");
                                                    print(
                                                        "Solde du débiteur: ${value[0]["solde"]}");
                                                    confirmController
                                                        .startLoading();
                                                    if (selectDateEFF.isBefore(
                                                        DateTime.now())) {
                                                      final TransactionPrototype trans = TransactionPrototype(
                                                          ref: "",
                                                          numCliCred:
                                                              contrNumCliCred
                                                                  .text,
                                                          nomClientCred:
                                                              (contrNomClientCred
                                                                      .text
                                                                      .isEmpty)
                                                                  ? contrNumCliCred
                                                                      .text
                                                                  : contrNomClientCred
                                                                      .text,
                                                          numCliDeb: (contrNumCliDeb
                                                                  .text.isEmpty)
                                                              ? userConnectedId
                                                              : contrNumCliDeb
                                                                  .text,
                                                          banque: drpValueBank,
                                                          dateTransac:
                                                              DateTime.now(),
                                                          dateEffect:
                                                              selectDate,
                                                          gestionnaire:
                                                              "GEST001",
                                                          montant: double.parse(
                                                              contrMontant
                                                                  .text),
                                                          typeOperat:
                                                              dropdownValueTrans,
                                                          guichet:
                                                              "Guichet-00");

                                                      creatTrans(
                                                              transactionPrototype:
                                                                  trans)
                                                          .then((nextIdd) {
                                                        transfert(
                                                            value: value,
                                                            idTransac: nextIdd);
                                                        contrNumCliCred.clear();
                                                        contrNomClientCred
                                                            .clear();
                                                        contrNumCliDeb.clear();
                                                        contrBanque.clear();
                                                        contrMontant.clear();

                                                        Get.offNamed(Routes
                                                            .PAIEMENTSUCCESS);
                                                      });
                                                      confirmController
                                                          .stopLoading();
                                                    } else {
                                                      //Transfert ajournée
                                                      final TransactionPrototype trans = TransactionPrototype(
                                                          ref: "",
                                                          numCliCred:
                                                              contrNumCliCred
                                                                  .text,
                                                          nomClientCred:
                                                              (contrNomClientCred
                                                                      .text
                                                                      .isEmpty)
                                                                  ? contrNumCliCred
                                                                      .text
                                                                  : contrNomClientCred
                                                                      .text,
                                                          numCliDeb: (contrNumCliDeb
                                                                  .text.isEmpty)
                                                              ? userConnectedId
                                                              : contrNumCliDeb
                                                                  .text,
                                                          banque: drpValueBank,
                                                          dateTransac:
                                                              DateTime.now(),
                                                          dateEffect:
                                                              selectDate,
                                                          gestionnaire:
                                                              "GEST001",
                                                          montant: double.parse(
                                                              contrMontant
                                                                  .text),
                                                          typeOperat:
                                                              dropdownValueTrans,
                                                          guichet: "Guichet-00",
                                                          approved: false);

                                                      creatTrans(
                                                              transactionPrototype:
                                                                  trans)
                                                          .then((nextIdd) {
                                                        creatTransComing(
                                                            transactionPrototype:
                                                                trans);
                                                        contrNumCliCred.clear();
                                                        contrNomClientCred
                                                            .clear();
                                                        contrNumCliDeb.clear();
                                                        contrBanque.clear();
                                                        contrMontant.clear();

                                                        Flushbar(
                                                          backgroundColor:
                                                              Colors.green,
                                                          title:
                                                              "Transaction ajournée !",
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 50),
                                                          message:
                                                              "La tractions à été programmé avec succès pous le ${DateFormat.yMd('en_US').format(selectDateEFF)} ",
                                                          duration: Duration(
                                                              seconds: 1),
                                                          flushbarPosition:
                                                              FlushbarPosition
                                                                  .TOP,
                                                        ).show(Get.context!);
                                                      });

                                                      confirmController
                                                          .stopLoading();
                                                    }
                                                  }
                                                },
                                              );
                                            },
                                          ),
                                        );
                                      }
                                    } else if (value[0] == -1 ||
                                        value[1] == -1) {
                                      if (value[0] == -1) {
                                        Flushbar(
                                          backgroundColor: Colors.red,
                                          title: "N°Client débité incorrecte!",
                                          margin: EdgeInsets.only(top: 50),
                                          message:
                                              "le numero client débité: ${contrNumCliDeb.text} n'est pas un numéro client valide  ",
                                          duration: Duration(seconds: 1),
                                          flushbarPosition:
                                              FlushbarPosition.TOP,
                                        ).show(Get.context!);
                                        confirmController.stopLoading();
                                      } else {
                                        Flushbar(
                                          backgroundColor: Colors.red,
                                          title: "N°Compte Crédité incorrect!",
                                          margin: EdgeInsets.only(top: 50),
                                          message:
                                              "Vérifier que le numéro client à credité: ${contrNumCliCred.text} est bien un client NAWARI ",
                                          duration: Duration(seconds: 1),
                                          flushbarPosition:
                                              FlushbarPosition.TOP,
                                        ).show(Get.context!);
                                        confirmController.stopLoading();
                                      }
                                    }
                                  });
                                }
                              }))
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  //The following question allow us to creat an transaction
  Future creatTrans(
      {required TransactionPrototype transactionPrototype}) async {
    // String customerId = 'votre_id_client';
    await customerController.getCustomerName(transactionPrototype.numCliCred);

    final docTransacLengthReff =
        FirebaseFirestore.instance.collection("Transactions");
    print("Instanciation creatTrans succèes");
    QuerySnapshot snapshotss = await docTransacLengthReff.get();
    print("Obtentionxxx");
    int docTransacLength = snapshotss.size;
    docTransacLength += 1;
    setState(() {
      nextId = "TR5646357${(docTransacLength).toString().padLeft(3, '0')}";
    });

    final docTransac = FirebaseFirestore.instance
        .collection("Transactions")
        .doc(nextId); //"NAW001"+"v"
    final json = {
      "ref": docTransac.id, // later
      "numCliDeb": transactionPrototype.numCliDeb,
      "numCliCred": transactionPrototype.numCliCred,
      "nomCliCred": customerController.customerName.value,
      "banque": transactionPrototype.banque,
      "dateTransac": transactionPrototype.dateTransac,
      "dateEffect": transactionPrototype.dateEffect,
      "gestionnaire": transactionPrototype.gestionnaire,
      "montant": transactionPrototype.montant,
      "typeOperat": transactionPrototype.typeOperat,
      "guichet": transactionPrototype.guichet,
      "approved": transactionPrototype.approved,
      "fraud": transactionPrototype.fraud,
    };
    print(nextId);
    await docTransac.set(json);
    return nextId;
  }

  //The following question allow us to creat an coming transaction
  Future creatTransComing(
      {required TransactionPrototype transactionPrototype}) async {
    //The difference between these two collections is the approuved mention.
    final docTransacLengthReff =
        FirebaseFirestore.instance.collection("Transactions_coming");
    print("Instanciation creatTransComing succèes");
    QuerySnapshot snapshotss = await docTransacLengthReff.get();
    print("Obtentionxxx");
    int docTransacLength = snapshotss.size;
    setState(() {
      nextId = "TC5646357${(docTransacLength++).toString().padLeft(3, '0')}";
    });

    final docTransac = FirebaseFirestore.instance
        .collection("Transactions_coming")
        .doc(nextId); //"NAW001"+"v"
    final json = {
      "ref": docTransac.id, // later
      "numCliDeb": transactionPrototype.numCliDeb,
      "numCliCred": transactionPrototype.numCliCred,
      "nomCliCred": transactionPrototype.nomClientCred,
      "banque": transactionPrototype.banque,
      "dateTransac": transactionPrototype.dateTransac,
      "dateEffect": transactionPrototype.dateEffect,
      "gestionnaire": transactionPrototype.gestionnaire,
      "montant": transactionPrototype.montant,
      "typeOperat": transactionPrototype.typeOperat,
      "guichet": transactionPrototype.guichet,
      "approved": transactionPrototype.approved,
      "fraud": transactionPrototype.fraud,
    };
    print(nextId);
    await docTransac.set(json);
    return nextId;
  }

//This is the Enum for the gender
  String getSexe(Genre genre) => (genre == Genre.homme) ? "HOMME" : "FEMME";
  selectedOp() {
    setState(() {
      // active = (drpValueTrans == "Virement") ? true : false;
      active = !active;
    });
  }

  //This function call the dataBase and return a respnses with for two cases : error case or succes case
  Future<List<dynamic>> getValueTrans(
      {required String idTrans,
      required String keyDocSender,
      required String keyDocReceiv}) async {
    dynamic dataReceiv;
    dynamic dataSender;
    try {
      //Sender's instance
      final docTransacSend =
          FirebaseFirestore.instance.collection(idTrans).doc(keyDocSender);
      var collectionSender = await docTransacSend.get();
      //Receiver's instance
      final docTransacReceiv =
          FirebaseFirestore.instance.collection(idTrans).doc(keyDocReceiv);
      var collectionReceiv = await docTransacReceiv.get();

      if (collectionSender.exists) {
        dataSender = collectionSender.data()!;
        // var balanceSender = dataSender[wishValue] ?? 0;
      } else {
        dataSender = -1;
      }
      if (collectionReceiv.exists) {
        dataReceiv = collectionReceiv.data()!;
      } else {
        dataReceiv = -1;
      }
      return [dataSender, dataReceiv];
    } catch (e) {
      //Response when any call is empty
      return [-2];
    }
  }

  SnackBar mySnackBar(String title, String message, ContentType contentType) {
    return SnackBar(
      /// need to set following properties for best effect of awesome_snackbar_content
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: title,
        message: message,

        /// change contentType to ContentType.success, ContentType.warning or ContentType.help for variants
        contentType: contentType,
      ),
    );
  }

  //DropButton for the kinds of transaction |Virement|Versement
  Widget dropButtonTrans() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: DropdownButton<String>(
        value: dropdownValueTrans,
        underline: null,
        style: const TextStyle(color: Colors.blue),
        onChanged: (String? value) {
          // This is called when the user selects an item.
          setState(() {
            dropdownValueTrans = value!;
            active = value == "Virement";
            drpValueBank = listBank.first;
            print("drpValueBank form menu:$drpValueBank");
          });
        },
        items: list.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Container(
              constraints: const BoxConstraints(maxWidth: 190),
              child: ListTile(
                title: Text(value),
                leading: listIcon[value],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }

  // Alerte dialogue for confirming the transaction
  Future myAlertDialog(String content, BuildContext context) {
    return
        // showDialog<String>(
        //   context: context,
        //   builder: (BuildContext context) => AlertDialog(
        //     title: const Text('CONFIRMATION'),
        //     content: Text(
        //       content,
        //       maxLines: 4,
        //     ),
        //     actions: <Widget>[
        //       TextButton(
        //         onPressed: () => Navigator.of(context).pop("ANNULER"),
        //         child: const Text('ANNULER'),
        //       ),
        //       TextButton(
        //         onPressed: () => Navigator.of(context).pop("CONFIRMER"),
        //         child: const Text('CONFIRMER'),
        //       ),
        //     ],
        //   ),
        // );

        showDialog(
      context: context,
      builder: (context) => AlertMessage(
        title: 'CONFIRMATION',
        message: content,
        onTap: () {
          Navigator.of(context).pop("CONFIRMER");
        },
        alertImage: "assets/icons/info-circle.png",
      ),
    );
  }

  //For transaction impact
  transfert({required var value, required String idTransac}) async {
    final docTransacSend = FirebaseFirestore.instance
        .collection("Customers")
        .doc((contrNumCliDeb.text.isNotEmpty)
            ? contrNumCliDeb.text
            : userConnectedId);
    final docTransacReceiv = FirebaseFirestore.instance
        .collection("Customers")
        .doc((drpValueBank == "NAWARI")
            ? contrNumCliCred.text
            : userConnectedId);

    var transacSender = value[0]["transactions"] ?? [""];
    transacSender.add(idTransac);
    var transacReceiv = value[1]["transactions"] ?? [""];
    transacReceiv.add(idTransac);

    docTransacSend.update({
      "solde": value[0]["solde"] - double.parse(contrMontant.text),
      "transactions": transacSender
    });
    docTransacReceiv.update({
      "solde": value[1]["solde"] + double.parse(contrMontant.text),
      "transactions": transacReceiv
    });
    print(4);
  }

  Widget buildHeader() {
    return SizedBox(
      height: 60,
      width: Get.width,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(UniconsLine.arrow_left)),
        Text(
          "Effectuer votre transfert",
          style: TextCss.dyncoloredBoldStyle(Colors.black, Cst.k2xl),
        ),
        SizedBox(
          width: 40,
        )
      ]),
    );
  }
}
