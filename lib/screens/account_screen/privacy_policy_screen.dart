import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../components/app_text.dart';
import '../../components/show_loading.dart';

class PrivacyPolicyScreen extends StatefulWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  State<PrivacyPolicyScreen> createState() => _PrivacyPolicyScreenState();
}

class _PrivacyPolicyScreenState extends State<PrivacyPolicyScreen> {
  final controller = Get.put(PrivacyPolicyController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: appText('Privacy Policy', fontSize: 18)),
        body: Obx(() {
          if (controller.isLoading.value) {
            return Center(child: showLoading());
          }
          return Stack(
            children: [
              WebViewWidget(controller: controller.controller),
            ],
          );
        }));
  }
}

// About Us controller
class PrivacyPolicyController extends GetxController {
  var isLoading = true.obs;
  late final WebViewController controller;
  @override
  void onInit() {
    _initializeWebView();
    super.onInit();
  }

  Future<void> _initializeWebView() async {
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            isLoading(true);
          },
          onPageFinished: (String url) {
            isLoading(false);
          },
        ),
      );
    await controller.loadRequest(Uri.parse('https://extbuy.om/'));
  }
}
