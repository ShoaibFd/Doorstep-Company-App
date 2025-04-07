import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../components/app_text.dart';
import '../../components/show_loading.dart';

class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  final controller = Get.put(AboutUsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: appText('About Us', fontSize: 18)),
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
class AboutUsController extends GetxController {
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
    await controller.loadRequest(Uri.parse('https://flutter.dev'));
  }
}
