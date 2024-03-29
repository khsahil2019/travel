import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel/services/apiservice.dart';

import '../../controller/authController.dart';
import '../home/homePage.dart';

// import 'dart:con
// vert';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void initState() {
    // ApiService().logo();
    super.initState();

    // Wait for 3 seconds and then navigate to the next screen
    Future.delayed(Duration(seconds: 3), () {
      Get.offAll(() => const HomePage());
      // Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) => LoginScreen()),
      // );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //  Image.network(
              //               "https://kabiatravels.com/admin/index_images/" +
              //                   authController.indexPageList!["pimg"],
              //               height: 150,
              //               width: 150),
              // authController.logoList!["logo"] != null
              //     ? Image.network(
              //         "https://kabiatravels.com/admin/uploadss/" +
              //             authController.logoList!["logo"],
              //         height: 400,
              //         width: 400)
              //     :
              Image.network(
                  "https://kabiatravels.com/admin/uploadss/Untitled-5.png",
                  height: 400,
                  width: 400),
              // Image.asset(
              //   "assets/img/new_ideadesk.png",
              //   height: 100,
              //   width: 200,
              // ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}
