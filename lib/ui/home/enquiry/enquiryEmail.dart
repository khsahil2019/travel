import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel/services/apiservice.dart';

import '../homePage.dart';

class MyFormScreen extends StatefulWidget {
  @override
  _MyFormScreenState createState() => _MyFormScreenState();
}

class _MyFormScreenState extends State<MyFormScreen> {
  TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _commentsController = TextEditingController();
//  String _emailController.text ="kabiatravels@gmail.com";

  @override
  Widget build(BuildContext context) {
    _emailController.text = "kabiatravels@gmail.com";
    return Scaffold(
      appBar: AppBar(),
      // appBar: AppBar(
      //   actions: [],
      //   title: Text('Form Example'),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              "Enquire Form",
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.indigo,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 100,
            ),
            TextField(
              controller: _emailController,
              enabled: false,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _mobileController,
              maxLength: 10,
              decoration: InputDecoration(labelText: 'Mobile Number'),
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _commentsController,
              maxLines: 4,
              decoration: InputDecoration(labelText: 'Comments'),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Perform actions for cancel button
                    _clearForm();
                    Get.to(() => HomePage());
                  },
                  child: Text('Cancel'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Perform actions for submit button
                    _submitForm();
                  },
                  child: Text('Submit'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _clearForm() {
    //_emailController.clear();
    _mobileController.clear();
    _commentsController.clear();
  }

  void _submitForm() {
    // TODO: Add code to handle form submission
    String email = _emailController.text;
    String mobile = _mobileController.text;
    String comments = _commentsController.text;

    // TODO: Process the form data (e.g., save to database)
    ApiService().Enquire(email, mobile, comments);
    Get.to(() => HomePage());

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Form submitted!'),
      ),
    );
  }
}
