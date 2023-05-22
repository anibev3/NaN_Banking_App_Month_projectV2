import 'package:flutter/material.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/Constant.dart';
import 'package:nan_banking_app_mai_project/src/views/ui/session/controller/auth_repository.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(35),
          child: Column(
            children: [
              const SizedBox(
                height: 45,
              ),
              const Center(
                child: Text(
                  "Mon profile",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    // color: Cst.kPrimary2Color,
                    fontSize: 25,
                  ),
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              const ProfilHeader(),
              const SizedBox(
                height: 45,
              ),
              Container(
                padding: const EdgeInsets.only(top: 15, right: 20, left: 20),
                width: MediaQuery.of(context).size.width,
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Cst.kprimary4Color,
                  // image: DecorationImage(
                  //   image: AssetImage(
                  //     "assets/img/profil.jpeg",
                  //   ),
                  //   fit: BoxFit.cover,
                  // ),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 1),
                      child: GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Icon(Icons.account_balance_rounded),
                            ),
                            Text(
                              "Information personnelles",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                // color: Cst.kPrimary2Color,
                                fontSize: 19,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Divider(
                        height: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 1),
                      child: GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Icon(Icons.account_balance_rounded),
                            ),
                            Text(
                              "Modifier mon code",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                // color: Cst.kPrimary2Color,
                                fontSize: 19,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Divider(
                        height: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 1),
                      child: GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Icon(Icons.account_balance_rounded),
                            ),
                            Text(
                              "Documents",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                // color: Cst.kPrimary2Color,
                                fontSize: 19,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Divider(
                        height: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 1),
                      child: GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: const [
                            Padding(
                              padding: EdgeInsets.all(10),
                              child: Icon(Icons.account_balance_rounded),
                            ),
                            Text(
                              "Noter l'application",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                // color: Cst.kPrimary2Color,
                                fontSize: 19,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfilHeader extends StatelessWidget {
  const ProfilHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 130,
          height: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Cst.kprimary4Color,
            image: const DecorationImage(
              image: AssetImage(
                "assets/img/profil.jpeg",
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "Vianney Anibé",
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.bold,
              ),
            ),
            // Divider(),
            const Text(
              "Tel: +225 01 40990499",
              style: TextStyle(
                color: Colors.grey,

                fontSize: 13,
                // fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "Email: anibev3@gmail.com",
              style: TextStyle(
                fontSize: 13,
                color: Colors.grey,

                // fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "N°cpt: 35436dfb3",
              style: TextStyle(
                fontSize: 13,
                // fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                AuthRepository.instance.logout();
              },
              child: Container(
                width: 150,
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red,
                  // image: DecorationImage(
                  //   image: AssetImage(
                  //     "assets/img/profil.jpeg",
                  //   ),
                  //   fit: BoxFit.cover,
                  // ),
                ),
                child: const Center(
                  child: Text(
                    "Se déconnecter",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
