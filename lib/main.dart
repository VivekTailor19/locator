import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'Fundamental_Permissions/screens/permission_homeScreen.dart';
import 'homeScreen.dart';
import 'live_location/screens/location_firstScreen.dart';
import 'live_location/screens/location_onMapScreen.dart';

void main() {


  runApp(
    // DevicePreview(
    //   enabled: !kReleaseMode,
    //   builder: (context) =>
    Sizer(
      builder: (context, orientation, deviceType) => GetMaterialApp(

        debugShowCheckedModeBanner: false,
        //initialRoute: "find",
        routes: {
          "/" : (p0) => HomeScreen(),
          "permission":(p0) => Permission_HomeScreen(),
          "find":(p0) => Find_Coordinates(),
          "live":(p0) => Location_HomeScreen(),
          },
        ),
      ),
   //),
  );
}
