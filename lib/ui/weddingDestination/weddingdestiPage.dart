import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel/ui/weddingDestination/weddingDestiDetail.dart';

import 'dart:developer';

import '../../controller/authController.dart';
import '../../register/login.dart';
import '../home/enquiry/enquiryEmail.dart';
// import 'bestdealDetail.dart';

class WeddingDestinationScreen extends StatefulWidget {
  const WeddingDestinationScreen() : super();

  @override
  State<WeddingDestinationScreen> createState() =>
      _WeddingDestinationScreenState();
}

class _WeddingDestinationScreenState extends State<WeddingDestinationScreen> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double width = MediaQuery.of(context).size.width - 40;
    return Scaffold(
        appBar: AppBar(),
        // backgroundColor: const Color(0xFFEEE6EE),
        body: Stack(children: [
          Container(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              child: ListView(children: [
                Column(
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: width * .05,
                              ),
                              Text(
                                "Destination Wedding",
                                style: TextStyle(
                                    fontSize: 28,
                                    color: Colors.teal,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(children: [
                                for (var x in authController
                                    .destinationWeddingList.reversed)
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        print(authController
                                            .destinationWeddingList
                                            .indexOf(x));
                                        Get.to(
                                            () =>
                                                WeddingDestinationDetailScreen(),
                                            arguments: authController
                                                .destinationWeddingList
                                                .indexOf(x));
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.2),
                                                spreadRadius: 5,
                                                blurRadius: 5,
                                                offset: const Offset(0,
                                                    0), // changes position of shadow
                                              ),
                                            ],
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(18)),
                                        child: Column(
                                          children: [
                                            // SizedBox(
                                            //   height: 20,
                                            // ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                      "https://kabiatravels.com/admin/packageimage/" +
                                                          x["PackageImage"],
                                                    ),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                child: Image.network(
                                                    "https://kabiatravels.com/admin/packageimage/" +
                                                        x["PackageImage"],
                                                    height: 150,
                                                    width: width * .9),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10.0),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                        x["PackageName"],
                                                        style: const TextStyle(
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 20)),
                                                  )
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15),
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      x["PackageType"],
                                                      style: const TextStyle(
                                                          color: Colors.teal),
                                                    ),
                                                  ]),
                                            ),
                                            // SizedBox(
                                            //   height: 5,
                                            // ),
                                            // Padding(
                                            //   padding:
                                            //       const EdgeInsets.only(left: 15),
                                            //   child: Row(
                                            //     //mainAxisAlignment: MainAxisAlignment.center,
                                            //     children: [
                                            //       SizedBox(
                                            //           width: width * .5,
                                            //           child: Text(
                                            //             x['PackageName'],
                                            //             style: const TextStyle(
                                            //                 fontWeight:
                                            //                     FontWeight.bold,
                                            //                 fontSize: 16),
                                            //           )),
                                            //     ],
                                            //   ),
                                            // ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
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
                                                    style: const TextStyle(
                                                        fontSize: 10),
                                                  )),
                                                ],
                                              ),
                                            ),

                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  RichText(
                                                    text: new TextSpan(
                                                      text: "Rs. " +
                                                          x['PackagePrice'] +
                                                          "",
                                                      style: const TextStyle(
                                                          color: Colors.orange,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      children: <TextSpan>[
                                                        new TextSpan(
                                                            text:
                                                                x['discprice'],
                                                            style: new TextStyle(
                                                                decoration:
                                                                    TextDecoration
                                                                        .lineThrough,
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 10,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal)),
                                                        new TextSpan(
                                                            text: ' ',
                                                            style: new TextStyle(
                                                                fontSize: 10,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal)),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        if (authController
                                                                .user ==
                                                            null) {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        LoginScreen()),
                                                          );
                                                        } else {
                                                          Navigator.push(
                                                            context,
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        MyFormScreen()),
                                                          );
                                                        }
                                                      },
                                                      child: Container(
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20),
                                                            border: Border.all(
                                                                color: Colors
                                                                    .orange)),
                                                        child: const Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 5,
                                                                  bottom: 5,
                                                                  right: 10,
                                                                  left: 10),
                                                          child: const Text(
                                                            "Enquire",
                                                            style: TextStyle(
                                                                fontSize: 12),
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
                                    ),
                                  )
                              ])),
                        ],
                      ),
                    )
                  ],
                )
              ])),
        ]));
  }

  // Widget WeddingDestinationScreen(double width, String img) {
  //   return Padding(
  //     padding: const EdgeInsets.all(8.0),
  //     child: Container(
  //       width: width * 1,
  //       decoration: BoxDecoration(
  //           // border: Border.all(color: Colors.black),
  //           color: Colors.white,
  //           borderRadius: BorderRadius.circular(18)),
  //       child: Column(
  //         children: [
  //           Padding(
  //             padding: const EdgeInsets.all(8.0),
  //             child: Container(
  //                 width: width * .9,
  //                 height: 200,
  //                 decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(10.0),
  //                   image: DecorationImage(
  //                     image: AssetImage('assets/img/$img'),
  //                     fit: BoxFit.cover,
  //                   ),
  //                 ),
  //                 child: Text("")),
  //           ),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             children: [
  //               SizedBox(
  //                 width: width * .05,
  //               ),
  //               SizedBox(
  //                   width: width * .78,
  //                   child: Text(
  //                     "place",
  //                     style: TextStyle(fontWeight: FontWeight.bold),
  //                   )),
  //               Icon(
  //                 Icons.star,
  //                 color: Colors.teal,
  //                 size: 12,
  //               ),
  //               Text("4.5"),
  //             ],
  //           ),
  //           SizedBox(
  //             height: 10,
  //           ),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             children: [
  //               SizedBox(
  //                 width: width * .05,
  //               ),
  //               Icon(
  //                 Icons.location_on,
  //                 color: Colors.grey,
  //                 size: 14,
  //               ),
  //               SizedBox(
  //                   //width: width * .28,
  //                   child: Text(
  //                 "Nuda Penida, Maldives",
  //                 style: TextStyle(fontSize: 10),
  //               )),
  //             ],
  //           ),
  //           SizedBox(
  //             height: 5,
  //           ),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.start,
  //             children: [
  //               SizedBox(
  //                 width: width * .05,
  //               ),
  //               SizedBox(
  //                 width: width * .75,
  //                 child: RichText(
  //                   text: new TextSpan(
  //                     text: '\$110/',
  //                     style: TextStyle(
  //                         color: Colors.black,
  //                         fontSize: 12,
  //                         fontWeight: FontWeight.bold),
  //                     children: <TextSpan>[
  //                       new TextSpan(
  //                           text: 'person',
  //                           style: new TextStyle(
  //                               fontSize: 10, fontWeight: FontWeight.normal)),
  //                     ],
  //                   ),
  //                 ),
  //               ),
  //               Padding(
  //                 padding: const EdgeInsets.only(bottom: 10),
  //                 child: GestureDetector(
  //                   onTap: () {
  //                     // Navigator.push(
  //                     //   context,
  //                     //   MaterialPageRoute(
  //                     //       builder: (context) => WeddingDestinationScreenDetail()),
  //                     // );
  //                   },
  //                   child: Container(
  //                     decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.circular(20),
  //                         border: Border.all(color: Colors.orange)),
  //                     child: Padding(
  //                       padding: const EdgeInsets.only(
  //                           top: 5, bottom: 5, right: 10, left: 10),
  //                       child: Text(
  //                         "Enquire",
  //                         style: TextStyle(fontSize: 12),
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
