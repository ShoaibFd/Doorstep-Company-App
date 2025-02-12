import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../components/app_text.dart';
import '../../../constants/colors.dart';

class LuxeFloatingButtonController extends GetxController {
  var showButton = false.obs;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(milliseconds: 400), () {
      showButton.value = true;
    });
  }
}

class LuxeFloatingActionButton extends StatelessWidget {
  final Function(int index) onTap;
  final List<GlobalKey> keys;

  LuxeFloatingActionButton({super.key, required this.onTap, required this.keys});

  final LuxeFloatingButtonController controller = Get.put(LuxeFloatingButtonController());

  void _showMenuDialog(BuildContext context) {
    List services = [
      'Packages',
      'Make your package',
      'Waxing',
      'Facial & cleanup',
    ];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
            backgroundColor: AppColors.whiteTheme,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.px)),
            child: SizedBox(
                width: double.infinity, // Full width
                height: 290.px,
                child: Padding(
                    padding: EdgeInsets.all(10.px),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        SizedBox(
                            height: 270.px,
                            child: GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisExtent: 130.px,
                              ),
                              itemCount: keys.length,
                              itemBuilder: (context, index) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    GestureDetector(
                                        onTap: () => onTap(index),
                                        child: Container(
                                            width: 80.px,
                                            height: 80.px,
                                            margin: const EdgeInsets.symmetric(horizontal: 8),
                                            decoration: BoxDecoration(
                                                image: const DecorationImage(
                                                    image: NetworkImage(
                                                        'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZHVjdHxlbnwwfHwwfHx8MA%3D%3D'),
                                                    fit: BoxFit.cover),
                                                color: Colors.grey.shade200,
                                                borderRadius: BorderRadius.circular(10)))),
                                    const SizedBox(height: 8),
                                    SizedBox(
                                        height: 30.px,
                                        child: appText(services[index], textAlign: TextAlign.center, fontSize: 13.px)),
                                  ],
                                );
                              },
                            )),
                        Positioned(
                            top: 300.px,
                            right: 140.px,
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const CircleAvatar(
                                    backgroundColor: AppColors.whiteTheme, child: Icon(Icons.close))))
                      ],
                    ))));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// Animated Button
        Obx(() => AnimatedPositioned(
            duration: const Duration(milliseconds: 700),
            curve: Curves.bounceIn,
            bottom: controller.showButton.value ? 20.px : -50.px,
            left: MediaQuery.of(context).size.width / 2 - 50.px,
            child: SizedBox(
                width: 110.px,
                height: 36.px,
                child: ElevatedButton(
                    onPressed: () => _showMenuDialog(context),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.blackColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.px))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(Icons.menu, size: 20.px, color: AppColors.whiteTheme),
                        appText('Menu', color: AppColors.whiteTheme, fontWeight: FontWeight.bold),
                      ],
                    ))))),
      ],
    );
  }
}
