import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel/controller/authController.dart';
import 'package:travel/ui/bookingReviewPage/payment.dart';

import '../../register/login.dart';
import 'confirmation.dart';

class ReviewDetail extends StatefulWidget {
  const ReviewDetail({Key? key}) : super(key: key);

  @override
  State<ReviewDetail> createState() => _ReviewDetailState();
}

class _ReviewDetailState extends State<ReviewDetail> {
  // get index => null;
  var reviewData = Get.arguments;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 40;

    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: ListView(
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.arrow_back_sharp))
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Text(
                          "Review Your\nBooking",
                          style: TextStyle(
                              fontFamily: "Sail",
                              fontSize: 28,
                              // color: Colors.blue.shade800
                              color: Colors.teal),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    // Text(reviewData.toString()),
                    //for (var x in authController.exoticplaceList)
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      reviewData["PackageName"].toString(),
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                const Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "13 Nov - 18 Nov, 5 nights",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.grey),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "1 Room,2 Adults",
                                      style: TextStyle(
                                          fontSize: 16, color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Container(
                                  width: width * .3,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.amber,
                                    image: DecorationImage(
                                      image: NetworkImage(
                                        "https://kabiatravels.com/admin/packageimage/" +
                                            reviewData["PackageImage"],
                                      ),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Divider(
                          thickness: 2,
                          height: 20,
                        ),
                        Row(
                          children: [
                            SizedBox(
                                width: width * .8,
                                child: Text("Payment Method")),
                            Icon(
                              Icons.add,
                              color: Colors.teal,
                            ),
                            Text(
                              "Add",
                              style: TextStyle(color: Colors.teal),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => PaymentScreen());
                          },
                          child: Container(
                            padding: EdgeInsets.all(8),
                            height: 60,
                            color: Colors.grey.shade200,
                            child: Row(
                              children: [
                                Icon(Icons.payment),
                                SizedBox(
                                  width: width * .2,
                                ),
                                Text("Payment")
                              ],
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 2,
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Rs-280 x 5 nights"),
                            Text("Rs-" + reviewData["PackagePrice"]),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Text("Add coupon",
                                style: TextStyle(color: Colors.teal))
                          ],
                        ),
                        Divider(
                          height: 40,
                          thickness: 2,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("Total (USD)"), Text("Rs-1400")],
                        ),
                        SizedBox(
                          height: 80,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.to(() => LoginScreen());
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
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.orange,
                              // color: Colors.blue.shade800,
                            ),
                            child: Center(
                              child: Text(
                                'Confirm Booking',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 250,
                        )
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
