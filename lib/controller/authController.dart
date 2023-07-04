import 'dart:developer';

import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper/show_loading.dart';
import '../services/apiservice.dart';

AuthController authController = AuthController.instance;

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  Map? user;
  List<dynamic> exoticplaceList = [];
  List<dynamic> destinationWeddingList = [];
  List<dynamic> dealsList = [];
  Map? indexPageList;
  Map? logoList;
  Map? privacyList;
// Map? fulldata;
  @override
  void onInit() {
    // TODO: implement onInit
    getPrivacy();
    getExoticpalce();
    getIndexPage();
    getDestinationWeeding();
    getDeals();
    getlogo();
    super.onInit();
    log("AuthController onInit");
  }

  getPrivacy() {
    ApiService().privacyPolicy().then((value) => privacyList = value);
  }

  getExoticpalce() {
    ApiService().exoticLocation().then((value) => exoticplaceList = value);
  }

  getDestinationWeeding() {
    ApiService()
        .destinationWedding()
        .then((value) => destinationWeddingList = value);
  }

  getDeals() {
    ApiService().deals().then((value) => dealsList = value);
  }

  getIndexPage() {
    ApiService().indexPage().then((value) => indexPageList = value);
  }

  getlogo() {
    ApiService().logo().then((value) => logoList = value);
  }

//  actionRemeberMe(bool value) {
//     _rememberMe = value;
//     SharedPreferences.getInstance().then(
//       (prefs) {
//         prefs.setBool("remember_me", value);
//         prefs.setString('email', _emailController.text);
//         prefs.setString('userId', _passwordController.text);
//       },
//     );
  void signInWithGoogle() async {
    showLoading();
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    try {
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;
      if (googleAuth != null) {
        //  final credential = GoogleAuthProvider.credential(
        //       accessToken: googleAuth.accessToken,
        //       idToken: googleAuth.idToken,
        //     );
      }
    } catch (e) {}
  }
}
