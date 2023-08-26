import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel/ui/bestDeal/bestdealPage.dart';
import 'package:travel/ui/home/homePage.dart';
import 'dart:io';

import '../controller/authController.dart';
import '../helper/show_loading.dart';
import '../helper/snackbar.dart';
import '../register/login.dart';
import '../ui/bookingReviewPage/bookingReviewScreen.dart';
import '../ui/bookingReviewPage/confirmation.dart';

class ApiService {
  final baseUrl = "kabiatravels.com";
  final _header = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  List<BestDeals> results = [];
  String fetchUrl = "https://kabiatravels.com/api/Deals.php";
  // Future<Response> logout(String accessToken) async {
  //   try {
  //     Response response = await _dio.get(
  //       'https://api.loginradius.com/identity/v2/auth/access_token/InValidate',
  //       queryParameters: {'apikey': ApiSecret.apiKey},
  //       options: Options(
  //         headers: {'Authorization': 'Bearer $accessToken'},
  //       ),
  //     );
  //     return response.data;
  //   } on DioError catch (e) {
  //     return e.response!.data;
  //   }
  // }

  Future<Map?> logIn(
    String email,
    String pass,
  ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool rememberMe = GetStorage().read('remember_me') ?? false;
    showLoading();
    if (rememberMe) {
      await prefs.setString('email', email);
      await prefs.setString('password', pass);
    }
    var client = http.Client();
    Uri uri = Uri.https(baseUrl, 'api/login.php');
    log("uri: " + uri.toString());

    try {
      var _body = json.encode({"email": email, "password": pass});
      log("body: " + _body);
      var response = await client.post(uri, headers: _header, body: _body);
      Map<String, dynamic> _res = jsonDecode(response.body);
      log("response: " + _res.toString());
      log("status code" + response.statusCode.toString());
      if (response.statusCode == 200) {
        dismissLoadingWidget();
        if (_res["status"] == 1) {
          log("Log in success");
          authController.user = _res["data"];

          Get.to(BookingConfirmationScreen());
          //  Get.to(HomePage());
          showSnakbar("Welcome !", "Login Successful");
        } else {
          log("log in failed");
          showSnakbar("Error !", "Email and Password invalid");
        }
      }

      return null;
    } on SocketException catch (e) {
      dismissLoadingWidget();
      // showToastMessage("No Internet Connection", Icons.error);
      log("no internet catch: " + e.toString());
      return null;
    } catch (e) {
      dismissLoadingWidget();
      // showToastMessage(e.toString(), Icons.error);
      log("error catch: " + e.toString());
      return null;
    }
  }

  Future<Map?> Signup(
      String username, String email, String mobile, String password) async {
    showLoading();
    var client = http.Client();
    Uri uri = Uri.https(baseUrl, 'api/signup.php');
    log("uri: " + uri.toString());

    try {
      var _body = json.encode({
        'username': username,
        'email': email,
        'mobile': mobile,
        'password': password,
      });
      log("body: " + _body);
      var response = await client.post(uri, headers: _header, body: _body);
      Map<String, dynamic> _res = jsonDecode(response.body);
      log("response: " + _res.toString());
      log("status code" + response.statusCode.toString());
      if (response.statusCode == 200) {
        dismissLoadingWidget();
        if (_res["status"] == 1) {
          log("signup in success");
          showSnakbar("Congratulation !", "Signup successful");
          //  authController.fulldata = _res["data"];
          Get.offAll(LoginScreen());

          //    authController.user = _res["data"];
          // Get.offAll(logIn(
          //     authController.user.toString(), authController.user.toString()));
        } else {
          log("Mobile Number Or Email already registered");
          showSnakbar(
              "Try Again !", "Mobile Number or Email already registered");
        }
      }

      // showBottomToast("Error", error.msg.toString());
      // showToastMessage(error.msg, Icons.error);

      // log("error: " + error.msg.toString());
      // return userdata;
      return null;
    } on SocketException catch (e) {
      dismissLoadingWidget();
      // showToastMessage("No Internet Connection", Icons.error);
      log("no internet catch: " + e.toString());
      return null;
    } catch (e) {
      dismissLoadingWidget();
      // showToastMessage(e.toString(), Icons.error);
      log("error catch: " + e.toString());
      return null;
    }
  }

  // Future<Map?> Signup(Map<String, dynamic>? userdata) async {
  //   showLoading();
  //   var client = http.Client();
  //   Uri uri = Uri.https(baseUrl, 'api/signup.php');
  //   log("uri: " + uri.toString());

