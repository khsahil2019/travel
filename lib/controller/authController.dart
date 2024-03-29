import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper/show_loading.dart';
import '../helper/toast.dart';
import '../services/apiservice.dart';

AuthController authController = AuthController.instance;
FirebaseAuth auth = FirebaseAuth.instance;

class AuthController extends GetxController {
  static AuthController instance = Get.find();

  Map? user;
  List<dynamic> exoticplaceList = [];
  List<dynamic> destinationWeddingList = [];
  List<dynamic> dealsList = [];
  List<dynamic> reviewList = [];
  Map? indexPageList;
  Map? logoList;
  Map? privacyList;
  // Map? reviewList;
  //Map? reviewList;
// Map? fulldata;
  @override
  void onInit() {
    // TODO: implement onInit
    // getLogout();
    // deleteAccount();
    getPrivacy();
    getExoticpalce();
    getIndexPage();
    getDestinationWeeding();
    getDeals();
    getlogo();
    getReview();
    super.onInit();
    log("AuthController onInit");
  }

  getPrivacy() {
    ApiService().privacyPolicy().then((value) => privacyList = value);
  }

  getLogout() {
    ApiService().logout().then((value) => null);
  }

  getLogout2() {
    ApiService().logout2().then((value) => null);
  }

  // deleteAccount() {
  //   ApiService().deleteAccount().then((value) => null);
  // }
  //  void signOut() async {
  //   ApiService.();
  // }
  // getReview() {
  //   ApiService().review().then((value) => reviewList = value);
  // }

  getExoticpalce() {
    ApiService().exoticLocation().then((value) => exoticplaceList = value);
  }

  getReview() {
    ApiService().Review().then((value) => reviewList = value);
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

  void signInWithGoogle() async {
    if (kIsWeb) {
      GoogleAuthProvider authProvider = GoogleAuthProvider();
      try {
        final UserCredential userCredential =
            await auth.signInWithPopup(authProvider);
      } catch (e) {
        log("Error: $e");
        if (e is FirebaseAuthException) {
          showToastMessage(e.message!);
        } else {
          showToastMessage(e.toString());
        }
      }
    } else {
      GoogleSignIn _googleSignIn = GoogleSignIn();
      try {
        showLoading();
        var account = await _googleSignIn.signIn();
        if (account != null) {
          var googleKey = await account.authentication;
          var credential = GoogleAuthProvider.credential(
            accessToken: googleKey.accessToken,
            idToken: googleKey.idToken,
          );
          await auth.signInWithCredential(credential).then((value) {
            dismissLoadingWidget();
            showToastMessage("Signed In Successfully.");
          }).onError((e, stackTrace) {
            log("Error: $e");
            dismissLoadingWidget();
            if (e is FirebaseAuthException) {
              showToastMessage(e.message!);
            } else {
              showToastMessage(e.toString());
            }
          });
        }
      } catch (error) {
        dismissLoadingWidget();
        log("Catch Error: $error");
        showToastMessage(error.toString());
      }
    }
  }

  // void Signout() {
  //   authController.user!.remove("user");
  // }
}
