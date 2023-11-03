// import 'dart:html';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'dart:developer';
import 'package:drop_shadow_image/drop_shadow_image.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:travel/helper/snackbar.dart';
import 'package:travel/services/apiservice.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:device_info_plus/device_info_plus.dart';
import '../../controller/authController.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

import '../../register/login.dart';
import '../WebServices/bus.dart';
import '../WebServices/flight.dart';
import '../WebServices/hotel.dart';
import '../WebServices/liveTrainStatus.dart';
import '../WebServices/manage.dart';
import '../WebServices/train.dart';
import '../WebServices/visa.dart';
import '../WebServices/webCheckIn.dart';
import '../bestDeal/bestdealDetail.dart';
import '../bestDeal/bestdealPage.dart';
import '../designPackage/planForMe.dart';
import '../exoticLocation/exoticLocationDetail.dart';
import '../exoticLocation/exoticLocationPage.dart';
import '../policy/privacyPolicy.dart';
import '../serach/serach.dart';
import '../weddingDestination/weddingDestiDetail.dart';
import '../weddingDestination/weddingdestiPage.dart';
import 'enquiry/enquiryEmail.dart';

class HomePage extends StatefulWidget {
  const HomePage() : super();

  @override
  State<HomePage> createState() => _HomePageState();
}

int selectedId = 2;

