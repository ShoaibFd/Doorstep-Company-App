import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../components/app_text.dart';
import '../../components/show_loading.dart';

class PaymentAndRefundPolicyScreen extends StatefulWidget {
  const PaymentAndRefundPolicyScreen({super.key});

  @override
  State<PaymentAndRefundPolicyScreen> createState() => _PaymentAndRefundPolicyScreenState();
}

class _PaymentAndRefundPolicyScreenState extends State<PaymentAndRefundPolicyScreen> {
  final controller = Get.put(PaymentAndRefundPolicyController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: appText('Payment and refund policy', fontSize: 18.sp)),
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

// Payment and refund policy controller
class PaymentAndRefundPolicyController extends GetxController {
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
