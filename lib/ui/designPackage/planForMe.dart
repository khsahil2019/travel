import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:travel/ui/home/homePage.dart';

import '../../helper/snackbar.dart';
import '../../services/apiservice.dart';

class PlanForMe extends StatefulWidget {
  @override
  _PlanForMeState createState() => _PlanForMeState();
}

class _PlanForMeState extends State<PlanForMe> {
  final _formKey = GlobalKey<FormState>();

  DateTime? fromDate;
  DateTime? toDate;

  TextEditingController mobileCtrl = new TextEditingController();
  TextEditingController destinationCtrl = new TextEditingController();
  TextEditingController typeCtrl = new TextEditingController();
  TextEditingController guestCtrl = new TextEditingController();

  Future<void> _selectDate(BuildContext context, bool isFromDate) async {
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      //onDatePickerModeChange: ,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2025),
    );

    if (selectedDate != null) {
      setState(() {
        if (isFromDate) {
          fromDate = selectedDate;
        } else {
          toDate = selectedDate;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          // title: Text('Flutter Form'),
          ),
      body: Stack(
        children: [
          Container(
            child: ListView(
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Package Details",
                      style: TextStyle(
                          fontSize: 24,
                          color: Colors.teal,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          children: <Widget>[
                            SizedBox(
                              height: 20,
                            ),
                            TextField(
                              enabled: true,
                              controller: destinationCtrl,
                              decoration: const InputDecoration(
                                  hintText: "Manali",
                                  labelText: 'Enter Destination',
                                  border: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue)),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                  enabledBorder: UnderlineInputBorder()),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            TextField(
                              enabled: true,
                              controller: typeCtrl,
                              decoration: const InputDecoration(
                                  hintText: "Family",
                                  labelText: 'Enter type of travel',
                                  border: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue)),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                  enabledBorder: UnderlineInputBorder()),
                            ),
                            ListTile(
                              title: Text('From Date'),
                              subtitle: fromDate != null
                                  ? Text(fromDate.toString())
                                  : Text('Select a date'),
                              onTap: () {
                                _selectDate(context, true);
                              },
                            ),
                            ListTile(
                              title: Text('To Date'),
                              subtitle: toDate != null
                                  ? Text(toDate.toString())
                                  : Text('Select a date'),
                              onTap: () {
                                _selectDate(context, false);
                              },
                            ),
                            TextField(
                              enabled: true,
                              controller: guestCtrl,
                              keyboardType: TextInputType.number,
                              maxLength: 2,
                              decoration: const InputDecoration(
                                  labelText: 'Enter number of guest',
                                  counterText: "",
                                  border: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue)),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                  enabledBorder: UnderlineInputBorder()),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            TextField(
                              enabled: true,
                              maxLength: 10,
                              keyboardType: TextInputType.number,
                              controller: mobileCtrl,
                              decoration: const InputDecoration(
                                  counterText: "",
                                  labelText: 'Enter Mobile Number',
                                  border: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blue)),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.blue),
                                  ),
                                  enabledBorder: UnderlineInputBorder()),
                            ),
                            SizedBox(height: 16),
                            ElevatedButton(
                              onPressed: () {
                                if (validate()) {
                                  ApiService().requestPackage(
                                      "",
                                      destinationCtrl.text,
                                      typeCtrl.text,
                                      fromDate.toString(),
                                      toDate.toString(),
                                      guestCtrl.text,
                                      mobileCtrl.text);
                                  Get.to(() => HomePage());
                                  showSnakbar("Congratulation",
                                      "Your Designed package has been sent to admin");
                                  // ScaffoldMessenger.of(context).showSnackBar(
                                  //   SnackBar(
                                  //       content: Text(
                                  //           'Form submitted successfully')),
                                  // );
                                }
                              },
                              child: Text('Submit'),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  bool validate() {
    // if (mobileCtrl.text.isEmpty) {
    //   showSnakbar("Error", "Please Enter Name");
    //   return false;
    // }
    if (destinationCtrl.text.isEmpty) {
      showSnakbar("Error", "Please Enter Destination");
      return false;
    }
    if (typeCtrl.text.isEmpty) {
      showSnakbar("Error", "Please Enter Journey Type");
      return false;
    }
    if (guestCtrl.text.isEmpty) {
      showSnakbar("Error", "Please Enter Number of Guest");
      return false;
    }
    return true;
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: PlanForMe(),
//   ));
// }
