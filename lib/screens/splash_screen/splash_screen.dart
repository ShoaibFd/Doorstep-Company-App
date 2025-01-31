import 'dart:async';

import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../auth/authentication_screen.dart';
import '../language/language_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LanguageScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: AppColors.splashPurple,
      body: Padding(
        padding: const EdgeInsets.all(48.0),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                    height: height * 0.1,
                    width: height * 0.25,
                    decoration: BoxDecoration(
                      color: AppColors.blackColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(height * 0.24),
                        topRight: Radius.circular(height * 0.24),
                        bottomLeft: Radius.circular(height * 0.24),
                        bottomRight: Radius.circular(height * 0.24),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: "DOORSTEP\n",
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: AppColors.whiteTheme,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: "        Company",
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: AppColors.lowPurple,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: ".",
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: AppColors.whiteTheme,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
