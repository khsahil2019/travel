import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';

import '../helper/alertBox.dart';
import 'localNotifications.dart';

class NotificationService {
  init() async {
    log("Notification init called------");
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    askPermission();
    getTokenAndUpdate();
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        log("FirebaseMessaging.instance.getInitialMessage: ${message.data}");
        handleMessage(message);
      }
    });
    FirebaseMessaging.onMessage.listen((message) {
      if (message.notification != null) {
        // when app is opened
        log("FirebaseMessaging.onMessage: ${message.notification!.body}");
        // handleMessage(message);
        if (kIsWeb) {
        } else {
          LocalNotificationService.createanddisplaynotification(message);
        }
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((message) {
      if (message.notification != null) {
        // when you click on notification and app is in background
        log("FirebaseMessaging.onMessageOpenedApp: ${message.notification!.body}");
        handleMessage(message);
      }
    });
    LocalNotificationService.initialize();
    FirebaseMessaging.instance.subscribeToTopic("all");
  }

  Future<String?> getTokenAndUpdate() async {
    String? token = await FirebaseMessaging.instance.getToken();
    if (token != null) {
      print("token: $token");
      // TODO: upload token to server
    }
    return token;
  }

  // tokenListener() {
  //   log("token listening----");
  //   FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
  //     // FireStoreService().uploadFcmToken(fcmToken);
  //   }).onError((err) {
  //     // Error getting token.
  //   });
  // }

  askPermission() async {
    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission();
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else {
      checkPermission(Permission.notification);
      print('User declined permission');
    }
  }
}

void handleMessage(RemoteMessage message) async {
  log("Handle message:" + message.data.toString());
}

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  log('A bg message just showed up  ew :  ${message.data}');
  handleMessage(message);
}

Future<bool> checkPermission(Permission permission) async {
  log("permission:" + permission.toString());
  PermissionStatus status = await permission.request();
  log("status: $status");
  if (status.isGranted) {
    return true;
  }
  if (status.isPermanentlyDenied || status.isDenied) {
    showAlertBox("Permission Required!",
        "You need to allow this permission for a better experience.", () {
      openAppSettings();
    }, cancelText: "Close", confirmText: "Open Setting");
  }
  return false;
}
