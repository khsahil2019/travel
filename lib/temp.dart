
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:developer';


class TempSccreen extends StatefulWidget {
  const TempSccreen({Key? key}) : super(key: key);

  @override
  State<TempSccreen> createState() => _TempSccreenState();
}

class _TempSccreenState extends State<TempSccreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 25),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
            ],
          )
        ],
      ),
    ));
  }
}
