import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/authController.dart';
import '../bestDeal/bestdealDetail.dart';
import '../exoticLocation/exoticLocationDetail.dart';
import '../weddingDestination/weddingDestiDetail.dart';

class searchPackage extends SearchDelegate {
  double width = Get.width;
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          for (var x in authController.dealsList)
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                //height: 200,
                width: width * .99,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 5,
                        offset:
                            const Offset(0, 0), // changes position of shadow
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
                            borderRadius: BorderRadius.circular(10.0),
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
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(children: [
                        SizedBox(
                          width: width * .52,
                          child: Text(
                            x["PackageType"],
                            style: const TextStyle(color: Colors.teal),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.orange,
                                borderRadius: BorderRadius.circular(18),
                                border: Border.all(
                                    color: Colors.black, width: 0.1)),
                            child: Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(x["discpercent"] + "% off",
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold,
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
                              text: "Rs. " + x['PackagePrice'] + "/",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                              children: <TextSpan>[
                                new TextSpan(
                                    text: x['discprice'],
                                    style: new TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        fontSize: 10,
                                        fontWeight: FontWeight.normal)),
                                new TextSpan(
                                    text: ' person',
                                    style: new TextStyle(
                                        fontSize: 10,
                                        fontWeight: FontWeight.normal)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                print(authController.dealsList.indexOf(x));
                                Get.to(() => BestDealsDetail(),
                                    arguments:
                                        authController.dealsList.indexOf(x));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.orange)),
                                child: const Padding(
                                  padding: EdgeInsets.only(
                                      top: 5, bottom: 5, right: 10, left: 10),
                                  child: const Text(
                                    "Enquire",
                                    style: TextStyle(fontSize: 12),
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
          for (var x in authController.exoticplaceList)
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
                        offset:
                            const Offset(0, 0), // changes position of shadow
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
                          borderRadius: BorderRadius.circular(10.0),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(x["PackageName"],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 20))
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              x["PackageType"],
                              style: const TextStyle(color: Colors.teal),
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
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                              text: "Rs. " + x['PackagePrice'] + "/",
                              style: const TextStyle(
                                  color: Colors.orange,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                              children: <TextSpan>[
                                new TextSpan(
                                    text: x['discprice'],
                                    style: new TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.normal)),
                                new TextSpan(
                                    text: ' person',
                                    style: new TextStyle(
                                        fontSize: 10,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: () {
                                print(
                                    authController.exoticplaceList.indexOf(x));
                                Get.to(() => ExoticLocationDetail(),
                                    arguments: authController.exoticplaceList
                                        .indexOf(x));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.orange)),
                                child: const Padding(
                                  padding: EdgeInsets.only(
                                      top: 5, bottom: 5, right: 10, left: 10),
                                  child: const Text(
                                    "Enquire",
                                    style: TextStyle(fontSize: 12),
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
          for (var x in authController.destinationWeddingList)
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
                        offset:
                            const Offset(0, 0), // changes position of shadow
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
                          borderRadius: BorderRadius.circular(10.0),
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: width * .9,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(x["PackageName"],
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20)),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              x["PackageType"],
                              style: const TextStyle(color: Colors.teal),
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
                      padding: const EdgeInsets.only(left: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                              text: "Rs. " + x['PackagePrice'] + "/",
                              style: const TextStyle(
                                  color: Colors.orange,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                              children: <TextSpan>[
                                new TextSpan(
                                    text: x['discprice'],
                                    style: new TextStyle(
                                        decoration: TextDecoration.lineThrough,
                                        color: Colors.black,
                                        fontSize: 10,
                                        fontWeight: FontWeight.normal)),
                                new TextSpan(
                                    text: ' person',
                                    style: new TextStyle(
                                        fontSize: 10,
                                        color: Colors.black,
                                        fontWeight: FontWeight.normal)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
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
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.orange)),
                                child: const Padding(
                                  padding: EdgeInsets.only(
                                      top: 5, bottom: 5, right: 10, left: 10),
                                  child: const Text(
                                    "Enquire",
                                    style: TextStyle(fontSize: 12),
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
        ]));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Center(
      child: Text("Search Package"),
    );
  }
}
