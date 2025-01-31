import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/colors.dart';
import '../../widgets/custom_text.dart';

class FloatingButtonController extends GetxController {
  var showButton = false.obs;

  @override
  void onInit() {
    super.onInit();
    Future.delayed(Duration(milliseconds: 400), () {
      showButton.value = true;
    });
  }
}

class FloatingActionButtonWidget extends StatelessWidget {
  final Function(int index) onTap;
  final List<GlobalKey> keys;

  FloatingActionButtonWidget({super.key, required this.onTap, required this.keys});

  final FloatingButtonController controller = Get.put(FloatingButtonController());

  void _showMenuDialog(BuildContext context) {
    List services = [
      'Packages',
      'Services',
      'Repair & gas refill',
      'Installation/Uninstallation',
    ];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: AppColors.whiteTheme,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.px)),
          child: SizedBox(
            height: 260.px,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.all(10.px),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  SizedBox(
                    height: 200,
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        mainAxisExtent: 110,
                      ),
                      itemCount: keys.length,
                      itemBuilder: (context, index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () => onTap(index), // Pass index to onTap
                              child: Container(
                                width: 80.px,
                                height: 80.px,
                                margin: const EdgeInsets.symmetric(horizontal: 8),
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image: NetworkImage(
                                      'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZHVjdHxlbnwwfHwwfHx8MA%3D%3D',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            SizedBox(height: 8),
                            appText(services[index])
                          ],
                        );
                      },
                    ),
                  ),
                  Positioned(
                    top: 270.px,
                    right: 140.px,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const CircleAvatar(
                        backgroundColor: AppColors.whiteTheme,
                        child: Icon(Icons.close),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        /// Animated Button
        Obx(() => AnimatedPositioned(
              duration: Duration(milliseconds: 700),
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
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.px),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.menu, size: 20.px, color: AppColors.whiteTheme),
                      appText('Menu', color: AppColors.whiteTheme, fontWeight: FontWeight.bold),
                    ],
                  ),
                ),
              ),
            )),
      ],
    );
  }
}
