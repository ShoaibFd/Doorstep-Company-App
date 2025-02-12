import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../app_controllers/edit_profile_controller.dart';
import '../../components/app_text.dart';
import '../../constants/colors.dart';

class EditProfileScreen extends StatelessWidget {
  final EditProfileController controller = Get.put(EditProfileController());

  EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: appText('Edit Profile', fontSize: 20, fontWeight: FontWeight.w400)),
      body: Padding(
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
                      child: Obx(
                        () => CircleAvatar(
                          radius: 50.px,
                          backgroundColor: AppColors.grey300,
                          backgroundImage:
                              controller.pickedImage.value != null ? FileImage(controller.pickedImage.value!) : null,
                          child: controller.pickedImage.value == null
                              ? Icon(Icons.person, size: 50.px, color: AppColors.hintGrey)
                              : null,
                        ),
                      ),
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
                      label: 'First Name',
                      hintText: 'Shoaib',
                      prefixIcon: Icons.person_2,
                    ),
                  ),
                  const SizedBox(width: 7),
                  Expanded(
                    child: commonTextField(
                      label: 'Last Name',
                      hintText: 'Lodhra',
                      prefixIcon: Icons.person_2,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              commonTextField(
                label: 'Email ID',
                hintText: 'shoaib@gmail.com',
                prefixIcon: Icons.email_outlined,
              ),
              const SizedBox(height: 10),
              commonTextField(
                label: 'Phone number',
                hintText: '+92301643717',
                prefixIcon: Icons.phone_android,
              ),
              const SizedBox(height: 10),
              Obx(
                () => TextFormField(
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
                      label: 'Area',
                      hintText: 'Al-Furjan',
                      prefixIcon: Icons.person_2,
                    ),
                  ),
                  const SizedBox(width: 7),
                  Expanded(
                    child: commonTextField(
                      label: 'Building Street Name',
                      hintText: 'Sy # 18',
                      prefixIcon: Icons.person_2,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              commonTextField(
                label: 'Apartment/villa Number',
                hintText: '767',
                prefixIcon: Icons.villa,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget commonTextField({
    required String label,
    required String hintText,
    required IconData prefixIcon,
  }) {
    return TextFormField(
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
