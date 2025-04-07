import 'package:doorstep_company_app/api/controllers/user/user_controller.dart';
import 'package:doorstep_company_app/utils/bottom_navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as google_maps;
import 'package:lottie/lottie.dart';

import '../../app_controllers/google_map_controller.dart';
import '../../components/app_text.dart';
import '../../components/round_button.dart';
import '../../theme/colors.dart';
import 'add_location.dart';

class GoogleMapScreen extends StatelessWidget {
  final MapController mapController = Get.put(MapController());
  final UserController userController = Get.put(UserController());

  GoogleMapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.whiteTheme,
      body: Obx(() {
        if (mapController.isLoading.value) {
          return Center(
            child: Stack(
              children: [
                Lottie.asset('assets/images/location.json'),
                Positioned(
                  top: 50.h,
                  left: 110.w,
                  child: Column(
                    children: [
                      Container(
                          height: 34.h,
                          width: 34.w,
                          decoration: const BoxDecoration(shape: BoxShape.circle, color: AppColors.lowPurple),
                          child: Center(child: CircleAvatar(backgroundColor: AppColors.whiteTheme, radius: 6.r))),
                      Container(height: 36.h, width: 2.w, color: AppColors.lowPurple)
                    ],
                  ),
                ),
                Positioned(
                  top: 250.h,
                  left: 50.w,
                  child: appText('Fetching your location...', fontSize: 16.sp, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
        }

        return Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.7,
              child: google_maps.GoogleMap(
                onMapCreated: (google_maps.GoogleMapController controller) {
                  mapController.mapController = controller;
                },
                initialCameraPosition: google_maps.CameraPosition(
                    target: google_maps.LatLng(
                        mapController.currentLocation.value!.latitude, mapController.currentLocation.value!.longitude),
                    zoom: 15),
                markers: {
                  google_maps.Marker(
                      markerId: const google_maps.MarkerId('currentLocation'),
                      position: mapController.currentLocation.value!,
                      icon: google_maps.BitmapDescriptor.defaultMarkerWithHue(google_maps.BitmapDescriptor.hueBlue))
                },
              ),
            ),
            Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: width,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                    color: AppColors.whiteTheme),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 30.h),
                    appText('Where did you want service?', fontWeight: FontWeight.bold, fontSize: 18.sp),
                    SizedBox(height: height * 0.010),
                    Obx(() {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: roundButton(
                          isLoading: userController.isLoading.value,
                          color: AppColors.darkBlueShade,
                          onTap: () async {
                            await userController.postUserLocation(
                              mapController.currentLocation.value!.longitude,
                              mapController.currentLocation.value!.latitude,
                              context,
                            );
                            if (!userController.isLoading.value) {
                              Get.offAll(BottomNavigationScreen(
                                longitude: mapController.currentLocation.value!.longitude,
                                latitude: mapController.currentLocation.value!.latitude,
                              ));
                            }
                          },
                          title: 'At my current location',
                        ),
                      );
                    }),
                    SizedBox(height: height * 0.010),
                    Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.w),
                        child: roundButton(
                            color: AppColors.grey300,
                            textColor: AppColors.blackColor,
                            onTap: () {
                              Get.to(AddLocationScreen(
                                  latitude: mapController.currentLocation.value!.latitude,
                                  longitude: mapController.currentLocation.value!.longitude));
                            },
                            title: 'I shall enter my location manually')),
                    SizedBox(height: 50.h),
                  ],
                ))
          ],
        );
      }),
    );
  }
}
