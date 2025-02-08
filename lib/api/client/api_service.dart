import 'package:get/get.dart';
import '../models/user_model.dart';
import 'api_client.dart';
import 'service.dart';

class UserController extends GetxController {
  late final UserService userService;

  var isLoading = false.obs;
  var userDetailResponse = Rxn<UserDetailResponse>(); // Observable model

  @override
  void onInit() {
    super.onInit();
    // Initialize ApiClient and UserService
    final apiClient = ApiClient();
    userService = UserService(apiClient);
  }

  Future<void> fetchUserDetails() async {
    isLoading.value = true;

    final response = await userService.getUserDetails();

    userDetailResponse.value=UserDetailResponse.fromJson(response.body);

    isLoading.value = false;
  }
}
