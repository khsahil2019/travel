import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import 'dart:developer';

import '../../controller/authController.dart';
import '../../register/login.dart';
import '../home/enquiry/enquiryEmail.dart';
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
                          SizedBox(
                            height: 20,
                          ),
                          SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(children: [
                                for (var x in authController.dealsList)
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GestureDetector(
                                      onTap: () {
                                        print(authController.dealsList
                                            .indexOf(x));
                                        Get.to(() => BestDealsDetail(),
                                            arguments: authController.dealsList
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
                                                          x['discprice'] +
                                                          "/",
                                                      style: const TextStyle(
                                                          color: Colors.orange,
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      children: <TextSpan>[
                                                        new TextSpan(
                                                            text: x[
                                                                'PackagePrice'],
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
                                                            text: ' person',
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
                                                        // Get.to(() => LoginScreen());

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
}
