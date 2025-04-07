import 'package:doorstep_company_app/api/controllers/user/user_controller.dart';
import 'package:doorstep_company_app/components/show_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../app_controllers/edit_profile_controller.dart';
import '../../components/app_text.dart';
import '../../theme/colors.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final EditProfileController controller = Get.put(EditProfileController());
  final UserController userController = Get.put(UserController());

  final TextEditingController fnameController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController apartmentController = TextEditingController();
  final TextEditingController areaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initial fetch if needed
    if (userController.userEditProfile.value == null) {
      userController.fetchUserInfo();
    }

    // Set up listener for when user data is loaded
    ever(userController.userEditProfile, (_) {
      populateControllers();
    });

    // If data is already loaded, populate immediately
    if (userController.userEditProfile.value != null) {
      populateControllers();
    }
  }

  void populateControllers() {
    final user = userController.userEditProfile.value?.user;
    if (user != null) {
      if (mounted) {
        setState(() {
          fnameController.text = user.firstName ?? '';
          lnameController.text = user.lastName ?? '';
          emailController.text = user.email ?? '';
          phoneController.text = user.phoneNumber ?? '';

          // Set dropdown value first, then text controller
          if (user.city != null && user.city!.isNotEmpty) {
            controller.selectedCity.value = user.city!;
            cityController.text = user.city!;
          }

          streetController.text = user.street ?? '';
          apartmentController.text = user.apartment ?? '';
          areaController.text = user.area ?? '';
        });
      }
    }
  }

  @override
  void dispose() {
    // Clean up controllers
    fnameController.dispose();
    lnameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    cityController.dispose();
    streetController.dispose();
    apartmentController.dispose();
    areaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: appText('Edit Profile', fontSize: 20, fontWeight: FontWeight.w400)),
        body: Obx(() {
          final user = userController.userEditProfile.value?.user;
          if (userController.isLoading.value) {
            return Center(child: showLoading());
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        GestureDetector(
                          onTap: controller.pickImage,
                          child: Obx(() => // Replace the problematic CircleAvatar with this corrected version
                              CircleAvatar(
                                radius: 50.px,
                                backgroundColor: AppColors.grey300,
                                backgroundImage: controller.pickedImage.value != null
                                    ? FileImage(controller.pickedImage.value!)
                                    : (user?.profileImage != null && user!.profileImage.isNotEmpty
                                        ? NetworkImage(user.profileImage) as ImageProvider
                                        : null),
                                child: (controller.pickedImage.value == null &&
                                        (user?.profileImage == null || user!.profileImage.isEmpty))
                                    ? Icon(Icons.person, size: 50.px, color: AppColors.hintGrey)
                                    : null,
                              )),
                        ),
                        GestureDetector(
                          onTap: controller.pickImage,
                          child: CircleAvatar(
                            radius: 15.px,
                            backgroundColor: AppColors.lowPurple.withOpacity(0.5),
                            child: Icon(Icons.camera_alt, size: 15.px, color: AppColors.whiteTheme),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: commonTextField(
                          controller: fnameController,
                          label: 'First name',
                          hintText: user?.firstName ?? '',
                          prefixIcon: Icons.person_2,
                        ),
                      ),
                      const SizedBox(width: 7),
                      Expanded(
                        child: commonTextField(
                          controller: lnameController,
                          label: 'Last name',
                          hintText: user?.lastName ?? '',
                          prefixIcon: Icons.person_2,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  commonTextField(
                    controller: emailController,
                    label: 'Email',
                    hintText: user?.email ?? '',
                    prefixIcon: Icons.email_outlined,
                  ),
                  const SizedBox(height: 10),
                  commonTextField(
                    controller: phoneController,
                    label: 'Phone',
                    hintText: user?.phoneNumber ?? '',
                    prefixIcon: Icons.phone_android,
                  ),
                  const SizedBox(height: 10),
                  Obx(
                    () => TextFormField(
                      controller: cityController,
                      decoration: InputDecoration(
                        label: appText('City'),
                        hintText: controller.selectedCity.value,
                        prefixIcon: const Icon(Icons.location_city_rounded),
                        suffixIcon: DropdownButton<String>(
                          padding: const EdgeInsets.all(0),
                          value: controller.selectedCity.value,
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              controller.selectedCity.value = newValue;
                              cityController.text = newValue; // Update text controller to match dropdown
                            }
                          },
                          items: controller.cities
                              .map((city) => DropdownMenuItem<String>(
                                    value: city,
                                    child: Text(city),
                                  ))
                              .toList(),
                          underline: const SizedBox(),
                          icon: const Icon(Icons.arrow_drop_down),
                        ),
                      ),
                      readOnly: true,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: commonTextField(
                          controller: areaController,
                          label: 'Area',
                          hintText: user?.area ?? '',
                          prefixIcon: Icons.map,
                        ),
                      ),
                      const SizedBox(width: 7),
                      Expanded(
                        child: commonTextField(
                          controller: streetController,
                          label: 'Street',
                          hintText: user?.street ?? '',
                          prefixIcon: Icons.add_road,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  commonTextField(
                    controller: apartmentController,
                    label: user?.location ?? '',
                    hintText: user?.location ?? '',
                    prefixIcon: Icons.villa,
                  ),
                  const SizedBox(height: 70),
                  Obx(() {
                    return Center(
                        child: ActionChip(
                            onPressed: () {
                              userController.postUserInfo(
                                  fnameController.text.trim(),
                                  lnameController.text.trim(),
                                  emailController.text.trim(),
                                  phoneController.text.trim(),
                                  controller.selectedCity.value,
                                  streetController.text.trim(),
                                  apartmentController.text.trim(),
                                  areaController.text.trim(),
                                  context);
                              userController.uploadProfileImage(controller.pickedImage, context);
                            },
                            label: userController.isLoading.value ? showLoading() : appText("Update & Continue")));
                  })
                ],
              ),
            ),
          );
        }));
  }

  Widget commonTextField(
      {required String label,
      required String hintText,
      required IconData prefixIcon,
      TextEditingController? controller}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        label: appText(label),
        hintText: hintText,
        labelStyle: TextStyle(color: AppColors.grey300),
        hintStyle: TextStyle(color: AppColors.hintGrey),
        prefixIcon: Icon(prefixIcon),
      ),
    );
  }
}
