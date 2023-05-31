// import 'dart:html';

import 'package:flutter/material.dart';

import 'dart:developer';
import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:get/get.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

import '../../controller/authController.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../bestDeal/bestdealDetail.dart';
import '../bestDeal/bestdealPage.dart';
import '../designPackage/planForMe.dart';
import '../exoticLocation/exoticLocationDetail.dart';

class HomePage extends StatefulWidget {
  const HomePage() : super();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isPlan = false;

  Widget build(BuildContext context) {
    // log(authController.)
    // log("asdfaf" + authController.user.toString());
    log("Exotic place :" + authController.exoticplaceList.toString());
    log("index : " + authController.indexPageList.toString());
    log("Deals : " + authController.dealsList.toString());
    log("logo : " + authController.logoList.toString());
    // ignore: unused_local_variable
    double width = MediaQuery.of(context).size.width - 40;
    return Scaffold(
        drawer: DrawerBox(width),
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
          title: const Text(
            'TRAVEL APP',
            style: const TextStyle(color: Colors.black),
          ),
          actions: [
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {
                // authController.getExoticpalce();
                //authController.getIndexPage();
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => SearchScreen()),
                // );
              },
            ),
            GestureDetector(
              onTap: () {},
              child: IconButton(
                icon: const Icon(
                  Icons.settings,
                  color: Colors.black,
                ),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => SignupPage()),
                  // );
                  // Do something when the more_vert icon is pressed
                },
              ),
            ),
          ],
        ),
        backgroundColor: const Color.fromARGB(255, 255, 254, 254),
        body: Stack(children: [
          Container(
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              child: ListView(children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              width: width * .35,
                              child: Text(authController.indexPageList!["p2"]
                                  .toString()),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: width * .6,
                              child: Text(
                                authController.indexPageList!["p3"].toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(fontSize: 12),
                              ),
                            )
                          ],
                        ),
                        Image.network(
                            "https://cruxtech.in/admin/index_images/" +
                                authController.indexPageList!["pimg"],
                            height: 150,
                            width: 150),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    // Image.network(
                    //     "https://cruxtech.in/admin/index_images/" +
                    //         authController.indexPageList!["pimg"],
                    //     height: 150,
                    //     width: 150),
                    // Text(authController.exoticplaceList[0].toString()),
                    //Text(authController.exoticplaceList.length.toString()),
                    // Text(authController.indexPageList!.length.toString()),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            // setState(() {
                            //   isPlan = !isPlan;
                            // });
                            Get.to(PlanForMe());
                            // _openPopup(context);
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => PlanForMe()),
                            // );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.orange),
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                authController.indexPageList!["p4"].toString(),
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                        //  Text("Get Price")
                      ],
                    ),
                    // const SizedBox(
                    //   height: 30,
                    // ),
                    // isPlan == true ?Column(children: [

                    // ],):SizedBox(),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                        width: width * .7,
                        child: Text(
                          authController.indexPageList!['p5'].toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.teal),
                        )),

                    // RichText(
                    //   textAlign: TextAlign.center,
                    //   text: new TextSpan(
                    //     text: 'We ',
                    //     style: TextStyle(color: Colors.black),
                    //     children: <TextSpan>[
                    //       new TextSpan(
                    //           text: 'always ',
                    //           style: new TextStyle(
                    //               fontWeight: FontWeight.bold,
                    //               color: Colors.orange)),
                    //       new TextSpan(
                    //           text: 'focus on best ',
                    //           style: new TextStyle(
                    //               // fontWeight: FontWeight.bold,
                    //               color: Colors.black)),
                    //       new TextSpan(
                    //           text: 'Benefits ',
                    //           style: new TextStyle(
                    //               fontWeight: FontWeight.bold,
                    //               color: Colors.teal)),
                    //       new TextSpan(
                    //           text: 'as\n well as ',
                    //           style: new TextStyle(
                    //               //  fontWeight: FontWeight.bold,
                    //               color: Colors.black)),
                    //       new TextSpan(
                    //           text: 'Professional ',
                    //           style: new TextStyle(
                    //               fontWeight: FontWeight.bold,
                    //               color: Colors.teal)),
                    //       new TextSpan(
                    //           text: 'service',
                    //           style: new TextStyle(
                    //               fontWeight: FontWeight.bold,
                    //               color: Colors.orange)),
                    //     ],
                    //   ),
                    // ),
                    const SizedBox(
                      height: 30,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => const HotelRooms()),
                            // );
                          },
                          child: Column(
                            children: [
                              Image.network(
                                  "https://cruxtech.in/admin/index_images/" +
                                      authController.indexPageList!["icon5"],
                                  height: 100,
                                  width: 100),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                  authController.indexPageList!["iconh5"]
                                      .toString(),
                                  style: const TextStyle())
                            ],
                          ),
                        ),
                        Column(
                          children: [
                            Image.network(
                                "https://cruxtech.in/admin/index_images/" +
                                    authController.indexPageList!["icon4"],
                                height: 100,
                                width: 100),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                                authController.indexPageList!["iconh4"]
                                    .toString(),
                                style: const TextStyle())
                          ],
                        ),
                      ],
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(() => BestDeals());
                          },
                          child: Column(
                            children: [
                              Image.network(
                                  "https://cruxtech.in/admin/index_images/" +
                                      authController.indexPageList!["icon1"],
                                  height: 100,
                                  width: 100),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                  authController.indexPageList!["iconh1"]
                                      .toString(),
                                  style: const TextStyle())
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => const ExoticPlace()),
                            // );
                          },
                          child: Column(
                            children: [
                              Image.network(
                                  "https://cruxtech.in/admin/index_images/" +
                                      authController.indexPageList!["icon2"],
                                  height: 100,
                                  width: 100),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                  authController.indexPageList!["iconh2"]
                                      .toString(),
                                  style: const TextStyle())
                            ],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) =>
                            //           const DestinationWedding()),
                            // );
                          },
                          child: Column(
                            children: [
                              Image.network(
                                  "https://cruxtech.in/admin/index_images/" +
                                      authController.indexPageList!["icon3"],
                                  height: 100,
                                  width: 100),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                  authController.indexPageList!["iconh3"]
                                      .toString(),
                                  textAlign: TextAlign.center,
                                  style: const TextStyle())
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      authController.indexPageList!["iconp1"].toString(),
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: Colors.teal),
                    ),
                    const SizedBox(
                      height: 10,
                    ),

                    Row(
                      children: [
                        Image.asset("assets/img/forth.png",
                            height: 100, width: width * .23),
                        Column(
                          children: [
                            SizedBox(
                              width: width * .6,
                              child: Text(
                                authController.indexPageList!["iconp2"]
                                    .toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    fontSize: 24,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: width * .6,
                              child: Text(
                                authController.indexPageList!["iconp3"]
                                    .toString(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                    //fontSize: 28,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Image.asset("assets/img/third.png",
                            height: 100, width: width * .2)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset("assets/img/tree.png",
                            height: 100, width: 100),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            RichText(
                              textAlign: TextAlign.center,
                              text: new TextSpan(
                                text: 'Grab ',
                                style: const TextStyle(
                                    color: Colors.black, fontSize: 18),
                                children: <TextSpan>[
                                  new TextSpan(
                                      text: 'Best Deal',
                                      style: new TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.orange)),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                        Image.asset("assets/img/bus.png",
                            height: 100, width: 100)
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(children: [
                          for (var x in authController.dealsList)
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                width: width * .8,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 5,
                                        blurRadius: 5,
                                        offset: const Offset(
                                            0, 0), // changes position of shadow
                                      ),
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(18)),
                                child: Column(
                                  children: [
                                    // SizedBox(
                                    //   height: 20,
                                    // ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                            image: new DecorationImage(
                                                image: NetworkImage(
                                                  "https://cruxtech.in/admin/packageimage/" +
                                                      x["PackageImage"],
                                                ),
                                                fit: BoxFit.cover)),
                                        child: Image.network(
                                            "https://cruxtech.in/admin/packageimage/" +
                                                x["PackageImage"],
                                            height: 130,
                                            width: width * .7),
                                        //  Image.asset(
                                        //     "assets/img/beach.jpg",
                                        //     height: 130,
                                        //     width: width * .7)
                                      ),
                                    ),

                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Row(
                                          // mainAxisAlignment:
                                          //     MainAxisAlignment.spaceAround,
                                          children: [
                                            SizedBox(
                                              width: width * .52,
                                              child: Text(
                                                x["PackageType"],
                                                style: const TextStyle(
                                                    color: Colors.teal),
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    color: Colors.orange,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            18),
                                                    border: Border.all(
                                                        color: Colors.black,
                                                        width: 0.1)),
                                                child: Padding(
                                                  padding: EdgeInsets.all(4.0),
                                                  child: Text(
                                                      x["discpercent"] +
                                                          "% off",
                                                      style: const TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          color: Colors.white)),
                                                ),
                                              ),
                                            )
                                          ]),
                                    ),
                                    // SizedBox(
                                    //   height: 5,
                                    // ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Row(
                                        //mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                              width: width * .5,
                                              child: Text(
                                                x['PackageName'],
                                                style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 16),
                                              )),
                                          // Icon(
                                          //   Icons.star,
                                          //   color: Colors.teal,
                                          //   size: 12,
                                          // ),
                                          // Text("4.5"),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Row(
                                        //mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          // SizedBox(
                                          //   width: 0,
                                          // ),
                                          const Icon(
                                            Icons.location_on,
                                            color: Colors.grey,
                                            size: 14,
                                          ),
                                          SizedBox(
                                              //width: width * .28,
                                              child: Text(
                                            x['PackageLocation'],
                                            style:
                                                const TextStyle(fontSize: 10),
                                          )),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          RichText(
                                            text: new TextSpan(
                                              text: "Rs. " +
                                                  x['PackagePrice'] +
                                                  "/",
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                              children: <TextSpan>[
                                                new TextSpan(
                                                    text: x['discprice'],
                                                    style: new TextStyle(
                                                        decoration:
                                                            TextDecoration
                                                                .lineThrough,
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.normal)),
                                                new TextSpan(
                                                    text: ' person',
                                                    style: new TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.normal)),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: GestureDetector(
                                              onTap: () {
                                                Get.to(() => BestDealsDetail());
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    border: Border.all(
                                                        color: Colors.orange)),
                                                child: const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 5,
                                                      bottom: 5,
                                                      right: 10,
                                                      left: 10),
                                                  child: const Text(
                                                    "Book",
                                                    style:
                                                        TextStyle(fontSize: 12),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                        ])),

                    // SingleChildScrollView(
                    //   scrollDirection: Axis.horizontal,
                    //   padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    //   child: Row(
                    //     children: [
                    //       Trip(width, "beach.jpg", "City Adventure trip",
                    //           "Paris France"),
                    //       Trip(width, "exotic1.png", "HoneyMoon Trip",
                    //           "Thialand"),
                    //     ],
                    //   ),
                    // ),
                    const SizedBox(
                      height: 50,
                    ),
                    // const SizedBox(
                    //   height: 30,
                    // ),
                    GestureDetector(
                        onTap: () {
                          Get.to(() => BestDeals());
                        },
                        child: button("See All")),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => ExoticPlace()),
                            // );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, right: 30, left: 30),
                            child: Text(
                              authController.indexPageList!["iconh2"]
                                  .toString(),
                              style: const TextStyle(
                                  color: Colors.orange,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: width * .8,
                          child: Text(
                            authController.indexPageList!["iconp4"].toString(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (var x in authController.exoticplaceList)
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Container(
                                width: width * .45,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        spreadRadius: 5,
                                        blurRadius: 5,
                                        offset: const Offset(
                                            0, 0), // changes position of shadow
                                      ),
                                    ],
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(18)),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              "https://cruxtech.in/admin/packageimage/" +
                                                  x["PackageImage"],
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        child: Image.network(
                                            "https://cruxtech.in/admin/packageimage/" +
                                                x["PackageImage"],
                                            height: 130,
                                            width: width * .5),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                            width: width * .35,
                                            child: Text(
                                              x['PackageName'],
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold),
                                            )),
                                        // Icon(
                                        //   Icons.star,
                                        //   color: Colors.teal,
                                        //   size: 12,
                                        // ),
                                        // Text("4.5"),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      //mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        const SizedBox(
                                          width: 5,
                                        ),
                                        const Icon(
                                          Icons.location_on,
                                          color: Colors.grey,
                                          size: 14,
                                        ),
                                        SizedBox(
                                            width: width * .35,
                                            child: Text(
                                              x['PackageLocation'],
                                              style:
                                                  const TextStyle(fontSize: 10),
                                            )),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          RichText(
                                            text: new TextSpan(
                                              text: 'Rs ' +
                                                  x["PackagePrice"] +
                                                  '/',
                                              style: const TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold),
                                              children: <TextSpan>[
                                                new TextSpan(
                                                    text: 'person',
                                                    style: const TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.normal)),
                                              ],
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              Get.to(
                                                  () => ExoticLocationDetail());
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  border: Border.all(
                                                      color: Colors.teal)),
                                              child: const Padding(
                                                padding: EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 5,
                                                    right: 10,
                                                    left: 10),
                                                child: const Text(
                                                  "Book",
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                        onTap: () {
                          //Get.to( ()=>const ExoticPlace());
                        },
                        child: button("See All")),
                    /*Exotic ends*/
                    /*wedding destination*/
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => DestinationWedding()),
                            // );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, right: 30, left: 30),
                            child: Text(
                              authController.indexPageList!["iconh3"]
                                  .toString(),
                              style: const TextStyle(
                                  color: Colors.orange,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: width * .8,
                          child: Text(
                            authController.indexPageList!["iconp5"].toString(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                      child: Row(
                        children: [
                          // DestinationBox(width, "desti1.jpg", "Kerala"),
                          // DestinationBox(width, "desti2.jpeg", "Havelock"),
                          // DestinationBox(width, "desti3.jpeg", "Rishikesh"),
                          // DestinationBox(width, "desti4.jpeg", "Goa"),
                          // GestureDetector(
                          //     onTap: () {
                          //       Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //             builder: (context) =>
                          //                 DestinationWedding()),
                          //       );
                          //     },
                          //     child: View(width))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    button("See All"),
                    // Divider(
                    //   thickness: 1,
                    // ),
                    /*End wedding destination*/
                    /*Hotel rooms */
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => DestinationWedding()),
                            // );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, right: 30, left: 30),
                            child: Text(
                              authController.indexPageList!["iconh4"]
                                  .toString(),
                              style: const TextStyle(
                                  color: Colors.orange,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: width * .8,
                          child: Text(
                            authController.indexPageList!["p1"].toString(),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    const SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                      child: Row(
                        children: [
                          // DestinationBox(width, "desti1.jpg", "Kerala"),
                          // DestinationBox(width, "desti2.jpeg", "Havelock"),
                          // DestinationBox(width, "desti3.jpeg", "Rishikesh"),
                          // DestinationBox(width, "desti4.jpeg", "Goa"),
                          // GestureDetector(
                          //     onTap: () {
                          //       Navigator.push(
                          //         context,
                          //         MaterialPageRoute(
                          //             builder: (context) =>
                          //                 DestinationWedding()),
                          //       );
                          //     },
                          //     child: View(width))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    button("See All"),
                    // Divider(
                    //   thickness: 1,
                    // ),
                    /*End Hotel rooms */
                    /* Flights  */
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //       builder: (context) => DestinationWedding()),
                            // );
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 10, bottom: 10, right: 30, left: 30),
                            child: Text(
                              authController.indexPageList!["iconh5"]
                                  .toString(),
                              style: const TextStyle(
                                  color: Colors.orange,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: width * .8,
                          child: const Text(
                            "KT is one of the most popular Travel agency for who want to explore the wold with adventure",
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Image.asset("assets/img/plane.png"),
                    // Divider(
                    //   thickness: 1,
                    // ),
                    const SizedBox(
                      height: 20,
                    ),
                    button("See All"),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Image.asset("assets/img/fifth.png",
                            height: 150, width: 150),
                        const SizedBox(
                          width: 20,
                        ),
                        Column(children: [
                          Row(
                            children: [
                              const Text(
                                "Our Testimonials",
                                style: const TextStyle(color: Colors.teal),
                              ),
                              Image.asset(
                                "assets/img/badge.png",
                                height: 20,
                                width: 30,
                              )
                            ],
                          ),
                          const SizedBox(height: 10),
                          RichText(
                            textAlign: TextAlign.center,
                            text: new TextSpan(
                              text: 'Happy ',
                              style: const TextStyle(color: Colors.black),
                              children: <TextSpan>[
                                new TextSpan(
                                    text: 'Travelers\n',
                                    style: new TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.orange)),
                                new TextSpan(
                                    text: 'Expression',
                                    style: new TextStyle(
                                        // fontWeight: FontWeight.bold,
                                        color: Colors.teal)),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          const Text(
                            "Travor is one of the most popular\n Travel agency for those who\n want to explore the world\n and try to make adventure\n as well as we can\n provide",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 11),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                "John smith",
                                style:
                                    TextStyle(color: Colors.teal, fontSize: 13),
                              ),
                              const SizedBox(
                                width: 90,
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Text(
                                "[Ceo Founder]",
                                style: TextStyle(fontSize: 10),
                              ),
                              const SizedBox(
                                width: 90,
                              ),
                            ],
                          ),
                        ])
                      ],
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Container(
                    //       decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(20),
                    //           color: Colors.orange),
                    //       child: Padding(
                    //         padding: const EdgeInsets.only(
                    //             top: 10, bottom: 10, right: 30, left: 30),
                    //         child: Text(
                    //           "Flights",
                    //           style: TextStyle(color: Colors.white),
                    //         ),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: 30,
                    // ),
                    // Image.asset("assets/img/plane.png")
                  ],
                )
              ])),
        ]));
  }

  Widget button(String text) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.teal),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 10, bottom: 10, right: 30, left: 30),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget DealBox(double width, String img, String place) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: width * .41,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 5,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ], color: Colors.white, borderRadius: BorderRadius.circular(18)),
        child: Column(
          children: [
            // SizedBox(
            //   height: 20,
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage('assets/img/$img'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child:
                      Image.asset("assets/img/$img", height: 130, width: 130)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: width * .28,
                    child: Text(
                      place,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )),
                const Icon(
                  Icons.star,
                  color: Colors.teal,
                  size: 12,
                ),
                const Text("4.5"),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 5,
                ),
                const Icon(
                  Icons.location_on,
                  color: Colors.grey,
                  size: 14,
                ),
                const SizedBox(
                    //width: width * .28,
                    child: Text(
                  "Nuda Penida, Maldives",
                  style: const TextStyle(fontSize: 10),
                )),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: new TextSpan(
                      text: '\$110/',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        new TextSpan(
                            text: 'person',
                            style: new TextStyle(
                                fontSize: 10, fontWeight: FontWeight.normal)),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const BestDealsDetail()),
                      // );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.orange)),
                      child: const Padding(
                        padding: EdgeInsets.only(
                            top: 5, bottom: 5, right: 10, left: 10),
                        child: Text(
                          "Book",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget DestinationBox(double width, String img, String place) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: width * .41,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 5,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ], color: Colors.white, borderRadius: BorderRadius.circular(18)),
        child: Column(
          children: [
            // SizedBox(
            //   height: 20,
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage('assets/img/$img'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child:
                      Image.asset("assets/img/$img", height: 130, width: 130)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: width * .28,
                    child: Text(
                      place,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )),
                const Icon(
                  Icons.star,
                  color: Colors.teal,
                  size: 12,
                ),
                const Text("4.5"),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 5,
                ),
                const Icon(
                  Icons.location_on,
                  color: Colors.grey,
                  size: 14,
                ),
                const SizedBox(
                    //width: width * .28,
                    child: const Text(
                  "Nuda Penida, Maldives",
                  style: TextStyle(fontSize: 10),
                )),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: new TextSpan(
                      text: '\$110/',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        new TextSpan(
                            text: 'person',
                            style: new TextStyle(
                                fontSize: 10, fontWeight: FontWeight.normal)),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) =>
                      //           const DestinationWeddingDetail()),
                      // );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.orange)),
                      child: const Padding(
                        padding: EdgeInsets.only(
                            top: 5, bottom: 5, right: 10, left: 10),
                        child: Text(
                          "Book",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget RoomBox(double width, String img, String place, String location) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: width * .41,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 5,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ], color: Colors.white, borderRadius: BorderRadius.circular(18)),
        child: Column(
          children: [
            // SizedBox(
            //   height: 20,
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage('assets/img/$img'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child:
                      Image.asset("assets/img/$img", height: 130, width: 130)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: width * .28,
                    child: Text(
                      place,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )),
                const Icon(
                  Icons.star,
                  color: Colors.teal,
                  size: 12,
                ),
                const Text("4.5"),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 5,
                ),
                const Icon(
                  Icons.location_on,
                  color: Colors.grey,
                  size: 14,
                ),
                SizedBox(
                    //width: width * .28,
                    child: Text(
                  location,
                  style: const TextStyle(fontSize: 10),
                )),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: new TextSpan(
                      text: '\$110/',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        new TextSpan(
                            text: 'person',
                            style: new TextStyle(
                                fontSize: 10, fontWeight: FontWeight.normal)),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const HotelRoomDetails()),
                      // );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.orange)),
                      child: const Padding(
                        padding: EdgeInsets.only(
                            top: 5, bottom: 5, right: 10, left: 10),
                        child: const Text(
                          "Book",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // Widget View(double width) {
  //   return Padding(
  //     padding: const EdgeInsets.all(10.0),
  //     child: Container(
  //       width: width * .41,
  //       // height: ,
  //       decoration: BoxDecoration(
  //           border: Border.all(color: Colors.black),
  //           color: Colors.white,
  //           borderRadius: BorderRadius.circular(18)),
  //       child: Column(
  //         children: [
  //           // SizedBox(
  //           //   height: 20,
  //           // ),
  //           Container(
  //               decoration: BoxDecoration(
  //                 color: Colors.white,
  //                 borderRadius: BorderRadius.circular(8),
  //               ),
  //               child: Padding(
  //                 padding: const EdgeInsets.only(
  //                     left: 20, right: 20, top: 100, bottom: 100),
  //                 child: Text("See all",
  //                     style:
  //                         TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
  //               )),
  //         ],
  //       ),
  //     ),
  //   );
  // }
  Widget DrawerBox(double width) {
    return Container(
      width: width * .7,
      child: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            UserAccountsDrawerHeader(
              // arrowColor: Colors.black,
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
              accountName: Text("Tester"),
              accountEmail: Text("test@gmail.com"),
              currentAccountPicture: Image.network(
                  'https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/a89c3e38-b6f3-48a0-9f9e-df9a0129fb93/daghh5x-4a77b3ec-fd4f-4d17-9f84-5963a8cb5c03.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2E4OWMzZTM4LWI2ZjMtNDhhMC05ZjllLWRmOWEwMTI5ZmI5M1wvZGFnaGg1eC00YTc3YjNlYy1mZDRmLTRkMTctOWY4NC01OTYzYThjYjVjMDMucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.dWTFMrwnbAbj5TtUp9U_vQsohW7MnkRPymzR5wZQoV8'),
            ),
            ListTile(
              leading: Icon(Icons.home),

              //shape: Border.all(color: Colors.black),
              title: Text('Home'),
            ),
            Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            ListTile(
              leading: Icon(Icons.play_circle),

              //  shape: Border.all(color: Colors.black),
              title: Text('Wedding Destination'),
            ),
            Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            ListTile(
              leading: Icon(Icons.place_sharp),

              // shape: Border
              //.all(color: Colors.black),
              title: Text('Exotic Place'),
            ),
            Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            ListTile(
              leading: Icon(Icons.dehaze_rounded),

              // shape: Border
              //.all(color: Colors.black),
              title: Text('Best Deals'),
            ),
            Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            ListTile(
              leading: Icon(Icons.hotel),

              // shape: Border.all(color: Colors.black),
              title: Text('Hotels'),
              onTap: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => AboutUs()),
                // );
                // Navigator.pop(context);
              },
            ),
            Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            ListTile(
              leading: Icon(Icons.flight),

              // shape: Border.all(color: Colors.black),
              title: Text('Flights'),
            ),
            Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            ListTile(
              leading: Icon(Icons.question_answer_outlined),
              title: Text(
                "FAQs",
              ),
              // subtitle: Text('Item description'),
              //trailing: Icon(Icons.more_vert),
              // shape: Border.all(color: Colors.black),
              // title: Text('FAQ'),
            ),
            Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            SizedBox(
              height: 10,
            ),
            Center(child: Text("Legals")),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.phone),
                Text("Contact us"),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Center(child: Text("Version 1.0.0"))
          ],
        ),
      ),
    );
  }

  Widget ExoticBox(double width, String img, String place, String location) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: width * .41,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 5,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ], color: Colors.white, borderRadius: BorderRadius.circular(18)),
        child: Column(
          children: [
            // SizedBox(
            //   height: 20,
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage('assets/img/$img'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child:
                      Image.asset("assets/img/$img", height: 130, width: 130)),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                    width: width * .35,
                    child: Text(
                      place,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    )),
                // Icon(
                //   Icons.star,
                //   color: Colors.teal,
                //   size: 12,
                // ),
                // Text("4.5"),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  width: 5,
                ),
                const Icon(
                  Icons.location_on,
                  color: Colors.grey,
                  size: 14,
                ),
                SizedBox(
                    //width: width * .28,
                    child: Text(
                  location,
                  style: const TextStyle(fontSize: 10),
                )),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: new TextSpan(
                      text: '\$110/',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        new TextSpan(
                            text: 'person',
                            style: new TextStyle(
                                fontSize: 10, fontWeight: FontWeight.normal)),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Navigator.push(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const ExoticPlaceDetail()),
                      // );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.teal)),
                      child: const Padding(
                        padding: EdgeInsets.only(
                            top: 5, bottom: 5, right: 10, left: 10),
                        child: Text(
                          "Book",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget Trip(double width, String img, String place, String location) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        width: width * .8,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 5,
            offset: const Offset(0, 0), // changes position of shadow
          ),
        ], color: Colors.white, borderRadius: BorderRadius.circular(18)),
        child: Column(
          children: [
            // SizedBox(
            //   height: 20,
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    image: DecorationImage(
                      image: AssetImage('assets/img/$img'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Image.asset("assets/img/$img",
                      height: 130, width: width * .7)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(children: [
                const Text(
                  "4 days 3 night",
                  style: const TextStyle(color: Colors.teal),
                )
              ]),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: width * .5,
                      child: Text(
                        place,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      )),
                  // Icon(
                  //   Icons.star,
                  //   color: Colors.teal,
                  //   size: 12,
                  // ),
                  // Text("4.5"),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 0,
                  ),
                  const Icon(
                    Icons.location_on,
                    color: Colors.grey,
                    size: 14,
                  ),
                  SizedBox(
                      //width: width * .28,
                      child: Text(
                    location,
                    style: const TextStyle(fontSize: 10),
                  )),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RichText(
                    text: new TextSpan(
                      text: '\$110/',
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        new TextSpan(
                            text: 'person',
                            style: new TextStyle(
                                fontSize: 10, fontWeight: FontWeight.normal)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.orange)),
                      child: const Padding(
                        padding: EdgeInsets.only(
                            top: 5, bottom: 5, right: 10, left: 10),
                        child: const Text(
                          "Book",
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
