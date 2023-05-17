import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nan_banking_app_mai_project/src/routes/app_pages.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/Constant.dart';

class Transfert extends StatelessWidget {
  Transfert({Key? key}) : super(key: key);

  var images = {
    "contact1.png": "Frederic",
    "contact2.png": "Aude",
    "contact3.png": "Noura",
    "contact4.png": "Vianney",
    "contact5png": "Soro",
    "contact6png": "Aubité",
    "contact7png": "Franck",
    "contact8png": "Nafo",
    "contact1png": "Akadjé",
    "contact2png": "Akadjé",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black38,
            )),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(
                  Icons.menu,
                  color: Colors.black38,
                )),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(17),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Transfert d'argent",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Cst.kPrimary2Color,
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(
                height: 45,
              ),
              // Local_Or_Inter(),
              Params_tf(),
              Contact_destinataire(
                images: images,
              ),
              buttonTransfert()
            ],
          ),
        ),
      ),
    );
  }
}

class buttonTransfert extends StatelessWidget {
  const buttonTransfert({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Text(
              "Les frais de transaction seront prélevé automatiquement",
              textAlign: TextAlign.center,
              style: TextStyle(
                  // fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 40),
          child: Row(
            // mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  Get.toNamed(Routes.PAIEMENTFAILED);
                },
                child: const Text(
                  "Annulé",
                  style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 19,
                  ),
                ),
              ),
              // ElevatedButton(
              //   onPressed: () {
              //     Get.toNamed(Routes.PAIEMENTSUCCESS);
              //   },
              //   style: ElevatedButton.styleFrom(
              //     backgroundColor: Cst.kPrimary2Color,
              //     elevation: 0,
              //   ),
              //   child: const Text(
              //     "Transférer",
              //     style: TextStyle(
              //       // fontWeight: FontWeight.bold,
              //       fontSize: 19,
              //     ),
              //   ),
              // ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(Routes.PAIEMENTSUCCESS);
                },
                child: Container(
                  width: 200,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Cst.kPrimary2Color,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                    child: Text(
                      "Transférer",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        // fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class Contact_destinataire extends StatelessWidget {
  const Contact_destinataire({super.key, required this.images});

  final Map<String, String> images;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
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
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,

                              //   image: DecorationImage(
                              //     image: AssetImage(
                              //       "assets/img/" + images.keys.elementAt(index),
                              //     ),
                              //     fit: BoxFit.cover,
                              //   ),
                            ),
                            child: Center(child: Text(index.toString())),
                          ),
                          Padding(
                            padding: EdgeInsets.all(6.0),
                            child: Text(
                              images.values.elementAt(index),
                              style: TextStyle(
                                fontSize: 12.5,
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    ]);
  }
}

class Params_tf extends StatelessWidget {
  const Params_tf({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Container(
          width: MediaQuery.of(context).size.width,
          height: 215,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 241, 239, 239),
              // color: Colors.black12,
              borderRadius: BorderRadius.circular(15)),
          child: Column(
            children: const [
              // Text("Entrer le montant"),
              Padding(
                padding: EdgeInsets.only(top: 30, left: 40, right: 40),
                child: TextField(
                  obscureText: true,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'MONTANT',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25),
                child: Text(
                  "Saisissez le numero de compte destinataire",
                  style: TextStyle(
                    fontSize: 16,
                    // color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 0, left: 70, right: 70),
                child: TextField(
                  // obscureText: true,
                  // keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      // border: OutlineInputBorder(),
                      // labelText: 'MONTANT',
                      ),
                ),
              ),
            ],
          )),
    );
  }
}

class Local_Or_Inter extends StatelessWidget {
  const Local_Or_Inter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: 175,
          height: 64,
          decoration: BoxDecoration(
              color: Cst.kprimary4Color,
              borderRadius: BorderRadius.circular(15)),
          child: const Center(
            child: Text(
              "Local",
              style: TextStyle(
                fontSize: 19,
              ),
            ),
          ),
        ),
        Container(
          width: 175,
          height: 64,
          decoration: BoxDecoration(
              color: Cst.kPrimary2Color,
              borderRadius: BorderRadius.circular(15)),
          child: const Center(
            child: Text(
              "International",
              style: TextStyle(
                fontSize: 19,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
