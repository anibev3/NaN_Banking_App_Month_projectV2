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
import 'package:nan_banking_app_mai_project/src/utils/themes/Constant.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/session/components/constants.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/session/components/dropButtonBnk.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/session/components/radioHF.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/session/models/user_model.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/transfert/models/transaction_Prototype.dart';
import 'package:nan_banking_app_mai_project/src/views/widgets/back_button_widget.dart';

class TransactionForm extends StatefulWidget {
  const TransactionForm({super.key});

  @override
  State<TransactionForm> createState() => _TransactionForm();
}

class _TransactionForm extends State<TransactionForm> {
  GetStorage box = GetStorage();
  bool showSpinner = false;

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

  void startLoading() {
    setState(() {
      showSpinner = true;
    });
  }

  void stopLoading() {
    setState(() {
      showSpinner = false;
    });
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
      print('Utilisateur : ${userConnectedId}');
    } else {
      print('Aucun utilisateur connecté');
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      margin: const EdgeInsets.only(top: 10),
      // decoration: BoxDecoration(
      //     color: Color.fromARGB(255, 241, 239, 239),
      //     // color: Colors.black12,
      //     borderRadius: BorderRadius.circular(15)),
      child: Stack(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Text("Transfert d'argent",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.dmSans(
                            color: Cst.kPrimary2Color,
                            fontSize: 25,
                            fontWeight: FontWeight.w500)
                        // TextStyle(
                        //   fontWeight: FontWeight.bold,
                        //   color: Cst.kPrimary2Color,
                        //   fontSize: 25,
                        // ),
                        ),
                  ),
                  // dropButtonTrans(),
                  SizedBox(
                    height: 30,
                  ),

                  Form(
                    key: _formKey,
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 20, top: 25),
                      decoration: BoxDecoration(
                        color: Cst.kprimary4Color,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Column(
                        children: [
                          TextFormField(
                            cursorColor: Colors.grey,

                            controller: contrMontant,
                            // The validator receives the text that the user has entered.
                            textCapitalization: TextCapitalization.characters,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25.0),
                                  borderSide: BorderSide(
                                    color: Colors.grey,
                                    width: 1.0,
                                  ),
                                ),
                                fillColor: Colors.grey,
                                focusColor: Colors.grey,
                                label: Text("Montant de la transaction"),
                                labelStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                                hintText: "xxx (XOF)",
                                hintStyle: TextStyle(
                                  color: Colors.grey,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 13, vertical: 5),
                                border: OutlineInputBorder()),

                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'Champ obligatoire !';
                              } else if (double.tryParse(value) == null) {
                                return 'entrer des valeurs numeriques!';
                              }
                              return null;
                            },
                          ),
                          // const Text("Informations des requerants"),
                          SizedBox(
                            height: 10,
                          ),
                          if (!active)
                            Column(
                              children: [
                                TextFormField(
                                  cursorColor: Colors.grey,

                                  // The validator receives the text that the user has entered.
                                  controller: contrNumCliCred,
                                  textCapitalization:
                                      TextCapitalization.characters,

                                  decoration: InputDecoration(
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                        ),
                                      ),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius:
                                            BorderRadius.circular(25.0),
                                        borderSide: BorderSide(
                                          color: Colors.grey,
                                          width: 1.0,
                                        ),
                                      ),
                                      fillColor: Colors.grey,
                                      focusColor: Colors.grey,
                                      label: Text("N°Compte du l'Bénéficiaire"),
                                      labelStyle: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15,
                                      ),
                                      hintText: "NAWARXXXX",
                                      hintStyle: TextStyle(
                                        color: Colors.grey,
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 13, vertical: 5),
                                      border: OutlineInputBorder()),

                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Champ obligatoire !';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                DateTimeFormField(
                                  dateFormat: DateFormat.yMd('en_US'),
                                  mode: DateTimeFieldPickerMode.date,
                                  decoration: const InputDecoration(
                                    hintStyle: TextStyle(color: Colors.black45),
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
                                SizedBox(
                                  height: 30,
                                ),
                              ],
                            ),
                          // if (active)
                          //   // This part is about |Virement Form|
                          //   Column(
                          //     children: [
                          //       TextFormField(
                          //         controller: contrNumCliDeb,
                          //         // The validator receives the text that the user has entered.
                          //         textCapitalization: TextCapitalization.characters,
                          //         decoration: const InputDecoration(
                          //             label: Text("N°Compte de l'émeteur"),
                          //             hintText: "NAWARIxx",
                          //             contentPadding: EdgeInsets.symmetric(
                          //                 horizontal: 8, vertical: 5),
                          //             border: OutlineInputBorder()),
                          //         validator: (value) {
                          //           if (value == null || value.isEmpty) {
                          //             return 'Champ obligatoire !';
                          //           }
                          //           return null;
                          //         },
                          //       ),
                          //       const Text("Infomation du bénéficiare"),
                          //       TextFormField(
                          //         // The validator receives the text that the user has entered.
                          //         controller: contrNumCliCred,
                          //         textCapitalization: TextCapitalization.characters,
                          //         decoration: const InputDecoration(
                          //             label: Text(
                          //               "N°Compte du bénéficiaire",
                          //             ),
                          //             hintText: "NAWARXXXX",
                          //             contentPadding: EdgeInsets.symmetric(
                          //                 horizontal: 8, vertical: 5),
                          //             border: OutlineInputBorder()),
                          //         validator: (value) {
                          //           if (value == null || value.isEmpty) {
                          //             return 'Champ obligatoire !';
                          //           }
                          //           return null;
                          //         },
                          //       ),
                          //       const DropdownButtonTypBnk(),
                          //       TextFormField(
                          //         controller: contrNomClientCred,
                          //         // The validator receives the text that the user has entered.

                          //         decoration: const InputDecoration(
                          //             label: Text("Nom et prénoms"),
                          //             hintText: "KOUXXX JEAXX FELXXX",
                          //             contentPadding: EdgeInsets.symmetric(
                          //                 horizontal: 8, vertical: 5),
                          //             border: OutlineInputBorder()),
                          //         validator: (value) {
                          //           if (value == null || value.isEmpty) {
                          //             return 'Champ obligatoire !';
                          //           }
                          //           return null;
                          //         },
                          //       ),
                          //       DateTimeFormField(
                          //         dateFormat: DateFormat.yMd('en_FR'),
                          //         mode: DateTimeFieldPickerMode.date,
                          //         decoration: const InputDecoration(
                          //           hintStyle: TextStyle(color: Colors.black45),
                          //           errorStyle: TextStyle(color: Colors.redAccent),
                          //           border: OutlineInputBorder(),
                          //           suffixIcon: Icon(Icons.event_note),
                          //           labelText: 'Date effective',
                          //         ),
                          //         firstDate: DateTime.now(),
                          //         // .add(const Duration(days: 10)),
                          //         initialDate: DateTime.now(),
                          //         autovalidateMode: AutovalidateMode.always,
                          //         validator: (DateTime? e) => (e?.day ?? 1) == 1
                          //             ? 'Please not the first day'
                          //             : null,
                          //         onDateSelected: (value) {
                          //           print(value.runtimeType);
                          //           selectDateEFF = value;
                          //         },
                          //       ),
                          //     ],
                          //   ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),

                  // InkWell(
                  //   onTap: () {

                  //   },
                  //   child: Container(
                  //     width: 250,
                  //     height: 55,
                  //     decoration: BoxDecoration(
                  //         color: Cst.kPrimary2Color,
                  //         borderRadius: BorderRadius.circular(30)),
                  //     child: Center(
                  //       child: Text(
                  //         "Lancer la transaction",
                  //         textAlign: TextAlign.center,
                  //         style: TextStyle(
                  //           // fontWeight: FontWeight.bold,
                  //           color: Colors.grey,
                  //           fontSize: 20,
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Column(children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Ou",
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black38,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 154,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 241, 239, 239),
                          borderRadius: BorderRadius.circular(15)),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(
                              top: 15,
                              left: 10,
                            ),
                            child: Text(
                              "Choisissez le destinataire",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 119,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemCount: 10,
                                itemBuilder: (BuildContext context, int index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 70,
                                          height: 70,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.white,

                                            //   image: DecorationImage(
                                            //     image: AssetImage(
                                            //       "assets/img/" + images.keys.elementAt(index),
                                            //     ),
                                            //     fit: BoxFit.cover,
                                            //   ),
                                          ),
                                          child: Center(
                                              child: Text(index.toString())),
                                        ),
                                        // Padding(
                                        //   padding: EdgeInsets.all(6.0),
                                        //   child: Text(
                                        //     images.values.elementAt(index),
                                        //     style: TextStyle(
                                        //       fontSize: 12.5,
                                        //     ),
                                        //   ),
                                        // )
                                      ],
                                    ),
                                  );
                                }),
                          )
                        ],
                      ),
                    ),
                  ]),

                  SizedBox(
                    height: 30,
                  ),
                  BlackbuttonWidget(
                      isloading: showSpinner,
                      text: "Lancer la transaction",
                      onTap: () {
                        print('<_______ $userConnectedId ________>');

                        if (_formKey.currentState!.validate()) {
                          // this is the firebase instance calling | To have the differents response for the following cases..
                          startLoading();

                          getValueTrans(
                            idTrans: "Customers",
                            keyDocSender: (contrNumCliDeb.text.isNotEmpty)
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
                                //Snackbar pour le solde insuffisant
                                ScaffoldMessenger.of(context)
                                  ..hideCurrentSnackBar()
                                  ..showSnackBar(mySnackBar(
                                      "Solde insuffisant!",
                                      "Veuillez vérifier le solde de votre compte ",
                                      ContentType.failure));
                                stopLoading();
                              } else {
                                stopLoading();
                                //Instructions pour le transfert possible
                                var receivName = (drpValueBank == "NAWARI")
                                    ? "${value[1]["nom"] ?? ""} ${value[1]["prenoms"] ?? ""}"
                                    : contrNomClientCred.text;
                                myAlertDialog(
                                        //  "Vous allez effectué un ${dropdownValueTrans.toLowerCase()} de ${contrMontant.text} XOF \nde ${value[0]["nom"]} ${value[0]["prenoms"] ?? ""},\nvers le client $receivName de la banque $drpValueBank \nVoulez-vous confirmer ?",
                                        "Vous allez effectué un ${dropdownValueTrans.toLowerCase()} de ${contrMontant.text} XOF au client $receivName",
                                        context)
                                    .then((vx) {
                                  if (vx == "CONFIRMER") {
                                    print("reponse:$vx");
                                    print(
                                        "Solde du débiteur: ${value[0]["solde"]}");
                                    startLoading();
                                    if (selectDateEFF
                                        .isBefore(DateTime.now())) {
                                      final TransactionPrototype trans =
                                          TransactionPrototype(
                                              ref: "",
                                              numCliCred: contrNumCliCred.text,
                                              nomClientCred: (contrNomClientCred
                                                      .text.isEmpty)
                                                  ? contrNumCliCred.text
                                                  : contrNomClientCred.text,
                                              numCliDeb:
                                                  (contrNumCliDeb.text.isEmpty)
                                                      ? userConnectedId
                                                      : contrNumCliDeb.text,
                                              banque: drpValueBank,
                                              dateTransac: DateTime.now(),
                                              dateEffect: selectDate,
                                              gestionnaire: "GEST001",
                                              montant: double.parse(
                                                  contrMontant.text),
                                              typeOperat: dropdownValueTrans,
                                              guichet: "Guichet-00");

                                      creatTrans(transactionPrototype: trans)
                                          .then((nextIdd) {
                                        transfert(
                                            value: value, idTransac: nextIdd);
                                        contrNumCliCred.clear();
                                        contrNomClientCred.clear();
                                        contrNumCliDeb.clear();
                                        contrBanque.clear();
                                        contrMontant.clear();
                                        // final docTransac = FirebaseFirestore.instance
                                        //     .collection("Transactions")
                                        //     .doc(nextId);
                                        // ScaffoldMessenger.of(context)
                                        //   ..hideCurrentSnackBar()
                                        //   ..showSnackBar(mySnackBar(
                                        //       "Succès",
                                        //       "Votre transaction a été effectué avec succès",
                                        //       ContentType.success));
                                        Get.toNamed(Routes.PAIEMENTSUCCESS);
                                      });
                                      stopLoading();
                                    } else {
                                      //Transfert ajournée
                                      final TransactionPrototype trans =
                                          TransactionPrototype(
                                              ref: "",
                                              numCliCred: contrNumCliCred.text,
                                              nomClientCred: (contrNomClientCred
                                                      .text.isEmpty)
                                                  ? contrNumCliCred.text
                                                  : contrNomClientCred.text,
                                              numCliDeb:
                                                  (contrNumCliDeb.text.isEmpty)
                                                      ? userConnectedId
                                                      : contrNumCliDeb.text,
                                              banque: drpValueBank,
                                              dateTransac: DateTime.now(),
                                              dateEffect: selectDate,
                                              gestionnaire: "GEST001",
                                              montant: double.parse(
                                                  contrMontant.text),
                                              typeOperat: dropdownValueTrans,
                                              guichet: "Guichet-00",
                                              approved: false);

                                      creatTrans(transactionPrototype: trans)
                                          .then((nextIdd) {
                                        creatTransComing(
                                            transactionPrototype: trans);
                                        contrNumCliCred.clear();
                                        contrNomClientCred.clear();
                                        contrNumCliDeb.clear();
                                        contrBanque.clear();
                                        contrMontant.clear();
                                        // final docTransac = FirebaseFirestore.instance
                                        //     .collection("Transactions")
                                        //     .doc(nextId);
                                        ScaffoldMessenger.of(context)
                                          ..hideCurrentSnackBar()
                                          ..showSnackBar(mySnackBar(
                                              "Transaction ajournée !",
                                              "La tractions à été programmé avec succès pous le ${DateFormat.yMd('en_US').format(selectDateEFF)} ",
                                              ContentType.help));
                                      });
                                      stopLoading();
                                    }
                                  }
                                });

                                //Instruction pour le numéro de compte
                              }
                            }
                            //Cas d'erreur des comptes.
                            else if (value[0] == -1 || value[1] == -1) {
                              if (value[0] == -1) {
                                ScaffoldMessenger.of(context)
                                  ..hideCurrentSnackBar()
                                  ..showSnackBar(mySnackBar(
                                      "N°Client débité incorrecte!",
                                      "le numero client débité: ${contrNumCliDeb.text} n'est pas un numéro client valide ",
                                      ContentType.warning));
                                stopLoading();
                              } else {
                                ScaffoldMessenger.of(context)
                                  ..hideCurrentSnackBar()
                                  ..showSnackBar(mySnackBar(
                                      "N°Compte Crédité incorrect!",
                                      "Vérifier que le numéro client à credité: ${contrNumCliCred.text} est bien un client NAWARI ",
                                      ContentType.warning));
                                stopLoading();
                              }
                            }
                          });
                        }
                      }),
                ],
              ),
            ),
          ],
        ),
        if (showSpinner)
          const Center(
            child: SpinKitFadingCircle(
              color: Colors.blue,
              size: 50,
            ),
          ),
      ]),
    );
  }

  //The following question allow us to creat an transaction
  Future creatTrans(
      {required TransactionPrototype transactionPrototype}) async {
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
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('CONFIRMATION'),
        content: Text(
          content,
          maxLines: 4,
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop("ANNULER"),
            child: const Text('ANNULER'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop("CONFIRMER"),
            child: const Text('CONFIRMER'),
          ),
        ],
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
}
