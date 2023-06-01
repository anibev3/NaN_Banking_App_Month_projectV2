import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/Constant.dart';
import 'package:nan_banking_app_mai_project/src/utils/themes/icon_et_text.dart';

class DetailPharmacieView extends StatelessWidget {
  DetailPharmacieView({Key? key}) : super(key: key);

  List imgs = [
    "NSIA2.jpg",
    "NSIA2.jpg",
    "NSIA2.jpg",
    "NSIA2.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       InkWell(
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //         child: Icon(
      //           Icons.arrow_back_ios_new,
      //           color: Colors.white,
      //         ),
      //       ),
      //       InkWell(
      //         onTap: () {
      //           Navigator.pop(context);
      //         },
      //         child: Icon(
      //           Icons.more_vert,
      //           color: Colors.white,
      //         ),
      //       ),
      //     ],
      //   ),
      // ),

      backgroundColor: Color.fromARGB(255, 194, 188, 188),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Stack(children: [
              SizedBox(
                height: 50,
              ),
              // Container(
              //   width: 450,
              //   height: 220,
              //   margin: const EdgeInsets.only(left: 10, right: 10),
              //   decoration: BoxDecoration(
              //       borderRadius: BorderRadius.circular(30),
              //       image: const DecorationImage(
              //           image: AssetImage("assets/img/image_1.jpeg"),
              //           fit: BoxFit.cover)),
              // ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Stack(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back_ios_new,
                          color: Colors.white,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.more_vert,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child:
                        // Container(
                        //     width: 200,
                        //     child: Image.asset("assets/img/image_1.jpeg", )),
                        Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // CircleAvatar(
                        //   radius: 35,
                        //   backgroundImage: AssetImage("assets/img/doctor1.jpg"),
                        // ),
                        SizedBox(
                          height: 100,
                        ),
                        Text(
                          "Pharmacie des lagunes",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Dr Vianney Anibé",
                          style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w500,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: Icon(
                                Icons.call,
                                color: Colors.green,
                              ),
                            ),
                            SizedBox(
                              width: 25,
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white, shape: BoxShape.circle),
                              child: Icon(
                                CupertinoIcons.chat_bubble_text_fill,
                                color: Colors.green,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ]),
              ),
            ]),
            SizedBox(
              height: 10,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 1.5,
              width: double.infinity,
              padding: EdgeInsets.only(
                top: 20,
                left: 15,
              ),
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    "A propos",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Pharmacie des Lagunes est inscrite sur l' Annuaire Pages Jaunes Côte d'Ivoire . Pour plus d'informations, veuillez accéder à l'annuaire des professionnels.",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Row(
                    children: [
                      Text(
                        "Review",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.star,
                        color: Colors.amber,
                        size: 18,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Text(
                          "4.9",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            // color: Colors.black54
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "(127)",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          // color: Colors.black54
                        ),
                      ),
                      Spacer(),
                      TextButton(
                          onPressed: () {},
                          // icon: Icon(Icons.remove_red_eye_sharp),
                          child: Text("Voir tout"))
                    ],
                  ),
                  SizedBox(
                    height: 163,
                    child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.all(10),
                            padding: EdgeInsets.symmetric(vertical: 2),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 4,
                                      spreadRadius: 2)
                                ]),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 1.4,
                              child: Column(
                                children: [
                                  ListTile(
                                    leading: CircleAvatar(
                                      radius: 25,
                                      backgroundImage: AssetImage(
                                          "assets/img/${imgs[index]}"),
                                    ),
                                    title: Text(
                                      "Dr Vianney Anibe",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        // color: Colors.black54
                                      ),
                                    ),
                                    subtitle: Text("+225 0140990499"),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 17,
                                        ),
                                        Text(
                                          "4.9",
                                          style: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.bold,
                                            // color: Colors.black54
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 3,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    child: Text(
                                      "Pharmacie des Lagunes est inscrite sur l' Annuaire Pages Jaunes Côte d'Ivoire . Pour plus d'informations, veuillez a",
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 11,
                                        fontWeight: FontWeight.bold,
                                        // color: Colors.black54
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      IconEtText(
                                          icon: Icons.circle_sharp,
                                          text: "Parapharmacie",
                                          iconColor: Cst.kWarningColor),
                                      IconEtText(
                                          icon: Icons.location_on,
                                          text: "Marcory",
                                          iconColor: Cst.kSuccesColor),
                                      IconEtText(
                                          icon: Icons.access_time_rounded,
                                          text: "08h30",
                                          iconColor: Cst.kDangerColor),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Text(
                    "A propos",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  ListTile(
                    leading: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Color(0xFFF0EEFA), shape: BoxShape.circle),
                      child: Icon(
                        Icons.location_on,
                        color: Color(0xFF7165D6),
                        size: 30,
                      ),
                    ),
                    title: Text(
                      "Marcory, Residentiel",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle:
                        Text("Situé a Marcory non loin de la cité dragage",
                            style: TextStyle(
                              // fontWeight: FontWeight.bold,
                              fontSize: 12,
                            )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),

      bottomNavigationBar: Container(
        padding: EdgeInsets.all(15),
        height: 98,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 2)
          ],
        ),
        child: Column(
          children: [
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     Text("consultation price",
            //         style: TextStyle(
            //           fontWeight: FontWeight.bold,
            //           color: Colors.black54,
            //           fontSize: 13,
            //         )),
            //     Text("1000 Fcfa",
            //         style: TextStyle(
            //           fontWeight: FontWeight.bold,
            //           color: Colors.black54,
            //           fontSize: 13,
            //         )),
            //   ],
            // ),
            SizedBox(
              height: 9,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 18),
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text("Soumettre mon ordornance",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 14,
                      )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
