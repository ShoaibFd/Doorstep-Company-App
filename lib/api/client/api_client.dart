import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';

class ApiClient extends GetConnect {
  ApiClient() {
    // Set the base URL for all API requests
    baseUrl = 'https://mystudioitsolutions.com/api/';

    // Add global headers if needed
    httpClient.defaultContentType = 'application/json';

    // Intercept requests
    httpClient.addRequestModifier<dynamic>((request) async {
      return onRequestInterceptor(request);
    });

    // Intercept responses
    httpClient.addResponseModifier((request, response) {
      return onResponseInterceptor(request, response);
    });
  }

  Future<Request<dynamic>> onRequestInterceptor(
      Request<dynamic> request) async {
    // Add headers, authentication tokens, or log the request
    request.headers['Authorization'] =
        'Token 05d20c73feb0fd108ad92578deda7fd7a66dc068';
    request.headers['Accept'] = 'application/json';

    return request;
  }

  Response onResponseInterceptor(Request request, Response response) {
    // Handle response globally, if needed
    return response;
  }
}
