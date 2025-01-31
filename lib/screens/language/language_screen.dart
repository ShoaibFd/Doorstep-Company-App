import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as google_maps;
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../widgets/custom_text.dart';
import '../../widgets/round_button.dart';
import '../auth/authentication_screen.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  _LanguageScreenState createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String? selectedLanguage;

  final List<Map<String, String>> languages = [
    {'name': 'Pakistan', 'language': 'Urdu', 'flag': '🇵🇰'},
    {'name': 'United States', 'language': 'English', 'flag': '🇺🇸'},
  ];
  google_maps.GoogleMapController? mapController;
  google_maps.LatLng? selectedLocation;
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
      selectedLocation = currentLocation;
    });
    mapController?.animateCamera(google_maps.CameraUpdate.newLatLng(currentLocation!));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: appText('Language Selection', fontSize: 18.px, fontWeight: FontWeight.bold)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.px),
        child: Column(
          children: [
            ListView.separated(
              itemCount: languages.length,
              shrinkWrap: true,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                final language = languages[index];
                return ListTile(
                  leading: appText(language['flag']!, fontSize: 24),
                  title: appText('${language['name']} (${language['language']})'),
                  trailing: Radio<String>(
                    value: language['name']!,
                    groupValue: selectedLanguage,
                    onChanged: (value) {
                      setState(() {
                        selectedLanguage = value;
                      });
                    },
                  ),
                );
              },
            ),
            const Spacer(),
            roundButton(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => BottomNavigationScreen(
                  //       latitude: currentLocation?.latitude,
                  //       longitude: currentLocation?.longitude,
                  //     ),
                  //   ),
                  // );
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const AuthenticationScreen()));
                },
                title: 'Save and continue'),
            SizedBox(height: 10.px)
          ],
        ),
      ),
    );
  }
}
