import 'dart:io';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class EditProfileController extends GetxController {
  var selectedCity = 'Multan'.obs;
  var pickedImage = Rx<File?>(null);
  final List<String> cities = ['Multan', 'Lahore', 'Karachi', 'Islamabad', 'Peshawar', 'Sargodha', 'Faisalabad'];

  @override
  void onInit() {
    super.onInit();
    _checkPermissions();
  }

  Future<void> _checkPermissions() async {
    if (Platform.isAndroid) {
      if (await Permission.storage.status.isDenied || await Permission.photos.status.isDenied) {
        await [Permission.storage, Permission.photos].request();
      }
    }
  }

  Future<void> pickImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      pickedImage.value = File(pickedFile.path);
    } else {
      pickedImage.value = null;
    }
  }
}
