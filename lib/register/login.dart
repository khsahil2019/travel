import 'package:flutter/material.dart';
import 'package:get/get.dart';

// import 'forgetpass.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get_storage/get_storage.dart';
import 'package:travel/register/resetPass.dart';
import 'package:travel/register/signup.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controller/authController.dart';
import '../services/apiservice.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _rememberMe = false;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  Future<void> saveCredentials(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    await prefs.setString('password', password);
    GetStorage().write('remember_me', true);
  }

  List socialIconList = [
    "assets/img/facebook_logo.png",
    "assets/img/google_logo.png",
    "assets/img/twitter_logo.png"
  ];
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

  @override
  Widget build(BuildContext context) {
    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // String? email = prefs.getString('email');
    // String? password = prefs.getString('password');

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 80.0),
              Text(
                'Login',
                style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                    fontFamily: "Sail"),
              ),
              SizedBox(height: 40.0),
              TextField(
                enabled: true,
                controller: _emailController,
                decoration: InputDecoration(
                    labelText: 'Enter your email',
                    // hintText: 'Enter your email',
                    // border: InputBorder.none,
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    enabledBorder: UnderlineInputBorder(
                        // borderSide: BorderSide(
                        //     color: Theme.of(context)
                        //         .accentColor
                        //         .withOpacity(0.2))

                        )),
              ),
              SizedBox(height: 20.0),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'Password',
                    border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue)),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                    ),
                    enabledBorder: UnderlineInputBorder(
                        // borderSide: BorderSide(
                        //     color:
                        //         Theme.of(context).accentColor.withOpacity(0.2))

                        )
                    // hintText: 'Enter your password',
                    // border: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(20.0),
                    // ),
                    ),
              ),
              SizedBox(height: 20.0),
              // Row(
              //   children: [
              //     Checkbox(
              //       value: _rememberMe,
              //       onChanged: (value) {
              //         setState(() {
              //           _rememberMe = value!;
              //         });
              //       },
              //     ),
              //     Text(
              //       'Remember me',
              //       style: TextStyle(color: Colors.teal),
              //     ),
              //     Spacer(),
              //     TextButton(
              //       onPressed: () {
              //         // Navigate to forgot password screen
              //         // // Navigator.push(
              //         // //   context,
              //         // //   MaterialPageRoute(builder: (context) => ForgotScreen()),
              //         // );
              //       },
              //       child: Text(
              //         'Forgot Password',
              //         style: TextStyle(color: Colors.orange),
              //       ),
              //     ),
              //   ],
              // ),
              SizedBox(height: 20.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange, // Customize the button color here
                ),
                onPressed: () {
                  setState(() {
                    if (getValidate() == true) {
                      ApiService().logIn(_emailController.text.trim(),
                          _passwordController.text.trim());
                    }
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icon(Icons.mail),
                    //SizedBox(width: 8),
                    Text('Log in'),
                  ],
                ),
              ),
              SizedBox(height: 20.0),
              Center(child: Text('or  create new account')),
              SizedBox(height: 20.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal, //background color of button
                ),
                onPressed: () {
                  Get.to(SignupPage());
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icon(Icons.mail),
                    /// SizedBox(width: 8),
                    Text('Sign up'),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     GestureDetector(
              //         onTap: () {
              //           Get.to(() => ResetPassScreen());
              //         },
              //         child: Text("Reset Password"))
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }

  getValidate() {
    if (_emailController.text.isEmpty) {
      SnackBar(content: Text("Please mention Email"));
      return false;
    }
    if (_passwordController.text.isEmpty) {
      SnackBar(content: Text("Please mention Password"));
      return false;
    }
    return true;
  }
}
