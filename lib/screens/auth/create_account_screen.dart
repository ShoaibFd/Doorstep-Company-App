import 'package:doorstep_company_app/components/custom_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as google_maps;
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../app_controllers/create_account_controller.dart';
import '../../components/custom_text.dart';
import '../../components/round_button.dart';
import '../../constants/colors.dart';
import '../../utils/bottom_navigation_screen.dart';
import '../account_screen/terms_and_conditions_screen.dart';
import 'app_textfield.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  google_maps.GoogleMapController? mapController;
  google_maps.LatLng? selectedLocation;
  google_maps.LatLng? currentLocation;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  final CreateAccountController createAccountController = Get.put(CreateAccountController());

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        currentLocation = google_maps.LatLng(position.latitude, position.longitude);
        selectedLocation = currentLocation;
      });

      if (mapController != null) {
        mapController!.animateCamera(google_maps.CameraUpdate.newLatLng(currentLocation!));
      }
    } catch (e) {
      // Handle location errors gracefully
      debugPrint('Error getting location: $e');
    }
  }

  // Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController houseController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void pickDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            dialogBackgroundColor: AppColors.blueAccentColor,
            colorScheme: const ColorScheme.light(
              primary: AppColors.blueColor,
              onPrimary: AppColors.whiteTheme,
              onSurface: AppColors.blackColor,
            ),
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null) {
      setState(() {
        dobController.text = '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';
      });
    }
  }

  String? validateEmail(String? value) {
    if (value != null && value.isNotEmpty) {
      if (!GetUtils.isEmail(value)) {
        return 'Please enter a valid email address';
      }
    }
    return null;
  }

  String? validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }
    if (!GetUtils.isPhoneNumber(value)) {
      return 'Please enter a valid phone number';
    }
    return null;
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: appText('Create Account', fontSize: 20, fontWeight: FontWeight.w400),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  appText('Name:', fontWeight: FontWeight.bold),
                  appTextField(
                    hint: 'Name',
                    controller: nameController,
                    prefixIcon: Icons.person_2,
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Name is required';
                      return null;
                    },
                    keyboardType: TextInputType.name,
                  ),
                  SizedBox(height: 10.px),
                  appText('Gender:', fontWeight: FontWeight.bold),
                  appTextField(
                    readOnly: true,
                    suffixIcon: PopupMenuButton<String>(
                      shadowColor: AppColors.blueColor,
                      color: AppColors.whiteTheme,
                      icon: const Icon(Icons.arrow_drop_down_rounded, color: AppColors.blueColor),
                      onSelected: (String value) {
                        setState(() {
                          genderController.text = value;
                        });
                      },
                      itemBuilder: (BuildContext context) {
                        return <PopupMenuEntry<String>>[
                          PopupMenuItem<String>(value: 'Male', child: appText('Male', fontWeight: FontWeight.bold)),
                          PopupMenuItem<String>(value: 'Female', child: appText('Female', fontWeight: FontWeight.bold)),
                          PopupMenuItem<String>(value: 'Other', child: appText('Other', fontWeight: FontWeight.bold)),
                        ];
                      },
                    ),
                    hint: 'Select Gender',
                    controller: genderController,
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Gender is required';
                      return null;
                    },
                    prefixIcon: Icons.face,
                  ),
                  SizedBox(height: 10.px),
                  appText('Date of Birth:', fontWeight: FontWeight.bold),
                  appTextField(
                    onTap: pickDate,
                    hint: 'Date of Birth',
                    readOnly: true,
                    controller: dobController,
                    prefixIcon: Icons.person,
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today, color: AppColors.blueColor),
                      onPressed: pickDate,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Date of Birth is required';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 10.px),
                  appText('Address', fontWeight: FontWeight.bold),
                  appTextField(
                    hint: 'Your Address',
                    controller: houseController,
                    prefixIcon: Icons.home_filled,
                    validator: (value) {
                      if (value == null || value.isEmpty) return 'Address is required';
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  appText('Email ID:', fontWeight: FontWeight.bold),
                  appTextField(
                    hint: 'Email (Optional)',
                    controller: emailController,
                    prefixIcon: Icons.email,
                    validator: validateEmail,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 10.px),
                  appText('Phone Number:', fontWeight: FontWeight.bold),
                  appTextField(
                    hint: 'Mobile Number',
                    controller: phoneController,
                    prefixIcon: Icons.phone,
                    validator: validatePhone,
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 10.px),
                  appText('Password:', fontWeight: FontWeight.bold),
                  Obx(() => appTextField(
                        obsecure: createAccountController.isHidden.value,
                        hint: 'Set Password',
                        maxLength: 1,
                        controller: passwordController,
                        validator: validatePassword,
                        prefixIcon: Icons.lock_outline_rounded,
                        suffixIcon: IconButton(
                          onPressed: () => createAccountController.showPassword(),
                          icon: Icon(createAccountController.isHidden.value ? Icons.visibility_off : Icons.visibility,
                              color: AppColors.blueColor),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                      )),
                  SizedBox(height: 10.px),
                  appText('Confirm Password:', fontWeight: FontWeight.bold),
                  Obx(() => appTextField(
                        maxLength: 1,
                        obsecure: createAccountController.isHidden1.value,
                        hint: 'Confirm Password',
                        controller: confirmPasswordController,
                        validator: (value) {
                          if (value == null || value.isEmpty) return 'Password is required';
                          if (value != passwordController.text) return 'Passwords do not match';
                          return null;
                        },
                        prefixIcon: Icons.lock_outline_rounded,
                        suffixIcon: IconButton(
                          onPressed: () => createAccountController.showConfirmPassword(),
                          icon: Icon(createAccountController.isHidden1.value ? Icons.visibility_off : Icons.visibility,
                              color: AppColors.blueColor),
                        ),
                        keyboardType: TextInputType.visiblePassword,
                      )),
                  SizedBox(height: 4.px),
                  Row(
                    children: [
                      Obx(() => Checkbox(
                            activeColor: AppColors.blueColor,
                            value: createAccountController.isSelected.value,
                            onChanged: (value) => createAccountController.selectToggle(),
                          )),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            Get.to(() => const TermsAndConditionsScreen());
                          },
                          child: Row(
                            children: [
                              appText('I agree with the '),
                              appText('terms and conditions.',
                                  decoration: TextDecoration.underline,
                                  color: AppColors.blueColor,
                                  fontWeight: FontWeight.bold),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: roundButton(
                      height: 40.px,
                      width: 200.px,
                      onTap: () {
                        if (!createAccountController.isSelected.value) {
                          showErrorSnackbar(context, 'Please accept terms and condition!');
                          return;
                        }
                        if (formKey.currentState!.validate()) {
                          Get.off(() => BottomNavigationScreen(
                                latitude: currentLocation?.latitude ?? 0,
                                longitude: currentLocation?.longitude ?? 0,
                              ));
                        }
                      },
                      title: 'Continue',
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      appText("Already have an account? "),
                      GestureDetector(
                        onTap: () {},
                        child: appText("Login", color: AppColors.blueColor, fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.px),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
