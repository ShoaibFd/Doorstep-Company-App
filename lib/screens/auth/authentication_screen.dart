import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../components/custom_text.dart';
import '../../components/round_button.dart';
import '../../constants/colors.dart';
import '../account_screen/personal_detail_screen.dart';
import '../google_map/google_map_screen.dart';
import 'sent_code_screen.dart';

class AuthenticationScreen extends StatefulWidget {
  const AuthenticationScreen({super.key});

  @override
  _AuthenticationScreenState createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends State<AuthenticationScreen> {
  final phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String countryCode = '+92';
  String initialSelection = 'PK';
  bool isEnabled = false;

  @override
  void dispose() {
    phoneController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
          backgroundColor: AppColors.floatingButtonColor,
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => GoogleMapScreen()));
          },
          child: appText('Skip')),
      body: Stack(
        children: [
          Container(
              height: height,
              width: double.infinity,
              decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage('assets/images/authlogo.jpeg'), fit: BoxFit.cover))),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: height * 0.1),
                    appText('Doorstep', fontSize: 20.px, fontWeight: FontWeight.bold),
                    appText('Company'),
                    SizedBox(height: 10.px),
                    appText("Your Home Service Expert", fontSize: 18.px, fontWeight: FontWeight.bold),
                    appText("Quick . Affordable . Service", color: AppColors.greyColor),
                    SizedBox(height: 20.px),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            height: 53.px,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.px),
                                border: Border.all(color: AppColors.grey300)),
                            child: Padding(
                              padding: EdgeInsets.all(8.px),
                              child: CountryCodePicker(
                                onChanged: (code) {
                                  setState(() {
                                    countryCode = code.dialCode!;
                                    initialSelection = code.code!;
                                  });
                                },
                                initialSelection: initialSelection,
                                showCountryOnly: false,
                                showOnlyCountryWhenClosed: false,
                                showFlag: true,
                                hideMainText: true,
                                favorite: const ['+92', '+1'],
                                flagDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4.px),
                                ),
                                builder: (countryCode) {
                                  return Row(
                                    children: <Widget>[
                                      Image.asset(countryCode!.flagUri!, package: 'country_code_picker', width: 32.px),
                                      SizedBox(width: 8.px),
                                      appText(countryCode.dialCode!, fontSize: 16.px),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 8.px),
                        Expanded(
                          flex: 8,
                          child: TextFormField(
                            onTap: () {
                              isEnabled = true;
                              setState(() {});
                            },
                            controller: phoneController,
                            keyboardType: TextInputType.phone,
                            cursorColor: AppColors.darkBlueShade,
                            decoration: InputDecoration(
                                hintText: 'Enter phone number',
                                hintStyle: TextStyle(color: AppColors.hintGrey),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.px),
                                    borderSide: BorderSide(color: AppColors.grey300)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.px),
                                    borderSide: BorderSide(color: AppColors.grey300))),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter a valid phone number!';
                              }
                              return null;
                            },
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: height * 0.020),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     Image.asset('assets/images/search.png', height: 24),
                    //     SizedBox(width: width * 0.10),
                    //     Image.asset('assets/images/facebook.png', height: 24),
                    //   ],
                    // ),
                    SizedBox(height: height * 0.030),
                    roundButton(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const CodeSentScreen()));
                          }
                        },
                        textColor: AppColors.greyColor,
                        color: AppColors.grey300,
                        title: 'Get Verification code'),
                    SizedBox(height: 10.px),
                    Center(child: appText('Or Continue with', color: AppColors.hintGrey, fontSize: 18)),
                    const SizedBox(height: 10),
                    Row(
                      spacing: 10,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.push(
                                  context, MaterialPageRoute(builder: (context) => const PersonalDetailScreen()));
                            },
                            icon: Image.asset('assets/images/google.png', height: 30.px)),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.facebook,
                              size: 40.px,
                              color: AppColors.blueColor,
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
