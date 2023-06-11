import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(height: 300,
            child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [

                TextButton(onPressed: () => Get.toNamed("permission"), child: Text("CHECK Permissions",style: TextStyle(fontSize: 18.sp),)),

                TextButton(onPressed: () => Get.toNamed("find"), child: Text("LIVE Location",style: TextStyle(fontSize: 18.sp),)),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