  //   try {
  //     var _body = json.encode({userdata});
  //     log("body: " + _body);
  //     var response = await client.post(uri, headers: _header, body: _body);
  //     Map<String, dynamic> _res = jsonDecode(response.body);
  //     log("response: " + _res.toString());
  //     log("status code" + response.statusCode.toString());
  //     if (response.statusCode == 200) {
  //       dismissLoadingWidget();
  //       if (_res["status"] == 1) {
  //         log("signup in success");
  //         //    authController.user = _res["data"];
  //         // Get.offAll(logIn(
  //         //     authController.user.toString(), authController.user.toString()));
  //       } else {
  //         log("Mobile Number Or Email already registered");
  //       }
  //     }

  //     // showBottomToast("Error", error.msg.toString());
  //     // showToastMessage(error.msg, Icons.error);

  //     // log("error: " + error.msg.toString());
  //     // return userdata;
  //     return null;
  //   } on SocketException catch (e) {
  //     dismissLoadingWidget();
  //     // showToastMessage("No Internet Connection", Icons.error);
  //     log("no internet catch: " + e.toString());
  //     return null;
  //   } catch (e) {
  //     dismissLoadingWidget();
  //     // showToastMessage(e.toString(), Icons.error);
  //     log("error catch: " + e.toString());
  //     return null;
  //   }
  // }

  Future<List<dynamic>> exoticLocation() async {
    //showLoading();
    var client = http.Client();
    Uri uri = Uri.https(baseUrl, 'api/exoticlocations.php');
    log("uri: " + uri.toString());

    try {
      var response = await client.post(uri, headers: _header, body: null);
      Map<String, dynamic> _res = jsonDecode(response.body);
      // log("response: " + _res.toString());
      log("status code" + response.statusCode.toString());
      if (response.statusCode == 200) {
        dismissLoadingWidget();
        if (_res["status"] == 1) {
          return _res['data'];
        } else {
          return [];
        }
      }

      return [];
    } on SocketException catch (e) {
      dismissLoadingWidget();
      // showToastMessage("No Internet Connection", Icons.error);
      log("no internet catch: " + e.toString());
      return [];
    } catch (e) {
      dismissLoadingWidget();
      // showToastMessage(e.toString(), Icons.error);
      log("error catch: " + e.toString());
      return [];
    }
  }

  // Future<List<dynamic>> deals(String? query) async {
  Future<List<dynamic>> deals() async {
    //showLoading();
    var client = http.Client();
    Uri uri = Uri.https(baseUrl, 'api/Deals.php');
    log("uri: " + uri.toString());

    try {
      var response = await client.post(uri, headers: _header, body: null);
      Map<String, dynamic> _res = jsonDecode(response.body);
      // log("response: " + _res.toString());
      log("status code" + response.statusCode.toString());
      if (response.statusCode == 200) {
        dismissLoadingWidget();
        // if ( query!=null) {
        //     results = results.where((element) => element.)
        //   }
        if (_res["status"] == 1) {
          return _res['data'];
        } else {
          return [];
        }
      }

      return [];
    } on SocketException catch (e) {
      dismissLoadingWidget();
      // showToastMessage("No Internet Connection", Icons.error);
      log("no internet catch: " + e.toString());
      return [];
    } catch (e) {
      dismissLoadingWidget();
      // showToastMessage(e.toString(), Icons.error);
      log("error catch: " + e.toString());
      return [];
    }
  }

  Future<Map> indexPage() async {
    //showLoading();
    var client = http.Client();
    Uri uri = Uri.https(baseUrl, 'api/indexpage.php');
    log("uri: " + uri.toString());

    try {
      var response = await client.post(uri, headers: _header, body: null);
      Map<String, dynamic> _res = jsonDecode(response.body);
      // log("response: " + _res.toString());
      log("status code" + response.statusCode.toString());
      if (response.statusCode == 200) {
        dismissLoadingWidget();
        if (_res["status"] == 1) {
          return _res['data'];
        } else {
          return {};
        }
      }

      return {};
    } on SocketException catch (e) {
      dismissLoadingWidget();
      // showToastMessage("No Internet Connection", Icons.error);
      log("no internet catch: " + e.toString());
      return {};
    } catch (e) {
      dismissLoadingWidget();
      // showToastMessage(e.toString(), Icons.error);
      log("error catch: " + e.toString());
      return {};
    }
  }

