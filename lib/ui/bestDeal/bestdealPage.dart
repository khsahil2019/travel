import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import 'dart:developer';

import '../../controller/authController.dart';
import 'bestdealDetail.dart';

class BestDeals extends StatefulWidget {
  const BestDeals() : super();

  @override
  State<BestDeals> createState() => _BestDealsState();
}

class _BestDealsState extends State<BestDeals> {
  double _value = 0;
  final double _min = 500;
  final double _max = 50000;

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double width = MediaQuery.of(context).size.width - 40;
    return Scaffold(
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
                            "Best Deals",
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
                      // SingleChildScrollView(
                      //     scrollDirection: Axis.horizontal,
                      //     padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                      //     child: Container(
                      //       //  margin: EdgeInsets.all(10),
                      //       // height: 150,
                      //       // width: 900,
                      //       decoration: BoxDecoration(
                      //         border: Border.all(
                      //           width: 1,
                      //           color: Colors.teal,
                      //         ),
                      //         borderRadius: BorderRadius.circular(79),
                      //       ),
                      //       child: Padding(
                      //         padding: const EdgeInsets.all(30.0),
                      //         child: Row(children: [
                      //           Column(
                      //             children: [
                      //               Text(
                      //                 "Destination",
                      //                 style: TextStyle(
                      //                     fontSize: 14,
                      //                     color: Colors.teal,
                      //                     fontWeight: FontWeight.bold),
                      //               ),
                      //               Container(
                      //                 width: width * .4,
                      //                 child: TextField(
                      //                   enabled: true,
                      //                   // controller: destinationCtrl,
                      //                   decoration: const InputDecoration(
                      //                       hintText: 'Enter Destination',
                      //                       border: UnderlineInputBorder(
                      //                           borderSide: BorderSide(
                      //                               color: Colors.teal)),
                      //                       focusedBorder: UnderlineInputBorder(
                      //                         borderSide: BorderSide(
                      //                             color: Colors.teal),
                      //                       ),
                      //                       enabledBorder:
                      //                           UnderlineInputBorder()),
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //           SizedBox(width: 20),
                      //           Container(
                      //               color: Colors.teal, width: 2, height: 70),
                      //           SizedBox(width: 20),
                      //           Column(
                      //             children: [
                      //               Text(
                      //                 "No. of Pax",
                      //                 style: TextStyle(
                      //                     fontSize: 14,
                      //                     color: Colors.teal,
                      //                     fontWeight: FontWeight.bold),
                      //               ),
                      //               Container(
                      //                 width: width * .4,
                      //                 child: TextField(
                      //                   enabled: true,
                      //                   // controller: destinationCtrl,
                      //                   decoration: const InputDecoration(
                      //                       hintText: 'Enter Destination',
                      //                       border: UnderlineInputBorder(
                      //                           borderSide: BorderSide(
                      //                               color: Colors.teal)),
                      //                       focusedBorder: UnderlineInputBorder(
                      //                         borderSide: BorderSide(
                      //                             color: Colors.teal),
                      //                       ),
                      //                       enabledBorder:
                      //                           UnderlineInputBorder()),
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //           //Divider(),
                      //           SizedBox(width: 20),
                      //           Container(
                      //               color: Colors.teal, width: 2, height: 70),
                      //           SizedBox(width: 20),
                      //           Column(
                      //             children: [
                      //               Text(
                      //                 "Price Range : 500 to 50,000",
                      //                 style: TextStyle(
                      //                     fontSize: 14,
                      //                     color: Colors.teal,
                      //                     fontWeight: FontWeight.bold),
                      //               ),
                      //               Container(
                      //                 width: width * .6,
                      //                 child: SfSlider(
                      //                   activeColor: Colors.orange,
                      //                   value: _value,
                      //                   min: _min,
                      //                   max: _max,
                      //                   interval: 15000,
                      //                   showTicks: true,
                      //                   showLabels: true,
                      //                   // numberFormat: NumberFormat("\$"),
                      //                   //  value: _value,
                      //                   // interval: 100.00,
                      //                   // showLabels: true,
                      //                   onChanged: (dynamic newValue) {
                      //                     setState(() {
                      //                       _value = newValue;
                      //                       _value.toInt();
                      //                     });
                      //                   },
                      //                 ),
                      //               ),
                      //               SizedBox(height: 20),
                      //               Text(
                      //                 "Rs : ${_value.toInt()}",
                      //                 style: TextStyle(
                      //                     fontSize: 12, color: Colors.orange),
                      //               ),
                      //             ],
                      //           ),
                      //           SizedBox(width: 20),
                      //           Column(
                      //             mainAxisAlignment: MainAxisAlignment.center,
                      //             children: [
                      //               Container(
                      //                 decoration: BoxDecoration(
                      //                     borderRadius:
                      //                         BorderRadius.circular(20),
                      //                     color: Colors.orange),
                      //                 child: Padding(
                      //                   padding: const EdgeInsets.only(
                      //                       top: 10,
                      //                       bottom: 10,
                      //                       right: 30,
                      //                       left: 30),
                      //                   child: Text(
                      //                     "Search",
                      //                     style: const TextStyle(
                      //                         color: Colors.white),
                      //                   ),
                      //                 ),
                      //               )
                      //             ],
                      //           )
                      //         ]),
                      //       ),
                      //     )),
                      SizedBox(
                        height: 20,
                      ),
                      SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(children: [
                            for (var x in authController.dealsList)
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.2),
                                          spreadRadius: 5,
                                          blurRadius: 5,
                                          offset: const Offset(0,
                                              0), // changes position of shadow
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
                                              height: 150,
                                              width: width * .9),
                                        ),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(x["PackageName"],
                                              style: const TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20))
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
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
                                        padding:
                                            const EdgeInsets.only(left: 15),
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
                                        padding:
                                            const EdgeInsets.only(left: 15),
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
                                                    color: Colors.orange,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                children: <TextSpan>[
                                                  new TextSpan(
                                                      text: x['discprice'],
                                                      style: new TextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                          color: Colors.black,
                                                          fontSize: 10,
                                                          fontWeight: FontWeight
                                                              .normal)),
                                                  new TextSpan(
                                                      text: ' person',
                                                      style: new TextStyle(
                                                          fontSize: 10,
                                                          color: Colors.black,
                                                          fontWeight: FontWeight
                                                              .normal)),
                                                ],
                                              ),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: GestureDetector(
                                                onTap: () {
                                                  print(authController.dealsList
                                                      .indexOf(x));
                                                  Get.to(
                                                      () => BestDealsDetail(),
                                                      arguments: authController
                                                          .dealsList
                                                          .indexOf(x));
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20),
                                                      border: Border.all(
                                                          color:
                                                              Colors.orange)),
                                                  child: const Padding(
                                                    padding: EdgeInsets.only(
                                                        top: 5,
                                                        bottom: 5,
                                                        right: 10,
                                                        left: 10),
                                                    child: const Text(
                                                      "Book",
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

  // Widget BestDeals(double width, String img) {
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
  //                     Get.to(() =>
  //                         BestDealsDetail(authController.dealsList.indexOf(x)));
  //                   },
  //                   child: Container(
  //                     decoration: BoxDecoration(
  //                         borderRadius: BorderRadius.circular(20),
  //                         border: Border.all(color: Colors.orange)),
  //                     child: Padding(
  //                       padding: const EdgeInsets.only(
  //                           top: 5, bottom: 5, right: 10, left: 10),
  //                       child: Text(
  //                         "Book",
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
