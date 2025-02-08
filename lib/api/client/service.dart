import 'package:get/get.dart';
import 'api_client.dart';

class UserService {
  final ApiClient _apiClient;

  UserService(this._apiClient);

  Future<Response> getUserDetails() {
    return _apiClient.get('accounts/userDetail/');
  }

  Future<Response> postLogin(Map<String, dynamic> credentials) {
    return _apiClient.post('/login', credentials);
  }
}
