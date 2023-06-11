import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sizer/sizer.dart';

class Permission_HomeScreen extends StatefulWidget {
  const Permission_HomeScreen({Key? key}) : super(key: key);

  @override
  State<Permission_HomeScreen> createState() => _Permission_HomeScreenState();
}

class _Permission_HomeScreenState extends State<Permission_HomeScreen> {


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(centerTitle: true,
          leading: Text(""),
          backgroundColor: Colors.teal.shade600,
          title: Text("Let's Check Permissions",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400,color: Colors.white),),),
        floatingActionButton: FloatingActionButton.extended(onPressed: () {

        },backgroundColor: Colors.white,
          label: Text("Check all permission using click on the Button",
            style: TextStyle(fontSize:10.sp,color:Colors.teal),),),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              TextButton(child:Text("Camera",style: TextStyle(fontSize: 17.sp,color: Colors.teal.shade400),),onPressed: () async {
                    var status = await Permission.camera.status;
                    if (status.isDenied) {
                      await Permission.camera.request();
                    }
                    if (await Permission.camera.isRestricted || await Permission.camera.isPermanentlyDenied) {
                      openAppSettings();
                    }
                 },
                ),

              SizedBox(height: 20,),
              TextButton(
                child:Text("Location",style: TextStyle(fontSize: 17.sp,color: Colors.teal.shade400),),
                  onPressed: () async {
                    var status = await Permission.location.status;
                    if (status.isDenied) {
                      await Permission.location.request();
                    }
                    if (await Permission.location.isRestricted || await Permission.location.isPermanentlyDenied) {
                      openAppSettings();
                    }
                 },
                ),

              SizedBox(height: 20,),
              TextButton(child:Text("Storage",style: TextStyle(fontSize: 17.sp,color: Colors.teal.shade400),),onPressed: () async {

                 Get.snackbar("","",
                   titleText:Text("Note",style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w600,color: Colors.teal.shade700),),
                    messageText:Container(height:17.h,alignment:Alignment.topCenter,child: Text("As per Android Studio Documentation, the permission of storage have not to taken in Android version 10 or more....",style: TextStyle(fontWeight: FontWeight.w300,fontSize: 15.5.sp),)),
                    snackPosition: SnackPosition.BOTTOM,
                   backgroundColor: Colors.transparent,

                   duration: Duration(seconds: 4),

                 );
                    var status = await Permission.manageExternalStorage.status;
                    if (status.isDenied) {
                      await Permission.manageExternalStorage.request();
                    }
                    if (await Permission.manageExternalStorage.isRestricted || await Permission.manageExternalStorage.isPermanentlyDenied) {
                      openAppSettings();
                    }
                 },
                ),

              SizedBox(height: 20,),
              TextButton(child:Text("Music & Audio",style: TextStyle(fontSize: 17.sp,color: Colors.teal.shade400),),onPressed: () async {
                    var status = await Permission.audio.status;
                    if (status.isDenied) {
                      await Permission.audio.request();
                    }
                    if (await Permission.audio.isRestricted || await Permission.audio.isPermanentlyDenied) {
                      openAppSettings();
                    }
                 },
                ),
              SizedBox(height: 20,),
              TextButton(child:Text("Photos & Videos",style: TextStyle(fontSize: 17.sp,color: Colors.teal.shade400),),onPressed: () async {
                var status = await Permission.videos.status;
                if (status.isDenied) {
                  await Permission.videos.request();
                }
                if (await Permission.videos.isRestricted || await Permission.videos.isPermanentlyDenied) {
                  openAppSettings();
                }
              },
              ),

              SizedBox(height: 20,),
              TextButton(child:Text("Contacts",style: TextStyle(fontSize: 17.sp,color: Colors.teal.shade400),),onPressed: () async {
                var status = await Permission.contacts.status;
                if (status.isDenied) {
                  await Permission.contacts.request();
                }
                if (await Permission.contacts.isRestricted || await Permission.contacts.isPermanentlyDenied) {
                  openAppSettings();
                }
              },
              ),

              SizedBox(height: 20,),
              TextButton(child:Text("Microphone",style: TextStyle(fontSize: 17.sp,color: Colors.teal.shade400),),onPressed: () async {
                    var status = await Permission.microphone.status;
                    if (status.isDenied) {
                      await Permission.microphone.request();
                    }
                    if (await Permission.microphone.isRestricted || await Permission.microphone.isPermanentlyDenied) {
                      openAppSettings();
                    }
                 },
                ),

              SizedBox(height: 20,),
              TextButton(
                child:Text("Open Settings",style: TextStyle(fontSize: 19.sp,color: Colors.teal.shade400),),
              onPressed: () {
                  openAppSettings();
                },
              ),



            ],
          ),
        ),
      ),
    );
  }


}




// permission.photos.status == permission.videos.status
//because from both condition we can access photos and videos of the device