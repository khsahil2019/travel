import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../services/apiservice.dart';
import 'login.dart';

class SignupPage extends StatefulWidget {
  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _firstNameController = TextEditingController();
  // TextEditingController _lastNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Sign up",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                  // fontFamily: "Sail"
                ),
              ),
              SizedBox(
                height: 60,
              ),
              TextField(
                controller: _firstNameController,
                decoration: InputDecoration(
                  labelText: 'First name',
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _mobileController,
                // obscureText: true,
                keyboardType: TextInputType.number,
                maxLength: 10,
                // enableSuggestions: true,
                decoration: InputDecoration(
                  labelText: 'Mobile Number',
                  counterText: "",
                ),
              ),
              SizedBox(height: 16),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
              SizedBox(height: 56),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange, // Customize the button color here
                ),
                onPressed: () {
                  // _submitForm();
                  ApiService().Signup(
                      _firstNameController.text,
                      _emailController.text,
                      _mobileController.text,
                      _passwordController.text);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Create account'),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Center(child: Text("or")),
              SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.teal, //background color of button
                ),
                onPressed: () {
                  Get.to(LoginScreen());
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(builder: (context) => CategoryScreen()),
                  // );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Icon(Icons.mail),
                    // SizedBox(width: 8),
                    Text('Already have an account'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
