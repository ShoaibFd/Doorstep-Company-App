import 'package:doorstep_company_app/Constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as google_maps;
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../components/app_text.dart';
import '../../components/round_button.dart';
import '../auth/authentication_screen.dart';

class LanguageScreen extends StatefulWidget {
  final bool onChecked;
  const LanguageScreen({super.key, required this.onChecked});

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  final LanguageController languageController = Get.put(LanguageController());

  google_maps.GoogleMapController? mapController;
  google_maps.LatLng? currentLocation;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  Future<void> _getCurrentLocation() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    setState(() {
      currentLocation = google_maps.LatLng(position.latitude, position.longitude);
    });

    if (mapController != null && currentLocation != null) {
      mapController!.animateCamera(google_maps.CameraUpdate.newLatLng(currentLocation!));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.px),
          child: Column(
            children: [
              SizedBox(height: 30.px),
              Center(child: appText('Welcome to ', fontSize: 30.px, fontWeight: FontWeight.bold)),
              SizedBox(height: 20.px),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 45.px,
                    width: 50.px,
                    decoration: BoxDecoration(color: AppColors.blackColor, borderRadius: BorderRadius.circular(4)),
                    child: Center(
                      child: appText('DC', fontSize: 27.px, color: AppColors.whiteTheme, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(width: 10.px),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      appText('Doorstep ', fontSize: 22.px, fontWeight: FontWeight.bold),
                      appText('Company', fontSize: 18.px, fontWeight: FontWeight.bold),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20.px),
              appText('Choose your language to get started', fontSize: 18.px),
              SizedBox(height: 20.px),

              // Language Selection
              Column(
                children: [
                  Obx(() => Row(
                        children: [
                          Radio<String>(
                            activeColor: AppColors.darkGreen,
                            value: 'English',
                            groupValue: languageController.selectedLanguage.value,
                            onChanged: (value) {
                              languageController.setSelectedLanguage(value!);
                            },
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              appText('English', fontSize: 16.px),
                              appText("(device's language)", fontSize: 16.px, color: AppColors.hintGrey),
                            ],
                          ),
                        ],
                      )),
                  Obx(() => Row(
                        children: [
                          Radio<String>(
                            activeColor: AppColors.darkGreen,
                            value: 'Urdu',
                            groupValue: languageController.selectedLanguage.value,
                            onChanged: (value) {
                              languageController.setSelectedLanguage(value!);
                            },
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              appText('اردو', fontSize: 16.px),
                              appText('Urdu', fontSize: 16.px, color: AppColors.hintGrey),
                            ],
                          ),
                        ],
                      )),
                  Obx(() => Row(
                        children: [
                          Radio<String>(
                            activeColor: AppColors.darkGreen,
                            value: 'انگریزی',
                            groupValue: languageController.selectedLanguage.value,
                            onChanged: (value) {
                              languageController.setSelectedLanguage(value!);
                            },
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              appText('Unglish', fontSize: 16.px),
                              appText('(Chat language)', fontSize: 16.px, color: AppColors.hintGrey),
                            ],
                          ),
                        ],
                      )),
                ],
              ),

              const Spacer(),
              roundButton(
                onTap: () {
                  widget.onChecked
                      ? Navigator.pop(context)
                      : Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const AuthenticationScreen()),
                        );
                },
                title: 'Save and continue',
              ),
              SizedBox(height: 10.px),
            ],
          ),
        ),
      ),
    );
  }
}

// Reactive Language Controller using GetX
class LanguageController extends GetxController {
  var selectedLanguage = 'English'.obs; // Making it reactive

  void setSelectedLanguage(String language) {
    selectedLanguage.value = language;
  }
}