  Future<Map> logo() async {
    //showLoading();
    var client = http.Client();
    Uri uri = Uri.https(baseUrl, 'api/logo.php');
    log("uri: " + uri.toString());

    try {
      var response = await client.post(uri, headers: _header, body: null);
      Map<String, dynamic> _res = jsonDecode(response.body);
      // log("response: " + _res.toString());
      log("status code" + response.statusCode.toString());
      if (response.statusCode == 200) {
        dismissLoadingWidget();
        if (_res["status"] == 1) {
          return _res['data'];
        } else {
          return {};
        }
      }

      return {};
    } on SocketException catch (e) {
      dismissLoadingWidget();
      // showToastMessage("No Internet Connection", Icons.error);
      log("no internet catch: " + e.toString());
      return {};
    } catch (e) {
      dismissLoadingWidget();
      // showToastMessage(e.toString(), Icons.error);
      log("error catch: " + e.toString());
      return {};
    }
  }

  Future<List<dynamic>> destinationWedding() async {
    //showLoading();
    var client = http.Client();
    Uri uri = Uri.https(baseUrl, 'api/wedding.php');
    log("uri: " + uri.toString());

    try {
      var response = await client.post(uri, headers: _header, body: null);
      Map<String, dynamic> _res = jsonDecode(response.body);
      // log("response: " + _res.toString());
      log("status code" + response.statusCode.toString());
      if (response.statusCode == 200) {
        dismissLoadingWidget();
        if (_res["status"] == 1) {
          return _res['data'];
        } else {
          return [];
        }
      }

      return [];
    } on SocketException catch (e) {
      dismissLoadingWidget();
      // showToastMessage("No Internet Connection", Icons.error);
      log("no internet catch: " + e.toString());
      return [];
    } catch (e) {
      dismissLoadingWidget();
      // showToastMessage(e.toString(), Icons.error);
      log("error catch: " + e.toString());
      return [];
    }
  }

  Future<Map> privacyPolicy() async {
    //showLoading();
    var client = http.Client();
    Uri uri = Uri.https(baseUrl, 'api/privacy.php');
    log("uri: " + uri.toString());

    try {
      var response = await client.post(uri, headers: _header, body: null);
      Map<String, dynamic> _res = jsonDecode(response.body);
      // log("response: " + _res.toString());
      log("status code" + response.statusCode.toString());
      if (response.statusCode == 200) {
        dismissLoadingWidget();
        if (_res["status"] == 1) {
          return _res['data'];
        } else {
          return {};
        }
      }

      return {};
    } on SocketException catch (e) {
      dismissLoadingWidget();
      // showToastMessage("No Internet Connection", Icons.error);
      log("no internet catch: " + e.toString());
      return {};
    } catch (e) {
      dismissLoadingWidget();
      // showToastMessage(e.toString(), Icons.error);
      log("error catch: " + e.toString());
      return {};
    }
  }

  Future<Map?> requestPackage(String destination, String type, String fromDate,
      String toDate, String noOfGuest) async {
    showLoading();
    var client = http.Client();
    Uri uri = Uri.https(baseUrl, 'api/packagerequest.php');
    log("uri: " + uri.toString());

    try {
      var _body = json.encode({
        //  'name': name,
        'location': destination,
        'type': type,
        'fromdate': fromDate,
        'todate': toDate,
        'person': noOfGuest,
      });
      log("body: " + _body);
      var response = await client.post(uri, headers: _header, body: _body);
      Map<String, dynamic> _res = jsonDecode(response.body);
      log("response: " + _res.toString());
      log("status code" + response.statusCode.toString());
      if (response.statusCode == 200) {
        dismissLoadingWidget();
        if (_res["status"] == 1) {
          log("Package send successFully");
          showSnakbar("Congratulation !", "Package Detail Send Successfully");
          //  authController.fulldata = _res["data"];
          Get.offAll(HomePage());

          //    authController.user = _res["data"];
          // Get.offAll(logIn(
          //     authController.user.toString(), authController.user.toString()));
        } else {
          dismissLoadingWidget();
          log("package not created");
          showSnakbar("Try Again !", "Something went Wrong");
        }
      }

      // showBottomToast("Error", error.msg.toString());
      // showToastMessage(error.msg, Icons.error);

      // log("error: " + error.msg.toString());
      // return userdata;
      return null;
    } on SocketException catch (e) {
      dismissLoadingWidget();
      // showToastMessage("No Internet Connection", Icons.error);
      log("no internet catch: " + e.toString());
      return null;
    } catch (e) {
      dismissLoadingWidget();
      // showToastMessage(e.toString(), Icons.error);
      log("error catch: " + e.toString());
      return null;
    }
  }
}
