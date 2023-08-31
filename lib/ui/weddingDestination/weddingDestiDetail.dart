import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';

import 'package:rflutter_alert/rflutter_alert.dart';

import '../../controller/authController.dart';
import '../../register/login.dart';
import '../bookingReviewPage/bookingReviewScreen.dart';

class WeddingDestinationDetailScreen extends StatefulWidget {
  const WeddingDestinationDetailScreen() : super();

  @override
  State<WeddingDestinationDetailScreen> createState() =>
      _WeddingDestinationDetailScreenState();
}

class _WeddingDestinationDetailScreenState
    extends State<WeddingDestinationDetailScreen> {
  bool isInclude = false;
  var data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double width = MediaQuery.of(context).size.width - 40;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: ListView(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      // Text(authController.destinationWeddingList[data]
                      //     .toString()),
                      // for (var x in authController.destinationWeddingList)
                      Column(
                        children: [
                          CarouselSlider(
                            options: CarouselOptions(
                              height: 200.0,
                              autoPlay: true,
                              enlargeCenterPage: true,
                              aspectRatio: 16 / 9,
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enableInfiniteScroll: true,
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 800),
                              viewportFraction: 0.7,
                            ),
                            items: [
                              // 'https://kabiatravels.com/admin/packageimage/' +
                              //     authController.destinationWeddingList[data]["image"],
                              // // 'https://kabiatravels.com/admin/packageimage/' +
                              // //     authController.destinationWeddingList[data]["image"],
                              // // 'https://kabiatravels.com/admin/packageimage/' +
                              // //     authController.destinationWeddingList[data]["image"],
                              'https://kabiatravels.com/admin/packageimage/' +
                                  authController.destinationWeddingList[data]
                                      ["PackageImage"],
                            ]
                                .map((item) => Container(
                                      child: Center(
                                        child: Image.network(
                                          item,
                                          // height: 400.0,
                                          width: double.infinity,
                                        ),
                                        //     Image.asset(
                                        //   item,
                                        //   fit: BoxFit.cover,
                                        //   width: double.infinity,
                                        //   height: 400.0,
                                        // ),
                                      ),
                                    ))
                                .toList(),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                authController.destinationWeddingList[data]
                                        ["PackageName"]
                                    .toString(),
                                style: TextStyle(
                                    fontFamily: "Sail",
                                    fontSize: 28,
                                    color: Colors.teal),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
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
                                authController.destinationWeddingList[data]
                                    ['PackageLocation'],
                                style: const TextStyle(fontSize: 12),
                              )),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          Text(
                              authController.destinationWeddingList[data]
                                  ['PackageFetures'],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18, color: Colors.orange)),
                          SizedBox(
                            height: 10,
                          ),

                          Text(
                              authController.destinationWeddingList[data]
                                  ['PackageDetails'],
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 12, color: Colors.teal)),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                  width: width * .9,
                                  child: Text("Rs " +
                                      authController
                                          .destinationWeddingList[data]
                                              ["PackagePrice"]
                                          .toString() +
                                      "/per Person")),
                              Icon(Icons.person_outline),
                              // Icon(Icons.person_outline),
                              // Icon(Icons.person_outline)
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Hotel Name :",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.black),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                authController.destinationWeddingList[data]
                                    ["hotelname"],
                                style: TextStyle(
                                    fontSize: 18, color: Colors.orange),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text(
                                "Highlights",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                    color: Colors.orange),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          authController.destinationWeddingList[data]["high1"]
                                  .toString()
                                  .isNotEmpty
                              ? Row(
                                  children: [
                                    Icon(Icons.check, color: Colors.teal),
                                    SizedBox(
                                      width: width * .05,
                                    ),
                                    SizedBox(
                                      width: width * .9,
                                      child: Text(
                                        authController
                                                .destinationWeddingList[data]
                                            ["high1"],
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ],
                                )
                              : SizedBox(),
                          SizedBox(
                            height: 10,
                          ),
                          authController.destinationWeddingList[data]["high2"]
                                  .toString()
                                  .isNotEmpty
                              ? Row(
                                  children: [
                                    Icon(Icons.check, color: Colors.teal),
                                    SizedBox(
                                      width: width * .05,
                                    ),
                                    SizedBox(
                                      width: width * .9,
                                      child: Text(
                                        authController
                                                .destinationWeddingList[data]
                                            ["high2"],
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ],
                                )
                              : SizedBox(),
                          SizedBox(
                            height: 10,
                          ),
                          authController.destinationWeddingList[data]["high3"]
                                  .toString()
                                  .isNotEmpty
                              ? Row(
                                  children: [
                                    Icon(Icons.check, color: Colors.teal),
                                    SizedBox(
                                      width: width * .05,
                                    ),
                                    SizedBox(
                                      width: width * .9,
                                      child: Text(
                                        authController
                                                .destinationWeddingList[data]
                                            ["high3"],
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ],
                                )
                              : SizedBox(),
                          SizedBox(
                            height: 10,
                          ),
                          authController.destinationWeddingList[data]["high4"]
                                  .toString()
                                  .isNotEmpty
                              ? Row(
                                  children: [
                                    Icon(Icons.check, color: Colors.teal),
                                    SizedBox(
                                      width: width * .05,
                                    ),
                                    SizedBox(
                                      width: width * .9,
                                      child: Text(
                                        authController
                                                .destinationWeddingList[data]
                                            ["high4"],
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ],
                                )
                              : SizedBox(),
                          SizedBox(
                            height: 10,
                          ),
                          authController.destinationWeddingList[data]["high5"]
                                  .toString()
                                  .isNotEmpty
                              ? Row(
                                  children: [
                                    Icon(Icons.check, color: Colors.teal),
                                    SizedBox(
                                      width: width * .05,
                                    ),
                                    SizedBox(
                                      width: width * .9,
                                      child: Text(
                                        authController
                                                .destinationWeddingList[data]
                                            ["high5"],
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ],
                                )
                              : SizedBox(),
                          SizedBox(
                            height: 10,
                          ),
                          authController.destinationWeddingList[data]["high6"]
                                  .toString()
                                  .isNotEmpty
                              ? Row(
                                  children: [
                                    Icon(Icons.check, color: Colors.teal),
                                    SizedBox(
                                      width: width * .05,
                                    ),
                                    SizedBox(
                                      width: width * .9,
                                      child: Text(
                                        authController
                                                .destinationWeddingList[data]
                                            ["high6"],
                                        style: TextStyle(fontSize: 14),
                                      ),
                                    ),
                                  ],
                                )
                              : SizedBox(),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isInclude = true;
                                  });
                                  // isInclude == true
                                  //     ? Text("data")
                                  //     : Text("data2");
                                },
                                child: Container(
                                    width: width * .3,
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: isInclude
                                            ? Color.fromARGB(255, 228, 224, 224)
                                            : Colors.white,
                                        borderRadius: BorderRadius.circular(18),
                                        border: Border.all(
                                          color: isInclude
                                              ? Colors.orange
                                              : Colors.teal,
                                        )),
                                    child: Center(child: Text("Included"))),
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isInclude = false;
                                  });
                                },
                                child: Container(
                                    width: width * .3,
                                    padding: EdgeInsets.all(8),
                                    decoration: BoxDecoration(
                                        color: isInclude
                                            ? Colors.white
                                            : Color.fromARGB(
                                                255, 228, 224, 224),
                                        borderRadius: BorderRadius.circular(18),
                                        border: Border.all(
                                          color: isInclude
                                              ? Colors.teal
                                              : Colors.orange,
                                        )),
                                    child: Center(child: Text("Not Included"))),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          isInclude == true
                              ? Column(
                                  children: [
                                    SizedBox(
                                      height: 15,
                                    ),
                                    authController.destinationWeddingList[data]
                                                ["include1"]
                                            .toString()
                                            .isNotEmpty
                                        ? Row(
                                            children: [
                                              Icon(Icons.check,
                                                  color: Colors.teal),
                                              SizedBox(
                                                width: width * .05,
                                              ),
                                              SizedBox(
                                                width: width * .9,
                                                child: Text(
                                                  authController
                                                          .destinationWeddingList[
                                                      data]["include1"],
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          )
                                        : SizedBox(),
                                    authController.destinationWeddingList[data]
                                                ["include2"]
                                            .toString()
                                            .isNotEmpty
                                        ? Row(
                                            children: [
                                              Icon(Icons.check,
                                                  color: Colors.teal),
                                              SizedBox(
                                                width: width * .05,
                                              ),
                                              SizedBox(
                                                width: width * .9,
                                                child: Text(
                                                  authController
                                                          .destinationWeddingList[
                                                      data]["include2"],
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          )
                                        : SizedBox(),
                                    authController.destinationWeddingList[data]
                                                ["include3"]
                                            .toString()
                                            .isNotEmpty
                                        ? Row(
                                            children: [
                                              Icon(Icons.check,
                                                  color: Colors.teal),
                                              SizedBox(
                                                width: width * .05,
                                              ),
                                              SizedBox(
                                                width: width * .9,
                                                child: Text(
                                                  authController
                                                          .destinationWeddingList[
                                                      data]["include3"],
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          )
                                        : SizedBox(),
                                    authController.destinationWeddingList[data]
                                                ["include4"]
                                            .toString()
                                            .isNotEmpty
                                        ? Row(
                                            children: [
                                              Icon(Icons.check,
                                                  color: Colors.teal),
                                              SizedBox(
                                                width: width * .05,
                                              ),
                                              SizedBox(
                                                width: width * .9,
                                                child: Text(
                                                  authController
                                                          .destinationWeddingList[
                                                      data]["include4"],
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          )
                                        : SizedBox(),
                                    authController.destinationWeddingList[data]
                                                ["include5"]
                                            .toString()
                                            .isNotEmpty
                                        ? Row(
                                            children: [
                                              Icon(Icons.check,
                                                  color: Colors.teal),
                                              SizedBox(
                                                width: width * .05,
                                              ),
                                              SizedBox(
                                                width: width * .9,
                                                child: Text(
                                                  authController
                                                          .destinationWeddingList[
                                                      data]["include5"],
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          )
                                        : SizedBox(),
                                    authController.destinationWeddingList[data]
                                                ["include6"]
                                            .toString()
                                            .isNotEmpty
                                        ? Row(
                                            children: [
                                              Icon(Icons.check,
                                                  color: Colors.teal),
                                              SizedBox(
                                                width: width * .05,
                                              ),
                                              SizedBox(
                                                width: width * .9,
                                                child: Text(
                                                  authController
                                                          .destinationWeddingList[
                                                      data]["include6"],
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          )
                                        : SizedBox(),
                                    authController.destinationWeddingList[data]
                                                ["include7"]
                                            .toString()
                                            .isNotEmpty
                                        ? Row(
                                            children: [
                                              Icon(Icons.check,
                                                  color: Colors.teal),
                                              SizedBox(
                                                width: width * .05,
                                              ),
                                              SizedBox(
                                                width: width * .9,
                                                child: Text(
                                                  authController
                                                          .destinationWeddingList[
                                                      data]["include7"],
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          )
                                        : SizedBox(),
                                    authController.destinationWeddingList[data]
                                                ["include8"]
                                            .toString()
                                            .isNotEmpty
                                        ? Row(
                                            children: [
                                              Icon(Icons.check,
                                                  color: Colors.teal),
                                              SizedBox(
                                                width: width * .05,
                                              ),
                                              SizedBox(
                                                width: width * .9,
                                                child: Text(
                                                  authController
                                                          .destinationWeddingList[
                                                      data]["include8"],
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          )
                                        : SizedBox(),
                                    authController.destinationWeddingList[data]
                                                ["include9"]
                                            .toString()
                                            .isNotEmpty
                                        ? Row(
                                            children: [
                                              Icon(Icons.check,
                                                  color: Colors.teal),
                                              SizedBox(
                                                width: width * .05,
                                              ),
                                              SizedBox(
                                                width: width * .9,
                                                child: Text(
                                                  authController
                                                          .destinationWeddingList[
                                                      data]["include9"],
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          )
                                        : SizedBox(),
                                    authController.destinationWeddingList[data]
                                                ["include10"]
                                            .toString()
                                            .isNotEmpty
                                        ? Row(
                                            children: [
                                              Icon(Icons.check,
                                                  color: Colors.teal),
                                              SizedBox(
                                                width: width * .05,
                                              ),
                                              SizedBox(
                                                width: width * .9,
                                                child: Text(
                                                  authController
                                                          .destinationWeddingList[
                                                      data]["include10"],
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          )
                                        : SizedBox(),
                                  ],
                                )
                              : Column(
                                  children: [
                                    SizedBox(
                                      height: 15,
                                    ),
                                    authController.destinationWeddingList[data]
                                                ["notinclude1"]
                                            .toString()
                                            .isNotEmpty
                                        ? Row(
                                            children: [
                                              Icon(Icons.check,
                                                  color: Colors.teal),
                                              SizedBox(
                                                width: width * .05,
                                              ),
                                              SizedBox(
                                                width: width * .9,
                                                child: Text(
                                                  authController
                                                          .destinationWeddingList[
                                                      data]["notinclude1"],
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          )
                                        : SizedBox(),
                                    authController.destinationWeddingList[data]
                                                ["notinclude2"]
                                            .toString()
                                            .isNotEmpty
                                        ? Row(
                                            children: [
                                              Icon(Icons.check,
                                                  color: Colors.teal),
                                              SizedBox(
                                                width: width * .05,
                                              ),
                                              SizedBox(
                                                width: width * .9,
                                                child: Text(
                                                  authController
                                                          .destinationWeddingList[
                                                      data]["notinclude2"],
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          )
                                        : SizedBox(),
                                    authController.destinationWeddingList[data]
                                                ["notinclude3"]
                                            .toString()
                                            .isNotEmpty
                                        ? Row(
                                            children: [
                                              Icon(Icons.check,
                                                  color: Colors.teal),
                                              SizedBox(
                                                width: width * .05,
                                              ),
                                              SizedBox(
                                                width: width * .9,
                                                child: Text(
                                                  authController
                                                          .destinationWeddingList[
                                                      data]["notinclude3"],
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          )
                                        : SizedBox(),
                                    authController.destinationWeddingList[data]
                                                ["notinclude4"]
                                            .toString()
                                            .isNotEmpty
                                        ? Row(
                                            children: [
                                              Icon(Icons.check,
                                                  color: Colors.teal),
                                              SizedBox(
                                                width: width * .05,
                                              ),
                                              SizedBox(
                                                width: width * .9,
                                                child: Text(
                                                  authController
                                                          .destinationWeddingList[
                                                      data]["notinclude4"],
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          )
                                        : SizedBox(),
                                    authController.destinationWeddingList[data]
                                                ["notinclude5"]
                                            .toString()
                                            .isNotEmpty
                                        ? Row(
                                            children: [
                                              Icon(Icons.check,
                                                  color: Colors.teal),
                                              SizedBox(
                                                width: width * .05,
                                              ),
                                              SizedBox(
                                                width: width * .9,
                                                child: Text(
                                                  authController
                                                          .destinationWeddingList[
                                                      data]["notinclude5"],
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          )
                                        : SizedBox(),
                                    authController.destinationWeddingList[data]
                                                ["notinclude6"]
                                            .toString()
                                            .isNotEmpty
                                        ? Row(
                                            children: [
                                              Icon(Icons.check,
                                                  color: Colors.teal),
                                              SizedBox(
                                                width: width * .05,
                                              ),
                                              SizedBox(
                                                width: width * .9,
                                                child: Text(
                                                  authController
                                                          .destinationWeddingList[
                                                      data]["notinclude6"],
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          )
                                        : SizedBox(),
                                    authController.destinationWeddingList[data]
                                                ["notinclude7"]
                                            .toString()
                                            .isNotEmpty
                                        ? Row(
                                            children: [
                                              Icon(Icons.check,
                                                  color: Colors.teal),
                                              SizedBox(
                                                width: width * .05,
                                              ),
                                              SizedBox(
                                                width: width * .9,
                                                child: Text(
                                                  authController
                                                          .destinationWeddingList[
                                                      data]["notinclude7"],
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          )
                                        : SizedBox(),
                                    authController.destinationWeddingList[data]
                                                ["notinclude8"]
                                            .toString()
                                            .isNotEmpty
                                        ? Row(
                                            children: [
                                              Icon(Icons.check,
                                                  color: Colors.teal),
                                              SizedBox(
                                                width: width * .05,
                                              ),
                                              SizedBox(
                                                width: width * .9,
                                                child: Text(
                                                  authController
                                                          .destinationWeddingList[
                                                      data]["notinclude8"],
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          )
                                        : SizedBox(),
                                    authController.destinationWeddingList[data]
                                                ["notinclude9"]
                                            .toString()
                                            .isNotEmpty
                                        ? Row(
                                            children: [
                                              Icon(Icons.check,
                                                  color: Colors.teal),
                                              SizedBox(
                                                width: width * .05,
                                              ),
                                              SizedBox(
                                                width: width * .9,
                                                child: Text(
                                                  authController
                                                          .destinationWeddingList[
                                                      data]["notinclude9"],
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          )
                                        : SizedBox(),
                                    authController.destinationWeddingList[data]
                                                ["notinclude10"]
                                            .toString()
                                            .isNotEmpty
                                        ? Row(
                                            children: [
                                              Icon(Icons.check,
                                                  color: Colors.teal),
                                              SizedBox(
                                                width: width * .05,
                                              ),
                                              SizedBox(
                                                width: width * .9,
                                                child: Text(
                                                  authController
                                                          .destinationWeddingList[
                                                      data]["notinclude10"],
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          )
                                        : SizedBox(),
                                  ],
                                ),

                          SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              print(
                                  authController.destinationWeddingList[data]);
                              Get.to(() => ReviewDetail(),
                                  arguments: authController
                                      .destinationWeddingList[data]);
                              // Get.to(() => LoginScreen());
                              //  _openPopup(context);
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //       builder: (context) => ReviewDetail()),
                              // );
                            },
                            child: Container(
                              width: width * .9,
                              height: 40.0,
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.orange),
                                borderRadius: BorderRadius.circular(30.0),
                                color: Colors.white,
                              ),
                              child: Center(
                                child: Text(
                                  'Book Now',
                                  style: TextStyle(
                                    color: Colors.teal,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ),
                          ),

                          // Add additional facilities and details below the slideshow
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
