import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'Constants/colors.dart';
import 'screens/splash_screen/splash_screen.dart';
import 'utils/dismiss_keyboard.dart';
import 'utils/location_services.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.black, statusBarIconBrightness: Brightness.light));
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Location Services
  await LocationServices().determinePosition();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return DismissKeyboard(
            child: GetMaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Door Step',
                theme: ThemeData(
                    appBarTheme: const AppBarTheme(
                        backgroundColor: AppColors.whiteTheme, surfaceTintColor: AppColors.whiteTheme),
                    primarySwatch: AppColors.blueColor,
                    scaffoldBackgroundColor: AppColors.whiteTheme,
                    textTheme: GoogleFonts.robotoTextTheme(Theme.of(context).textTheme)),
                home: const SplashScreen()));
      },
    );
  }
}
