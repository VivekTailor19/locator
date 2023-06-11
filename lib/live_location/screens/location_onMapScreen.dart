
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';

import '../controller/location_controller.dart';

class Location_HomeScreen extends StatefulWidget {
  const Location_HomeScreen({Key? key}) : super(key: key);

  @override
  State<Location_HomeScreen> createState() => _Location_HomeScreenState();
}

class _Location_HomeScreenState extends State<Location_HomeScreen> {
  @override

  LocationController control = Get.put(LocationController());

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xff118FF5),
          onPressed: () async {
            control.getLiveCoordinates();
          },
          child: Icon(
            Icons.my_location_rounded,
            size: 22.sp,
            color: Colors.white,
          ),
        ),

        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Color(0xff118FF5),
          elevation: 0,
          leading: Text(""),
          // leading: IconButton(icon: Icon(Icons.arrow_back_ios_new),
          //   iconSize: 20.sp,color: Colors.white,
          //   onPressed: () {
          //       Get.back();
          //     },
          // ),
          title: Text(
            "Google Maps",
            style: TextStyle(
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                color: Colors.white),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.map_rounded),
              iconSize: 20.sp,
              color: Colors.white,
              onPressed: () {
                Get.bottomSheet(Container(
                  height: 18.h,width: 100.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(12.w),topRight: Radius.circular(12.w),),
                    color: Colors.white,
                  ),
                  child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      MapTab(name:"Normal",mapImg: "assets/maptypes/normal.png",naksha: MapType.normal),
                      MapTab(name:"Satellite",mapImg: "assets/maptypes/satellite.png",naksha:MapType.satellite),
                      MapTab(name:"Terrain", mapImg: "assets/maptypes/terrain.png",naksha:MapType.terrain),
                      MapTab(name:"Hybrid",mapImg: "assets/maptypes/satellite.png",naksha:MapType.hybrid),
                    ],
                  ),
                ),
                  barrierColor:  Colors.transparent
                );
              },
            ),
          ],
        ),

        body: Obx(
          () => GoogleMap(
            zoomControlsEnabled: false,
            onMapCreated: (controller) {
              control.myController = controller;
            },
            markers: {
              Marker(
                markerId: const MarkerId("marker1"),
                position: LatLng(control.lat.value, control.long.value),
                draggable: false,
              ),
            },
            initialCameraPosition: CameraPosition(
              target: LatLng(control.lat.value, control.long.value),
              zoom: 5,
            ),
            mapType: control.mapselected.value,
          ),
        ),
      ),
    );
  }

  Widget MapTab({String? name, String? mapImg, MapType? naksha})
  {
    return GestureDetector(
      onTap: () {
        control.mapselected.value = naksha!;
        Get.back();
      },

      child: Column(crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(height: 15.w,width: 15.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.w),
                image: DecorationImage(image: AssetImage("$mapImg"),fit: BoxFit.fill)
            ),
          ),

          SizedBox(height: 1.h,),
          Text("$name",style: TextStyle(fontWeight: FontWeight.w400,fontSize: 14.sp,),)
        ],
      ),
    );
  }
}
