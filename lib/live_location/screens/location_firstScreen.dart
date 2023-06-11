import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Find_Coordinates extends StatefulWidget {
  const Find_Coordinates({super.key});

  @override
  State<Find_Coordinates> createState() => _Find_CoordinatesState();
}

class _Find_CoordinatesState extends State<Find_Coordinates> {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3),() => Get.offAndToNamed("live"),);
    return SafeArea(
      child: Scaffold(

        body: Center(child: Image.asset("assets/location/location.png",),),



      ),
    );
  }
}
