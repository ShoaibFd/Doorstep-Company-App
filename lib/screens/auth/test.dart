// import 'dart:developer';

// import 'package:doorstep_company_app/api/controllers/auth/auth_controller.dart';
// import 'package:doorstep_company_app/components/custom_snackbar.dart';
// import 'package:doorstep_company_app/components/round_button.dart';
// import 'package:doorstep_company_app/constants/shared_prefs.dart';
// import 'package:doorstep_company_app/screens/auth/create_account_screen.dart';
// import 'package:doorstep_company_app/utils/bottom_navigation_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:otp_text_field/otp_field.dart';
// import 'package:otp_text_field/style.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

// import '../../components/app_text.dart';
// import '../../constants/colors.dart';

// class OTPScreen extends StatefulWidget {
//   const OTPScreen({super.key});

//   @override
//   State<OTPScreen> createState() => _OTPScreenState();
// }

// class _OTPScreenState extends State<OTPScreen> {
//   final formKey = GlobalKey<FormState>();
//   final AuthController authController = Get.find<AuthController>();
//   final SharedPrefs prefs = SharedPrefs();
//   GoogleMapController? mapController;
//   LatLng? selectedLocation;
//   LatLng? currentLocation;


//   Future<void> _getCurrentLocation() async {
//     try {
//       Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high,
//       );
//       setState(() {
//         currentLocation = LatLng(position.latitude, position.longitude);
//         selectedLocation = currentLocation;
//       });

//       if (mapController != null) {
//         mapController!.animateCamera(CameraUpdate.newLatLng(currentLocation!));
//       }
//     } catch (e) {
//       debugPrint('Error getting location: $e');
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     _getCurrentLocation();
//   }

//   @override
//   Widget build(BuildContext context) {
//     double height = MediaQuery.of(context).size.height;
//     double width = MediaQuery.of(context).size.width;

//     return Scaffold(
//       backgroundColor: AppColors.whiteTheme,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       body: Container(
//         height: height,
//         width: width,
//         decoration: const BoxDecoration(
//           image: DecorationImage(
//             image: AssetImage('assets/images/authlogo.jpeg'),
//             fit: BoxFit.cover,
//           ),
//         ),
//         child: Form(
//           key: formKey,
//           child: Padding(
//             padding: EdgeInsets.symmetric(horizontal: 16.px),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(height: height * 0.04),
//                 appText('Enter Code', fontSize: 24, fontWeight: FontWeight.bold),
//                 appText(
//                   'We have sent you an SMS with the code \nto phone number',
//                   fontSize: 12,
//                   color: AppColors.hintGrey,
//                   textAlign: TextAlign.center,
//                 ),
//                 SizedBox(height: height * 0.030),
//                 OTPTextField(
//                   length: 4,
//                   width: MediaQuery.of(context).size.width,
//                   fieldWidth: 40.px,
//                   style: TextStyle(fontSize: 17.px),
//                   textFieldAlignment: MainAxisAlignment.spaceAround,
//                   fieldStyle: FieldStyle.underline,
//                   onCompleted: (pin) {
//                     log("Entered Pin: $pin");
//                     setState(() {
//                       otp = pin;
//                     });
//                   },
//                 ),
//                 SizedBox(height: height * 0.06),
//                 Center(
//                   child: InkWell(
//                     splashColor: AppColors.lightGreen,
//                     onTap: () async {
//                       final phoneNumber = await prefs.getPhone();
//                       final countryCode = await prefs.getCountryCode();
//                       if (phoneNumber != null && countryCode != null) {
//                         authController.sendOTP(context, phoneNumber, countryCode);
//                       } else {
//                         showErrorSnackbar(context, 'Phone number or country code not found');
//                       }
//                     },
//                     child: appText('Resend Code', color: AppColors.blueShade),
//                   ),
//                 ),
//                 SizedBox(height: 30.px),
//                 Obx(() {
//                   return roundButton(
//                     onTap: () async {
//                       if (otp != null && otp!.length == 4) {
//                         try {
//                           final phoneNumber = await prefs.getPhone();
//                           final isVerified = await authController.verifyOTP(otp!, context);
//                           if (isVerified) {
//                             Get.off(
//                               phoneNumber != null
//                                   ? BottomNavigationScreen(
//                                       latitude: currentLocation?.latitude ?? 0,
//                                       longitude: currentLocation?.longitude ?? 0,
//                                     )
//                                   : const CreateAccountScreen(),
//                             );
//                           } else {
//                             showErrorSnackbar(context, 'Invalid OTP or OTP expired.');
//                           }
//                         } catch (e) {
//                           showErrorSnackbar(context, 'Error verifying OTP: ${e.toString()}');
//                         }
//                       } else {
//                         showErrorSnackbar(context, 'Please enter 4-digit OTP');
//                       }
//                     },
//                     title: 'Proceed',
//                     isLoading: authController.isLoading.value,
//                   );
//                 }),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
