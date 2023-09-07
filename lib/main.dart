import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:travel/ui/splash/splashScreen.dart';

import 'controller/allbindings.dart';
import 'helper/theme.dart';
import 'package:firebase_core/firebase_core.dart';

// void main() => runApp(const MyApp());
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeClass.lightTheme,
      initialBinding: AuthBinding(),
      home: MyHomePage(title: 'K T Travel APP'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SplashScreen());
  }
}
