import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:get/get.dart';

import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:travel/ui/home/enquiry/enquiryEmail.dart';

import '../../controller/authController.dart';
import '../../register/login.dart';
import '../bookingReviewPage/bookingReviewScreen.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class ExoticLocationDetail extends StatefulWidget {
  const ExoticLocationDetail() : super();

  @override
  State<ExoticLocationDetail> createState() => _ExoticLocationDetailState();
}

class _ExoticLocationDetailState extends State<ExoticLocationDetail> {
  bool isInclude = false;
  bool isDay1 = true;
  bool isDay2 = false;
  bool isDay3 = false;
  bool isDay4 = false;
  bool isDay5 = false;
  bool isDay6 = false;
  // List galleryList = [
  //   for (var x in authController.exoticplaceList)
  //     Image.network(
  //       "https://kabiatravels.com/admin/images/" + x!["image"],
  //     ),
  // ];
  var data = Get.arguments;
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    String hotelName = authController.exoticplaceList[data]["hotelname"];
    List<String> hotelNameList = hotelName.split(",");
    String gallery = authController.exoticplaceList[data]["image"];
    List<String> galleryList = gallery.split(",");
    String day1act = authController.exoticplaceList[data]["day1_activities"];
    List<String> day1data = day1act.split('%');
    List<String> updateday1 = day1act.split('","');
    List<String> selectedData1 = day1act.contains("%") ? day1data : updateday1;
    String day2act = authController.exoticplaceList[data]["day2_activities"];
    List<String> day2data = day2act.split('%');
    List<String> updateday2 = day2act.split('","');
    List<String> selectedData2 = day2act.contains("%") ? day2data : updateday2;
    String day3act = authController.exoticplaceList[data]["day3_activities"];
    List<String> day3data = day3act.split('%');
    List<String> updateday3 = day3act.split('","');
    List<String> selectedData3 = day3act.contains("%") ? day3data : updateday3;
    String day4act = authController.exoticplaceList[data]["day4_activities"];
    List<String> day4data = day4act.split('%');
    List<String> updateday4 = day4act.split('","');
    List<String> selectedData4 = day4act.contains("%") ? day4data : updateday4;
    String day5act = authController.exoticplaceList[data]["day5_activities"];
    List<String> day5data = day5act.split('%');
    List<String> updateday5 = day5act.split('","');
    List<String> selectedData5 = day5act.contains("%") ? day5data : updateday5;

