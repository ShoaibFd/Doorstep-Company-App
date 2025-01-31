import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/colors.dart';
import '../../widgets/custom_text.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String selectedCity = 'Multan';
  final List<String> cities = ['Multan', 'Lahore', 'Karachi', 'Islamabad', 'Peshawar'];
  File? _pickedImage;

  @override
  void initState() {
    super.initState();
    _checkPermissions();
  }

  Future<void> _checkPermissions() async {
    if (Platform.isAndroid) {
      if (await Permission.storage.status.isDenied || await Permission.photos.status.isDenied) {
        await [
          Permission.storage,
          Permission.photos,
        ].request();
      }
    }
  }

  Future<void> _pickImage() async {
    try {
      // Check permissions first
      await _checkPermissions();

      // Create picker instance
      final picker = ImagePicker();
      print('Opening gallery...');

      // Pick image with timeout
      final XFile? pickedFile = await picker
          .pickImage(
        source: ImageSource.gallery,
        imageQuality: 80,
        maxWidth: 800,
      )
          .timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw Exception('Picking image timed out');
        },
      );

      if (pickedFile != null) {
        setState(() {
          _pickedImage = File(pickedFile.path);
        });
        print('Image selected successfully: ${pickedFile.path}');
      } else {
        print('No image selected');
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('No image selected'),
              duration: Duration(seconds: 2),
            ),
          );
        }
      }
    } catch (e) {
      print('Error picking image: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error picking image: $e'),
            duration: const Duration(seconds: 2),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: appText('Edit Profile', fontSize: 20, fontWeight: FontWeight.w400),
      ),
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
                      onTap: _pickImage,
                      child: CircleAvatar(
                        radius: 50.px,
                        backgroundColor: AppColors.grey300,
                        backgroundImage: _pickedImage != null ? FileImage(_pickedImage!) : null,
                        child: _pickedImage == null ? Icon(Icons.person, size: 50.px, color: AppColors.hintGrey) : null,
                      ),
                    ),
                    GestureDetector(
                      onTap: _pickImage,
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
                hintText: 'shoaibFD@gmail.com',
                prefixIcon: Icons.email_outlined,
              ),
              const SizedBox(height: 10),
              commonTextField(
                label: 'Phone number',
                hintText: '+92301643717',
                prefixIcon: Icons.phone_android,
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  label: appText('City'),
                  hintText: selectedCity,
                  prefixIcon: const Icon(Icons.location_city_rounded),
                  suffixIcon: DropdownButton<String>(
                    value: selectedCity,
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedCity = newValue!;
                      });
                    },
                    items: cities
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
