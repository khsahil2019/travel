import 'dart:convert';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel/ui/bestDeal/bestdealPage.dart';
import 'package:travel/ui/home/enquiry/enquiryEmail.dart';
import 'package:travel/ui/home/homePage.dart';
import 'dart:io';
import '../controller/authController.dart';
import '../helper/show_loading.dart';
import '../helper/snackbar.dart';
import '../helper/toast.dart';
import '../register/login.dart';
import '../ui/bookingReviewPage/bookingReviewScreen.dart';
import '../ui/bookingReviewPage/confirmation.dart';

class ApiService {
  BuildContext? get context => null;

  final baseUrl = "kabiatravels.com";
  final baseUrl2 = "crux.center";
  final _header = {
    'Content-type': 'application/json',
    'Accept': 'application/json',
  };

  List<BestDeals> results = [];
  String fetchUrl = "https://kabiatravels.com/api/Deals.php";

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

          Get.to(() => HomePage());
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

  Future<Map?> resetPass(
    String email,
    String pass,
    String newpass,
  ) async {
    var client = http.Client();
    Uri uri = Uri.https(baseUrl, 'api/changepass.php');
    log("uri: " + uri.toString());

    try {
      var _body = json
          .encode({"email": email, "password": pass, "newpassword": newpass});
      log("body: " + _body);
      var response = await client.post(uri, headers: _header, body: _body);
      Map<String, dynamic> _res = jsonDecode(response.body);
      log("response: " + _res.toString());
      log("status code" + response.statusCode.toString());
      if (response.statusCode == 200) {
        dismissLoadingWidget();
        if (_res["status"] == 1) {
          log("Pass change successful");
          authController.user = _res["data"];

          Get.to(() => LoginScreen());
          showSnakbar("Congratulations!", "Password Updated Successfully");
        } else {
          log("pass change failed");
          showSnakbar("Error !", "Something went wrong");
        }
      }

      return null;
    } on SocketException catch (e) {
      dismissLoadingWidget();

      log("no internet catch: " + e.toString());
      return null;
    } catch (e) {
      dismissLoadingWidget();

      log("error catch: " + e.toString());
      return null;
    }
  }

  Future<Map?> deleteAccount(
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
    Uri uri = Uri.https(baseUrl, 'api/deleteacc.php');
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
          log("Deleted  success");
          Get.to(() => HomePage());
          log("Delete Account in success");
          showSnakbar("Account!", "Deleted successful");
        } else {
          log("Deletion  failed");
          showSnakbar("Error !", "Something went wrong");
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
        'fname': username,
        'email': email,
        'mobilenumber': mobile,
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
          // authController.user = _res["data"];
          //  Get.offAll(LoginScreen());
          Get.offAll(() => LoginScreen());
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

  Future<void> logout() async {
    authController.user = null;
    // notifyListeners();
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString("email", "");
      showSnakbar("Visit Again!", "Logout Successful");
    });
    return;
  }

  Future<void> logout2() async {
    authController.user = null;
    // notifyListeners();
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString("email", "");
      //  showSnakbar("Visit Again!", "Logout Successful");
    });
    return;
  }

  Future<List<dynamic>> exoticLocation() async {
    //showLoading();
    var client = http.Client();
    Uri uri = Uri.https(baseUrl, 'api/exoticlocationdetails.php');
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
    Uri uri = Uri.https(baseUrl, 'api/bestdeals.php');
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

  Future<Map?> requestPackage(String userEmail, String destination, String type,
      String fromDate, String toDate, String noOfGuest, String mobileNo) async {
    showLoading();
    var client = http.Client();
    Uri uri = Uri.https(baseUrl, 'api/packagerequest.php');
    log("uri: " + uri.toString());

    try {
      var _body = json.encode({
        'UserEmail': userEmail,
        'location': destination,
        'type': type,
        'fromdate': fromDate,
        'todate': toDate,
        'person': noOfGuest,
        'number': mobileNo
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
        } else {
          dismissLoadingWidget();
          log("package not created");
          showSnakbar("Try Again !", "Something went Wrong");
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

  /**/
  Future<Map?> Enquire(
    String email,
    String subject,
    String message,
  ) async {
    showLoading();
    var client = http.Client();
    Uri uri = Uri.https(baseUrl2, 'sendmail.php');
    log("uri: " + uri.toString());

    try {
      var _body = json.encode({
        'email': "kabiatravels@gmail.com",
        'subject': subject,
        'body': message,
        // 'password': password,
      });
      log("body: " + _body);
      var response = await client.post(uri, headers: _header, body: _body);
      Map<String, dynamic> _res = jsonDecode(response.body);
      log("response: " + _res.toString());
      log("status code" + response.statusCode.toString());
      if (response.statusCode == 200) {
        dismissLoadingWidget();
        if (_res["status"] == 1) {
          log("mail success");
          showSnakbar("Congratulation !", "Mailed successful");
          //  authController.fulldata = _res["data"];
          Get.offAll(HomePage());
        } else {
          log("Error");
          showSnakbar("Try Again !", "");
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

  Future<List<dynamic>> Review() async {
    //showLoading();
    var client = http.Client();
    Uri uri = Uri.https(baseUrl, 'api/review.php');
    log("uri: " + uri.toString());

    try {
      var response = await client.get(
        uri,
        headers: _header,
      );
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
      //showToastMessage("No Internet Connection", icon: Icons.error);
      log("no internet catch: " + e.toString());
      return [];
    } catch (e) {
      dismissLoadingWidget();
      //showToastMessage(e.toString(), icon: Icons.error);
      log("error catch: " + e.toString());
      return [];
    }
  }
}