    double width = MediaQuery.of(context).size.width - 40;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          // authController.dealsList[data]["PackageName"].toString()
          authController.exoticplaceList[data]["PackageName"].toString(),
          style: const TextStyle(color: Colors.black),
        ),
      ),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: ListView(
              children: [
                // SizedBox(
                //   height: 20,
                // ),
                // Text(galleryList.length.toString()),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
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
                              'https://kabiatravels.com/admin/packageimage/' +
                                  authController.exoticplaceList[data]
                                      ["PackageImage"],
                              'https://kabiatravels.com/admin/packageimage/' +
                                  authController.exoticplaceList[data]
                                      ["hotelimage"],
                              // 'https://kabiatravels.com/admin/images/' +
                              //     authController.exoticplaceList[2]["image"],
                            ]
                                .map((item) => Container(
                                      child: Center(
                                        child: Image.network(
                                          item,
                                          width: double.infinity,
                                        ),
                                        //     Image.asset(
                                        //   item,
                                        //   fit: BoxFit.cover,
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
                              SizedBox(
                                width: width * .7,
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    authController.exoticplaceList[data]
                                            ["PackageName"]
                                        .toString(),
                                    style: TextStyle(
                                        fontFamily: "Sail",
                                        fontSize: 28,
                                        color: Colors.teal),
                                  ),
                                ),
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
                                authController.exoticplaceList[data]
                                    ['PackageLocation'],
                                style: const TextStyle(fontSize: 12),
                              )),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          Text(
                              authController.exoticplaceList[data]
                                  ['PackageFetures'],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18, color: Colors.orange)),
                          SizedBox(
                            height: 10,
                          ),

                          // Text(
                          //     authController.exoticplaceList[data]
                          //         ['PackageDetails'],
                          //     textAlign: TextAlign.center,
                          //     style:
                          //         TextStyle(fontSize: 12, color: Colors.teal)),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              Expanded(
                                child: Text(
                                    authController.exoticplaceList[data]
                                            ['PackageDetails']
                                        .toString(),
                                    // textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.teal)),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              SizedBox(
                                  width: width * .9,
                                  child: Text("Rs " +
                                      authController.exoticplaceList[data]
                                              ["PackagePrice"]
                                          .toString() +
                                      "")),
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
                          for (var x in hotelNameList)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: width * .99,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      x.toString(),
                                      style: TextStyle(
                                          fontSize: 18, color: Colors.orange),
                                    ),
                                  ),
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

                          authController.exoticplaceList[data]["high1"]
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
                                        authController.exoticplaceList[data]
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
                          authController.exoticplaceList[data]["high2"]
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
                                        authController.exoticplaceList[data]
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
                          authController.exoticplaceList[data]["high3"]
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
                                        authController.exoticplaceList[data]
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
                          authController.exoticplaceList[data]["high4"]
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
                                        authController.exoticplaceList[data]
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
                          authController.exoticplaceList[data]["high5"]
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
                                        authController.exoticplaceList[data]
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
                          authController.exoticplaceList[data]["high6"]
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
                                        authController.exoticplaceList[data]
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
                                    authController.exoticplaceList[data]
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
                                                          .exoticplaceList[data]
                                                      ["include1"],
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          )
                                        : SizedBox(),
                                    authController.exoticplaceList[data]
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
                                                          .exoticplaceList[data]
                                                      ["include2"],
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          )
                                        : SizedBox(),
                                    authController.exoticplaceList[data]
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
                                                          .exoticplaceList[data]
                                                      ["include3"],
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          )
                                        : SizedBox(),
                                    authController.exoticplaceList[data]
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
                                                          .exoticplaceList[data]
                                                      ["include4"],
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          )
                                        : SizedBox(),
                                    authController.exoticplaceList[data]
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
                                                          .exoticplaceList[data]
                                                      ["include5"],
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          )
                                        : SizedBox(),
                                    authController.exoticplaceList[data]
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
                                                          .exoticplaceList[data]
                                                      ["include6"],
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          )
                                        : SizedBox(),
                                    authController.exoticplaceList[data]
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
                                                          .exoticplaceList[data]
                                                      ["include7"],
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          )
                                        : SizedBox(),
                                    authController.exoticplaceList[data]
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
                                                          .exoticplaceList[data]
                                                      ["include8"],
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          )
                                        : SizedBox(),
                                    authController.exoticplaceList[data]
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
                                                          .exoticplaceList[data]
                                                      ["include9"],
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          )
                                        : SizedBox(),
                                    authController.exoticplaceList[data]
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
                                                          .exoticplaceList[data]
                                                      ["include10"],
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
                                    authController.exoticplaceList[data]
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
                                                          .exoticplaceList[data]
                                                      ["notinclude1"],
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          )
                                        : SizedBox(),
                                    authController.exoticplaceList[data]
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
                                                          .exoticplaceList[data]
                                                      ["notinclude2"],
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          )
                                        : SizedBox(),
                                    authController.exoticplaceList[data]
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
                                                          .exoticplaceList[data]
                                                      ["notinclude3"],
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          )
                                        : SizedBox(),
                                    authController.exoticplaceList[data]
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
                                                          .exoticplaceList[data]
                                                      ["notinclude4"],
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          )
                                        : SizedBox(),
                                    authController.exoticplaceList[data]
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
                                                          .exoticplaceList[data]
                                                      ["notinclude5"],
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          )
                                        : SizedBox(),
                                    authController.exoticplaceList[data]
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
                                                          .exoticplaceList[data]
                                                      ["notinclude6"],
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          )
                                        : SizedBox(),
                                    authController.exoticplaceList[data]
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
                                                          .exoticplaceList[data]
                                                      ["notinclude7"],
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          )
                                        : SizedBox(),
                                    authController.exoticplaceList[data]
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
                                                          .exoticplaceList[data]
                                                      ["notinclude8"],
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          )
                                        : SizedBox(),
                                    authController.exoticplaceList[data]
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
                                                          .exoticplaceList[data]
                                                      ["notinclude9"],
                                                  style:
                                                      TextStyle(fontSize: 14),
                                                ),
                                              ),
                                            ],
                                          )
                                        : SizedBox(),
                                    authController.exoticplaceList[data]
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
                                                          .exoticplaceList[data]
                                                      ["notinclude10"],
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              authController.exoticplaceList[data]
                                          ["day1_activities"] !=
                                      ""
                                  ? GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isDay1 = !isDay1;
                                          isDay2 = false;
                                          isDay5 = false;
                                          isDay3 = false;
                                          isDay6 = false;
                                          isDay4 = false;
                                        });
                                      },
                                      child: Text(
                                        "Day-1",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: isDay1
                                              ? Colors.teal
                                              : Colors.grey,
                                        ),
                                      ),
                                    )
                                  : SizedBox(),
                              authController.exoticplaceList[data]
                                          ["day2_activities"] !=
                                      ""
                                  ? GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isDay2 = !isDay2;
                                          isDay1 = false;
                                          isDay5 = false;
                                          isDay3 = false;
                                          isDay6 = false;
                                          isDay4 = false;
                                        });
                                      },
                                      child: Text(
                                        "Day-2",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: isDay2
                                              ? Colors.teal
                                              : Colors.grey,
                                        ),
                                      ),
                                    )
                                  : SizedBox(),
                              authController.exoticplaceList[data]
                                          ["day3_activities"] !=
                                      ""
                                  ? GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isDay3 = !isDay3;
                                          isDay5 = false;
                                          isDay6 = false;
                                          isDay2 = false;
                                          isDay1 = false;
                                          isDay4 = false;
                                        });
                                      },
                                      child: Text(
                                        "Day-3",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: isDay3
                                              ? Colors.teal
                                              : Colors.grey,
                                        ),
                                      ),
                                    )
                                  : SizedBox(),
                              authController.exoticplaceList[data]
                                          ["day4_activities"] !=
                                      ""
                                  ? GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isDay4 = !isDay4;
                                          isDay5 = false;
                                          isDay3 = false;
                                          isDay6 = false;
                                          isDay2 = false;
                                          isDay1 = false;
                                        });
                                      },
                                      child: Text(
                                        "Day-4",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: isDay4
                                              ? Colors.teal
                                              : Colors.grey,
                                        ),
                                      ),
                                    )
                                  : SizedBox(),
                              authController.exoticplaceList[data]
                                          ["day5_activities"] !=
                                      ""
                                  ? GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          isDay5 = !isDay5;
                                          isDay6 = false;
                                          isDay4 = false;
                                          isDay3 = false;
                                          isDay2 = false;
                                          isDay1 = false;
                                        });
                                      },
                                      child: Text(
                                        "Day-5",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: isDay5
                                              ? Colors.teal
                                              : Colors.grey,
                                        ),
                                      ),
                                    )
                                  : SizedBox(),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          isDay1 == true
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: selectedData1
                                              .map((item) => Row(
                                                    children: [
                                                      Icon(Icons.check,
                                                          //  size: 5,
                                                          color: Colors.teal),
                                                      SizedBox(
                                                        width: width * .05,
                                                      ),
                                                      SizedBox(
                                                          width: width * .5,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(item),
                                                              SizedBox(
                                                                height: 10,
                                                              )
                                                            ],
                                                          )),
                                                    ],
                                                  ))
                                              .toList(),
                                        ),
                                        Container(
                                          // height: 100,
                                          width: width * .4,
                                          decoration: BoxDecoration(
                                            // color: Colors.teal,
                                            borderRadius: BorderRadius.circular(
                                                20.0), // Adjust the radius to change the corner roundness
                                            // Optional: Add a background color
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(24),
                                            child: Image.network(
                                              'https://kabiatravels.com/admin/packageimage/' +
                                                  authController
                                                          .exoticplaceList[data]
                                                      ["day1_image"],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              : SizedBox(),
                          isDay2 == true
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: selectedData2
                                              .map((item) => Row(
                                                    children: [
                                                      Icon(Icons.check,
                                                          //  size: 5,
                                                          color: Colors.teal),
                                                      SizedBox(
                                                        width: width * .05,
                                                      ),
                                                      SizedBox(
                                                          width: width * .5,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(item),
                                                              SizedBox(
                                                                height: 10,
                                                              )
                                                            ],
                                                          )),
                                                    ],
                                                  ))
                                              .toList(),
                                        ),
                                        Container(
                                          // height: 100,
                                          width: width * .4,
                                          decoration: BoxDecoration(
                                            // color: Colors.teal,
                                            borderRadius: BorderRadius.circular(
                                                20.0), // Adjust the radius to change the corner roundness
                                            // Optional: Add a background color
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(24),
                                            child: Image.network(
                                              'https://kabiatravels.com/admin/packageimage/' +
                                                  authController
                                                          .exoticplaceList[data]
                                                      ["day2_image"],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              : SizedBox(),
                          isDay3 == true
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: selectedData3
                                              .map((item) => Row(
                                                    children: [
                                                      Icon(Icons.check,
                                                          //  size: 5,
                                                          color: Colors.teal),
                                                      SizedBox(
                                                        width: width * .05,
                                                      ),
                                                      SizedBox(
                                                          width: width * .5,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(item),
                                                              SizedBox(
                                                                height: 10,
                                                              )
                                                            ],
                                                          )),
                                                    ],
                                                  ))
                                              .toList(),
                                        ),
                                        Container(
                                          // height: 100,
                                          width: width * .4,
                                          decoration: BoxDecoration(
                                            // color: Colors.teal,
                                            borderRadius: BorderRadius.circular(
                                                20.0), // Adjust the radius to change the corner roundness
                                            // Optional: Add a background color
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(24),
                                            child: Image.network(
                                              'https://kabiatravels.com/admin/packageimage/' +
                                                  authController
                                                          .exoticplaceList[data]
                                                      ["day3_image"],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              : SizedBox(),
                          isDay4 == true
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: selectedData4
                                              .map((item) => Row(
                                                    children: [
                                                      Icon(Icons.check,
                                                          //  size: 5,
                                                          color: Colors.teal),
                                                      SizedBox(
                                                        width: width * .05,
                                                      ),
                                                      SizedBox(
                                                          width: width * .5,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(item),
                                                              SizedBox(
                                                                height: 10,
                                                              )
                                                            ],
                                                          )),
                                                    ],
                                                  ))
                                              .toList(),
                                        ),
                                        Container(
                                          // height: 100,
                                          width: width * .4,
                                          decoration: BoxDecoration(
                                            // color: Colors.teal,
                                            borderRadius: BorderRadius.circular(
                                                20.0), // Adjust the radius to change the corner roundness
                                            // Optional: Add a background color
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(24),
                                            child: Image.network(
                                              'https://kabiatravels.com/admin/packageimage/' +
                                                  authController
                                                          .exoticplaceList[data]
                                                      ["day4_image"],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              : SizedBox(),
                          isDay5 == true
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: selectedData5
                                              .map((item) => Row(
                                                    children: [
                                                      Icon(Icons.check,
                                                          //  size: 5,
                                                          color: Colors.teal),
                                                      SizedBox(
                                                        width: width * .05,
                                                      ),
                                                      SizedBox(
                                                          width: width * .5,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(item),
                                                              SizedBox(
                                                                height: 10,
                                                              )
                                                            ],
                                                          )),
                                                    ],
                                                  ))
                                              .toList(),
                                        ),
                                        Container(
                                          // height: 100,
                                          width: width * .4,
                                          decoration: BoxDecoration(
                                            // color: Colors.teal,
                                            borderRadius: BorderRadius.circular(
                                                20.0), // Adjust the radius to change the corner roundness
                                            // Optional: Add a background color
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(24),
                                            child: Image.network(
                                              'https://kabiatravels.com/admin/packageimage/' +
                                                  authController
                                                          .exoticplaceList[data]
                                                      ["day5_image"],
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              : SizedBox(),

                          SizedBox(
                            height: 30,
                          ),

                          galleryList.length > 1
                              ? Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: width * .1,
                                        ),
                                        Text(
                                          "Gallery",
                                          style: TextStyle(
                                              fontSize: 26,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          "No of photos  ",
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                        Container(
                                          height: 25,
                                          width: 25,
                                          decoration: BoxDecoration(
                                              color: Colors.teal,
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          child: Center(
                                            child: Text(
                                              galleryList.length.toString(),
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: width * .1,
                                        ),
                                      ],
                                    ),
                                    SingleChildScrollView(
                                      child: Column(
                                        children: <Widget>[
                                          const SizedBox(height: 20.0),
                                          Container(
                                            height: 300,
                                            color: Colors.white,
                                            padding: const EdgeInsets.all(16.0),
                                            child: Swiper(
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          12.0),
                                                  child: Image.network(
                                                    "https://kabiatravels.com/admin/images/" +
                                                        galleryList[index],
                                                    fit: BoxFit.cover,
                                                  ),
                                                );
                                              },
                                              itemWidth: 300,
                                              itemCount: galleryList.length,
                                              layout: SwiperLayout.STACK,
                                            ),
                                          ),
                                          const SizedBox(height: 20.0),
                                        ],
                                      ),
                                    ),
                                  ],
                                )
                              : SizedBox(),
                          SizedBox(
                            height: 30,
                          ),
                          GestureDetector(
                            onTap: () {
                              // Get.to(() => EmailSender());log
                              if (authController.user == null) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LoginScreen()),
                                );
                              } else {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MyFormScreen()),
                                );
                              }
                              // _showFormDialog(context);
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
                                  'Enquire now',
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
