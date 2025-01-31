import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

// Replace with your custom imports
import '../../constants/colors.dart';
import '../../utils/bottom_navigation_screen.dart';
import '../../widgets/custom_text.dart';
import '../../widgets/round_button.dart';
import '../account_screen/terms_and_conditions_screen.dart';
import 'app_textfield.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  // Controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController areaController = TextEditingController();
  final TextEditingController streetController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController houseController = TextEditingController();
  final TextEditingController buildingController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool isHidden = false;
  bool isHidden1 = false;
  bool isSelected = false;

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
        dobController.text = '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}'; // Format as needed
      });
    }
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
                      if (value!.isEmpty) return 'Name is required';
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
                      if (value!.isEmpty) return 'Gender is required';
                      return null;
                    },
                    prefixIcon: Icons.face,
                    keyboardType: TextInputType.name,
                  ),
                  SizedBox(height: 10.px),
                  appText('Date of Birth:', fontWeight: FontWeight.bold),
                  appTextField(
                    onTap: () {
                      pickDate();
                    },
                    hint: 'Date of Birth',
                    readOnly: true,
                    controller: dobController,
                    prefixIcon: Icons.person,
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.calendar_today, color: AppColors.blueColor),
                      onPressed: () async {
                        pickDate();
                      },
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
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
                      if (value!.isEmpty) return 'House number is required';
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  appText('Email ID:', fontWeight: FontWeight.bold),
                  appTextField(
                    hint: 'Email (Optional)',
                    controller: emailController,
                    prefixIcon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                  ),
                  SizedBox(height: 10.px),
                  appText('Phone Number:', fontWeight: FontWeight.bold),
                  appTextField(
                    hint: 'Mobile Number',
                    controller: phoneController,
                    prefixIcon: Icons.phone,
                    validator: (value) {
                      if (value!.isEmpty) return 'Phone number is required';
                      return null;
                    },
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 10.px),
                  appText('Password:', fontWeight: FontWeight.bold),
                  appTextField(
                    obsecure: isHidden,
                    hint: 'Set Password',
                    controller: passwordController,
                    validator: (value) {
                      if (value!.isEmpty) return 'Password is required';
                      return null;
                    },
                    prefixIcon: Icons.lock_outline_rounded,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isHidden = !isHidden;
                        });
                      },
                      icon: Icon(
                        isHidden ? Icons.visibility_off : Icons.visibility,
                        color: AppColors.blueColor,
                      ),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(height: 10.px),
                  appText('Confirm Password:', fontWeight: FontWeight.bold),
                  appTextField(
                    obsecure: isHidden1,
                    hint: 'Confirm Password',
                    controller: confirmPasswordController,
                    validator: (value) {
                      if (value!.isEmpty) return 'Password is required';
                      if (value != passwordController.text) return 'Passwords do not match';
                      return null;
                    },
                    prefixIcon: Icons.lock_outline_rounded,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          isHidden1 = !isHidden1;
                        });
                      },
                      icon: Icon(
                        isHidden1 ? Icons.visibility_off : Icons.visibility,
                        color: AppColors.blueColor,
                      ),
                    ),
                    keyboardType: TextInputType.visiblePassword,
                  ),
                  SizedBox(height: 4.px),
                  Row(
                    children: [
                      Checkbox(
                        activeColor: AppColors.blueColor,
                        value: isSelected,
                        onChanged: (value) {
                          setState(() {
                            isSelected = value ?? false;
                          });
                        },
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context, MaterialPageRoute(builder: (context) => const TermsAndConditionsScreen()));
                        },
                        child: Row(
                          children: [
                            appText('I agree with the '),
                            appText(' terms and conditions.',
                                decoration: TextDecoration.underline,
                                color: AppColors.blueColor,
                                fontWeight: FontWeight.bold),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: roundButton(
                      height: 40.px,
                      width: 200.px,
                      onTap: () {
                        if (formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const BottomNavigationScreen()),
                          );
                        }
                      },
                      title: 'Continue',
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    spacing: 8,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      appText("Already have an account?"),
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