class _HomePageState extends State<HomePage> {
  bool isPlan = false;
  int index = 0;
  double _value = 0;
  final double _min = 500;
  final double _max = 50000;
  final List reviewList1 = [
    for (var x in authController.reviewList)
      Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(x["comment"].toString()),
              SizedBox(
                height: 10,
              ),
              Text(x["name"].toString(),
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Colors.teal,
                      fontWeight: FontWeight.bold)),
              SizedBox(
                height: 5,
              ),
              Text(x["location"].toString(),
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.orange,
                  )),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     Image.network(
              //       "https://kabiatravels.com/admin/uploadss/" +
              //           authController.logoList!["logo"],
              //       height: 100,
              //       width: 100,
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
  ];
  Future<void>? _launched;
  String? _phone = '';
  bool _hasCallSupport = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController commentController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  Future<void> _launchInWebViewOrVC(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(
          headers: <String, String>{'my_header_key': 'my_header_value'}),
    )) {
      throw Exception('Could not launch $url');
    }
  }

  final Uri manage = Uri(
      scheme: 'https', host: 'kabiatravels.com', path: '/customer-login.php');
  final Uri flight =
      Uri(scheme: 'https', host: 'kabiatravels.com', path: '/flight.php');
  final Uri live = Uri(
      scheme: 'https', host: 'www.railyatri.in', path: '/live-train-status');
  final Uri train =
      Uri(scheme: 'https', host: 'www.irctc.co.in', path: 'nget/train-search/');
  final Uri hotel =
      Uri(scheme: 'https', host: 'kabiatravels.com', path: '/Rooms.php');
  final Uri bus =
      Uri(scheme: 'https', host: 'kabiatravels.com', path: '/bus.php');
  final Uri visa =
      Uri(scheme: 'https', host: 'kabiatravels.com', path: '/visa.php');
  final Uri webcheck =
      Uri(scheme: 'https', host: 'kabiatravels.com', path: '/web-check.php');
  Widget build(BuildContext context) {
    // final Uri flight =
    //     Uri(scheme: 'https', host: 'kabiatravels.com', path: '/flight.php');
    // final Uri train = Uri(
    //     scheme: 'https', host: 'www.irctc.co.in', path: 'nget/train-search/');
    // final Uri hotel =
    //     Uri(scheme: 'https', host: 'kabiatravels.com', path: '/Rooms.php');
    // final Uri bus =
    //     Uri(scheme: 'https', host: 'kabiatravels.com', path: '/bus.php');
    // final Uri visa =
    //     Uri(scheme: 'https', host: 'kabiatravels.com', path: '/visa.php');
    // final Uri webcheck =
    //     Uri(scheme: 'https', host: 'kabiatravels.com', path: '/web-check.php');

    // log(authController.)
    // log("asdfaf" + authController.user.toString());
    log("Exotic place :" + authController.exoticplaceList.toString());
    log("index : " + authController.indexPageList.toString());
    log("Deals : " + authController.dealsList.toString());
    log("logo : " + authController.logoList.toString());
    log("DestinationWedding : " +
        authController.destinationWeddingList.toString());
    log("Review : " + authController.reviewList.toString());
    // log("privacy " + authController.privacyList.toString());

    // ignore: unused_local_variable
    double width = MediaQuery.of(context).size.width - 40;
    // var x = authController.dealsList.length.toInt();
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
                Icons.logout,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  authController.getLogout();
                });
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.manage_history,
                color: Colors.black,
              ),
              onPressed: () {
                Get.to(() => ManageScreen());
              },
            ),
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () {
                showSearch(context: context, delegate: searchPackage());
              },
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
                        Image.network(
                            "https://kabiatravels.com/admin/uploadss/" +
                                authController.logoList!["logo"],
                            height: 150,
                            width: 150),
                        Image.network(
                            "https://kabiatravels.com/admin/index_images/" +
                                authController.indexPageList!["pimg"],
                            height: 150,
                            width: 150),
                      ],
                    ),
                    Image.asset("assets/img/plane.png"),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Get.to(() => PlanForMe());
                            },
                            child: buttonOrange("Design Package for me")),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),

                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                        width: width * .7,
                        child: Text(
                          authController.indexPageList!['p5'].toString(),
                          textAlign: TextAlign.center,
                          style:
                              const TextStyle(color: Colors.teal, fontSize: 14),
                        )),

                    const SizedBox(
                      height: 30,
                    ),

                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //flight//
                          GestureDetector(
                            onTap: () {
                              Get.to(() => FlightScreen());
                            },
                            child: Column(
                              children: [
                                Image.network(
                                    "https://kabiatravels.com/admin/index_images/" +
                                        authController.indexPageList!["icon5"],
                                    height: 100,
                                    width: 100),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                    authController.indexPageList!["iconh5"]
                                        .toString(),
                                    style: const TextStyle(
                                        color: Colors.teal,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                          ),

                          //train

                          //hotel
                          GestureDetector(
                            onTap: () {
                              Get.to(() => HotelScreen());
                            },
                            child: Column(
                              children: [
                                Image.network(
                                    "https://kabiatravels.com/admin/index_images/" +
                                        authController.indexPageList!["icon4"],
                                    height: 100,
                                    width: 100),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                    authController.indexPageList!["iconh4"]
                                        .toString(),
                                    style: const TextStyle(
                                        color: Colors.teal,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(() => BestDeals());
                            },
                            child: Column(
                              children: [
                                Image.network(
                                    "https://kabiatravels.com/admin/index_images/" +
                                        authController.indexPageList!["icon1"],
                                    height: 100,
                                    width: 100),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                    authController.indexPageList!["iconh1"]
                                        .toString(),
                                    style: const TextStyle(
                                        color: Colors.teal,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                          ),
                          //Exotic
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ExoticLocationScreen()),
                              );
                            },
                            child: Column(
                              children: [
                                Image.network(
                                    "https://kabiatravels.com/admin/index_images/" +
                                        authController.indexPageList!["icon2"],
                                    height: 100,
                                    width: 100),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text(
                                    authController.indexPageList!["iconh2"]
                                        .toString(),
                                    style: const TextStyle(
                                        color: Colors.teal,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                          ),
                          //wedding
                          GestureDetector(
                            onTap: () {
                              // _showToast(context);
                              Get.to(() => WeddingDestinationScreen());
                            },
                            child: Column(
                              children: [
                                Image.network(
                                    "https://kabiatravels.com/admin/index_images/" +
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
                                    style: const TextStyle(
                                        color: Colors.teal,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                          ),
                          //bus
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          //train
                          GestureDetector(
                            onTap: () {
                              Get.to(() => TrainScreen());
                            },
                            child: Column(
                              children: [
                                authController.indexPageList!["Icon6"] != null
                                    ? Image.network(
                                        //  "https://kabiatravels.com/admin/index_images/Untitled%20design.png",
                                        "https://kabiatravels.com/admin/index_images/" +
                                            authController
                                                .indexPageList!["Icon6"],
                                        height: 100,
                                        width: 90)
                                    : Image.network(
                                        "https://kabiatravels.com/admin/index_images/Untitled%20design.png",
                                        // "https://kabiatravels.com/admin/index_images/" +
                                        //     authController
                                        //         .indexPageList!["Icon6"],
                                        height: 100,
                                        width: 90),
                                const SizedBox(
                                  height: 10,
                                ),
                                authController.indexPageList!["iconh6"] != null
                                    ? Text(
                                        authController.indexPageList!["iconh6"]
                                            .toString(),
                                        // "Train",
                                        style: const TextStyle(
                                            color: Colors.teal,
                                            fontWeight: FontWeight.bold))
                                    : SizedBox(),
                              ],
                            ),
                          ),

                          //wedding
                          //bus
                          GestureDetector(
                            onTap: () {
                              Get.to(() => BusScreen());
                            },
                            child: Column(
                              children: [
                                Image.network(
                                    "https://kabiatravels.com/admin/index_images/" +
                                        authController.indexPageList!["icon7"],
                                    height: 85,
                                    width: 100),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                    authController.indexPageList!["iconh7"]
                                        .toString(),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.teal,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          //visa
                          GestureDetector(
                            onTap: () {
                              Get.to(() => VisaScreen());
                              // setState(() {
                              //   //_showToast(context);
                              //   _launched = _launchInWebViewOrVC(visa);
                              // });
                            },
                            child: Column(
                              children: [
                                Image.network(
                                    "https://kabiatravels.com/admin/index_images/" +
                                        authController.indexPageList!["icon8"],
                                    height: 85,
                                    width: 100),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                    authController.indexPageList!["iconh8"]
                                        .toString(),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.teal,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          //web-checkin
                          GestureDetector(
                            onTap: () {
                              Get.to(() => WebCheckInScreen());
                              // setState(() {
                              //   // _showToast(context);
                              //   _launched = _launchInWebViewOrVC(webcheck);
                              // });
                            },
                            child: Column(
                              children: [
                                Image.network(
                                    "https://kabiatravels.com/admin/index_images/" +
                                        authController.indexPageList!["icon9"],
                                    height: 85,
                                    width: 100),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                    authController.indexPageList!["iconh9"]
                                        .toString(),
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.teal,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          /*live status*/
                          GestureDetector(
                            onTap: () {
                              Get.to(() => LiveTrainStatusScreen());
                              // setState(() {
                              //   // _showToast(context);
                              //   _launched = _launchInWebViewOrVC(live);
                              // });
                            },
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/img/live.png",
                                  width: 75,
                                  height: 85,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text("live status",
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: Colors.teal,
                                        fontWeight: FontWeight.bold))
                              ],
                            ),
                          ),
                        ],
                      ),
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
                              width: width * .58,
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
                              width: width * .55,
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
                    SizedBox(
                      height: 50,
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
                                    color: Colors.black, fontSize: 22),
                                children: <TextSpan>[
                                  new TextSpan(
                                      text: 'Best Deal',
                                      style: new TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
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
                          for (var x in authController.dealsList.reversed)
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: GestureDetector(
                                onTap: () {
                                  print(authController.dealsList.indexOf(x));
                                  Get.to(() => BestDealsDetail(),
                                      arguments:
                                          authController.dealsList.indexOf(x));
                                },
                                child: Container(
                                  width: width * .8,
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
                                              image: new DecorationImage(
                                                  image: NetworkImage(
                                                    "https://kabiatravels.com/admin/packageimage/" +
                                                        x["PackageImage"],
                                                  ),
                                                  fit: BoxFit.cover)),
                                          child: Image.network(
                                              "https://kabiatravels.com/admin/packageimage/" +
                                                  x["PackageImage"],
                                              height: 130,
                                              width: width * .7),
                                        ),
                                      ),

                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Row(children: [
                                          SizedBox(
                                            width: width * .52,
                                            child: Text(
                                              x["PackageType"],
                                              style: const TextStyle(
                                                  color: Colors.teal),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(3.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.orange,
                                                  borderRadius:
                                                      BorderRadius.circular(18),
                                                  border: Border.all(
                                                      color: Colors.black,
                                                      width: 0.1)),
                                              child: Padding(
                                                padding: EdgeInsets.all(4.0),
                                                child: Text(
                                                    x["discpercent"] + "% off",
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
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Row(
                                          //mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                                width: width * .5,
                                                child: Text(
                                                  x['PackageName'],
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 16),
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
                                          //mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            // SizedBox(
                                            //   width: 10,
                                            // ),
                                            const Icon(
                                              Icons.location_on,
                                              color: Colors.grey,
                                              size: 14,
                                            ),
                                            SizedBox(
                                                width: width * .5,
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
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            RichText(
                                              text: new TextSpan(
                                                text: "Rs. " +
                                                    x['discprice'] +
                                                    "/",
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                children: <TextSpan>[
                                                  new TextSpan(
                                                      text: x['PackagePrice'],
                                                      style: new TextStyle(
                                                          decoration:
                                                              TextDecoration
                                                                  .lineThrough,
                                                          fontSize: 10,
                                                          fontWeight: FontWeight
                                                              .normal)),
                                                  new TextSpan(
                                                      text: ' person',
                                                      style: new TextStyle(
                                                          fontSize: 10,
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
                                                  // Get.to(() => LoginScreen());

                                                  if (authController.user ==
                                                      null) {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              LoginScreen()),
                                                    );
                                                  } else {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              MyFormScreen()),
                                                    );
                                                  }
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

                    const SizedBox(
                      height: 50,
                    ),

                    GestureDetector(
                        onTap: () {
                          Get.to(() => BestDeals());
                        },
                        child: button("See All")),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {},
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
//Exotic start

//Exotic ends
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (var x in authController.exoticplaceList.reversed)
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: GestureDetector(
                                onTap: () {
                                  print(authController.exoticplaceList
                                      .indexOf(x));
                                  Get.to(() => ExoticLocationDetail(),
                                      arguments: authController.exoticplaceList
                                          .indexOf(x));
                                },
                                child: Container(
                                  width: width * .8,
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
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
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
                                              height: 130,
                                              width: width * .7),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Row(
                                          // mainAxisAlignment:
                                          //     MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                                width: width * .35,
                                                child: Text(
                                                  x['PackageName'],
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        //mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Icon(
                                            Icons.location_on,
                                            color: Colors.grey,
                                            size: 14,
                                          ),
                                          SizedBox(
                                              width: width * .5,
                                              child: Text(
                                                x['PackageLocation'],
                                                style: const TextStyle(
                                                    fontSize: 10),
                                              )),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            RichText(
                                              text: new TextSpan(
                                                text: 'Rs ' +
                                                    x["PackagePrice"] +
                                                    '',
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                children: <TextSpan>[
                                                  new TextSpan(
                                                      text: '',
                                                      style: const TextStyle(
                                                          fontSize: 10,
                                                          fontWeight: FontWeight
                                                              .normal)),
                                                ],
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                if (authController.user ==
                                                    null) {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            LoginScreen()),
                                                  );
                                                } else {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            MyFormScreen()),
                                                  );
                                                }
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    border: Border.all(
                                                        color: Colors.teal)),
                                                child: const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 5,
                                                      bottom: 5,
                                                      right: 10,
                                                      left: 10),
                                                  child: const Text(
                                                    "Enquire",
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
                              ),
                            )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                        onTap: () {
                          Get.to(() => ExoticLocationScreen());
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
                          onTap: () {},
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
                      child: Row(
                        children: [
                          for (var x
                              in authController.destinationWeddingList.reversed)
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: GestureDetector(
                                onTap: () {
                                  print(authController.destinationWeddingList
                                      .indexOf(x));
                                  Get.to(() => WeddingDestinationDetailScreen(),
                                      arguments: authController
                                          .destinationWeddingList
                                          .indexOf(x));
                                },
                                child: Container(
                                  width: width * .8,
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
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
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
                                              height: 130,
                                              width: width * .7),
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 15),
                                        child: Row(
                                          // mainAxisAlignment:
                                          //     MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                                width: width * .5,
                                                child: Text(
                                                  x['PackageName'],
                                                  style: const TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold),
                                                )),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        //mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          const SizedBox(
                                            width: 10,
                                          ),
                                          const Icon(
                                            Icons.location_on,
                                            color: Colors.grey,
                                            size: 14,
                                          ),
                                          SizedBox(
                                              width: width * .5,
                                              child: Text(
                                                x['PackageLocation'],
                                                style: const TextStyle(
                                                    fontSize: 10),
                                              )),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(10.0),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            RichText(
                                              text: new TextSpan(
                                                text: 'Rs ' +
                                                    x["PackagePrice"] +
                                                    '',
                                                style: const TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                children: <TextSpan>[
                                                  new TextSpan(
                                                      text: '',
                                                      style: const TextStyle(
                                                          fontSize: 10,
                                                          fontWeight: FontWeight
                                                              .normal)),
                                                ],
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                if (authController.user ==
                                                    null) {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            LoginScreen()),
                                                  );
                                                } else {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            MyFormScreen()),
                                                  );
                                                }
                                              },
                                              child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    border: Border.all(
                                                        color: Colors.teal)),
                                                child: const Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 5,
                                                      bottom: 5,
                                                      right: 10,
                                                      left: 10),
                                                  child: const Text(
                                                    "Enquire",
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
                              ),
                            )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    const SizedBox(
                      height: 30,
                    ),
                    GestureDetector(
                        onTap: () {
                          Get.to(() => WeddingDestinationScreen());
                          // SnackBar(content: Text("Under working"));
                        },
                        child: button("See All")),
                    /*comment*/

                    /*End wedding destination*/
                    /*Hotel rooms */
                    const SizedBox(
                      height: 30,
                    ),

                    const SizedBox(
                      height: 30,
                    ),
                    Image.asset("assets/img/plane.png"),

                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Image.asset("assets/img/fifth.png",
                                height: 150, width: 125),
                          ],
                        ),
                        SizedBox(width: 5),
                        Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "Our Testimonials",
                                    style: const TextStyle(
                                        color: Colors.teal,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Image.asset(
                                    "assets/img/badge.png",
                                    height: 30,
                                    width: 30,
                                  )
                                ],
                              ),
                              const SizedBox(height: 10),
                              RichText(
                                //textAlign: TextAlign.center,
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
                                            color: Colors.teal,
                                            fontSize: 14)),
                                  ],
                                ),
                              ),
                            ])
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Customers Review",
                          style: TextStyle(fontSize: 16),
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Icon(
                          Icons.star_half,
                          color: Colors.yellow,
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
                              itemBuilder: (BuildContext context, int index) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: reviewList1[index],
                                );
                              },
                              itemWidth: 300,
                              itemCount: authController.reviewList.length,
                              layout: SwiperLayout.STACK,
                            ),
                          ),
                          const SizedBox(height: 20.0),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.swipe,
                          size: 50,
                          color: Colors.teal,
                        ),
                      ],
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                    ),

                    //comment
                  ],
                )
              ])),
        ]));
  }

  Widget search(double width) {
    return Container(
      //  margin: EdgeInsets.all(10),
      // height: 150,
      // width: 900,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.teal,
        ),
        borderRadius: BorderRadius.circular(79),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Row(children: [
          Column(
            children: [
              Text(
                "Destination",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.teal,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                width: width * .4,
                child: TextField(
                  enabled: true,
                  // controller: destinationCtrl,
                  decoration: const InputDecoration(
                      hintText: 'Enter Destination',
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal),
                      ),
                      enabledBorder: UnderlineInputBorder()),
                ),
              ),
            ],
          ),
          SizedBox(width: 20),
          Container(color: Colors.teal, width: 2, height: 70),
          SizedBox(width: 20),
          Column(
            children: [
              Text(
                "No. of Pax",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.teal,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                width: width * .4,
                child: TextField(
                  enabled: true,
                  // controller: destinationCtrl,
                  decoration: const InputDecoration(
                      hintText: 'Enter Destination',
                      border: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.teal)),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.teal),
                      ),
                      enabledBorder: UnderlineInputBorder()),
                ),
              ),
            ],
          ),
          //Divider(),
          SizedBox(width: 20),
          Container(color: Colors.teal, width: 2, height: 70),
          SizedBox(width: 20),
          Column(
            children: [
              Text(
                "Price Range : 500 to 50,000",
                style: TextStyle(
                    fontSize: 14,
                    color: Colors.teal,
                    fontWeight: FontWeight.bold),
              ),
              Container(
                width: width * .6,
                child: SfSlider(
                  activeColor: Colors.orange,
                  value: _value,
                  min: _min,
                  max: _max,
                  interval: 15000,
                  showTicks: true,
                  showLabels: true,
                  // numberFormat: NumberFormat("\$"),
                  //  value: _value,
                  // interval: 100.00,
                  // showLabels: true,
                  onChanged: (dynamic newValue) {
                    setState(() {
                      _value = newValue;
                      _value.toInt();
                    });
                  },
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Rs : ${_value.toInt()}",
                style: TextStyle(fontSize: 12, color: Colors.orange),
              ),
            ],
          ),
          SizedBox(width: 20),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.orange),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 10, right: 30, left: 30),
                  child: Text(
                    "Search",
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          )
        ]),
      ),
    );
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

  Widget buttonOrange(String text) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.orange),
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
                color: const Color.fromARGB(255, 230, 220, 220),
              ),
              // accountName: Text("skj"),

              accountName:

                  //  authController.user != null &&
                  //         authController.user!["Name"] != "null"
                  //     ? Text(authController.user!["Name"].toString()):
                  Text(
                "Welcome!",
                style: TextStyle(color: Colors.black),
              ),
              accountEmail: authController.user != null
                  // ||
                  //         authController.user!["EmailId"] == ""
                  ? Text(authController.user!["EmailId"].toString(),
                      style: TextStyle(color: Colors.black))
                  : GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()),
                        );
                      },
                      child:
                          Text("Login", style: TextStyle(color: Colors.black))),
              // accountEmail: Text(authController.user!["EmailId"].toString()),
              currentAccountPicture: Image.network(
                authController.logoList != null
                    ? "https://kabiatravels.com/admin/uploadss/" +
                        authController.logoList!["logo"]
                    : "",
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.home,
                color: Colors.red,
              ),
              // shape: Border.all(color: Colors.red),
              title: Text('Home'),
              onTap: () {
                // Get.to(HomePage())!.then((value) => Navigator.pop(context));
                Navigator.pop(context);
              },
            ),
            // Divider(
            //   thickness: 1,
            //   color: Colors.grey,
            // ),
            // Text(authController.user!["Password"].toString(),
            //     style: TextStyle(color: Colors.black)),

            ListTile(
              leading: Icon(
                Icons.place,
                color: Colors.teal,
              ),
              shape: Border.all(color: Colors.teal),
              // shape: Border
              //.all(color: Colors.black),
              title: Text('Exotic Place'),
              onTap: () {
                Get.to(ExoticLocationScreen())!
                    .then((value) => Navigator.pop(context));
                // Navigator.pop(context);
              },
            ),
            // Divider(
            //   thickness: 1,
            //   color: Colors.grey,
            // ),
            ListTile(
              leading: Icon(
                Icons.local_offer,
                color: Colors.red,
              ),
              shape: Border.all(color: Colors.teal),
              title: Text('Best Deals'),
              onTap: () {
                Get.to(BestDeals())!.then((value) => Navigator.pop(context));
              },
            ),
            // Divider(
            //   thickness: 1,
            //   color: Colors.grey,
            // ),

            ListTile(
              leading: Icon(
                Icons.heat_pump_rounded,
                color: Colors.teal,
              ),
              shape: Border.all(color: Colors.teal),
              title: Text('Destination Wedding'),
              onTap: () {
                Get.to(WeddingDestinationScreen())!
                    .then((value) => Navigator.pop(context));
                // Navigator.pop(context);
              },
            ),
            // Divider(
            //   thickness: 1,
            //   color: Colors.grey,
            // ),

            ListTile(
              leading: Icon(
                Icons.flight,
                color: Colors.red,
              ),
              shape: Border.all(color: Colors.teal),
              title: Text('Flights'),
              onTap: () {
                Get.to(() => FlightScreen());
                // setState(() {
                //   _launched = _launchInWebViewOrVC(flight);
                // });
              },
            ),
            // Divider(
            //   thickness: 1,
            //   color: Colors.grey,
            // ),

            ListTile(
              leading: Icon(
                Icons.hotel,
                color: Colors.teal,
              ),
              shape: Border.all(color: Colors.teal),
              title: Text('Hotels'),
              onTap: () {
                Get.to(() => HotelScreen());
              },
            ),
            // Divider(
            //   thickness: 1,
            //   color: Colors.grey,
            // ),

            ListTile(
              leading: Icon(
                Icons.bus_alert,
                color: Colors.red,
              ),
              shape: Border.all(color: Colors.teal),
              title: Text('Bus'),
              onTap: () {
                Get.to(() => BusScreen());
              },
            ),
            ListTile(
              leading: Icon(
                Icons.train,
                color: Colors.teal,
              ),
              shape: Border.all(color: Colors.teal),
              title: Text('Train'),
              onTap: () {
                Get.to(() => TrainScreen());
              },
            ),
            ListTile(
              leading: Icon(
                Icons.card_giftcard,
                color: Colors.red,
              ),
              shape: Border.all(color: Colors.teal),
              title: Text('Visa'),
              onTap: () {
                Get.to(() => VisaScreen());
              },
            ),
            ListTile(
              leading: Icon(
                Icons.train_outlined,
                color: Colors.teal,
              ),
              shape: Border.all(color: Colors.teal),
              title: Text('Live status'),
              onTap: () {
                Get.to(() => LiveTrainStatusScreen());
              },
            ),
            ListTile(
              leading: Icon(
                Icons.manage_history,
                color: Colors.red,
              ),
              shape: Border.all(color: Colors.teal),
              title: Text('Manage option'),
              onTap: () {
                Get.to(() => ManageScreen());
              },
            ),
            // Divider(
            //   thickness: 0.5,
            //   color: Colors.grey,
            // ),
            ListTile(
              leading: Icon(
                Icons.policy,
                color: Colors.teal,
              ),
              shape: Border.all(color: Colors.teal),
              title: Text(
                "Privacy Policy",
              ),
              onTap: () {
                Get.to(PrivacyPolicy())!
                    .then((value) => Navigator.pop(context));
                // Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(
                Icons.delete_sharp,
                color: Colors.red,
              ),
              shape: Border.all(color: Colors.teal),
              title: Text(
                "Delete Account",
              ),

              onTap: () {
                // ApiService()
                //     .deleteAccount(emailController.text, passController.text);
                if (authController.user != null) {
                  ApiService().deleteAccount(
                      authController.user!["EmailId"].toString(),
                      authController.user!["Password"].toString());

                  authController.getLogout2();

                  log("Deleted Successful");
                } else {
                  log("Account Deletion failed");
                  showSnakbar(
                      "Account Deletion failed", "Something went wrong");
                }
                // Get.to(PrivacyPolicy())!
                //     .then((value) => Navigator.pop(context));
                // Navigator.pop(context);
              },
              // subtitle: Text('Item description'),
              //trailing: Icon(Icons.more_vert),
              // shape: Border.all(color: Colors.black),
              // title: Text('FAQ'),
            ),
            // Divider(
            //   thickness: 1,
            //   color: Colors.grey,
            // ),

            // Center(child: Text("Legals")),
            SizedBox(
              height: 10,
            ),
            // Expanded(child: Text(authController.user!["Password"].toString())),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(width: 10),
                Image.network(
                    authController.logoList != null
                        ? "https://kabiatravels.com/admin/uploadss/" +
                            authController.logoList!["logo"]
                        : "",
                    height: 50,
                    width: 50),
                SizedBox(width: 10),
                Expanded(
                  child: Text(authController.indexPageList!["p1"],
                      style: TextStyle(fontSize: 14, color: Colors.orange)),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 10,
                ),
                SizedBox(
                  width: 10,
                ),
                // Icon(
                //   Icons.contact_support,
                //   color: Colors.grey,
                // ),
                Expanded(
                  child: Text(
                    "Contact No:\n" + authController.indexPageList!["p2"],
                    style: TextStyle(fontSize: 14, color: Colors.teal),
                  ),
                ),
                //SizedBox(width: 10),
              ],
            ),
            SizedBox(
              height: 15,
            ),

            // Center(child: Text(Platform.isAndroid.toString()))
          ],
        ),
      ),
    );
  }
}
