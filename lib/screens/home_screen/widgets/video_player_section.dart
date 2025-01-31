import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:video_player/video_player.dart';

import '../../../constants/colors.dart';
import '../../../widgets/custom_text.dart';

class VideoPlayerControllerGetX extends GetxController {
  final List<String> videoUrls = [
    'https://samplelib.com/lib/preview/mp4/sample-5s.mp4',
    'https://samplelib.com/lib/preview/mp4/sample-5s.mp4',
    'https://samplelib.com/lib/preview/mp4/sample-5s.mp4',
  ];
  final List<VideoPlayerController> controllers = [];
  final List<RxBool> isPlaying = [];

  @override
  void onInit() {
    super.onInit();
    for (var url in videoUrls) {
      controllers.add(VideoPlayerController.network(url));
      isPlaying.add(false.obs);
    }
    for (var controller in controllers) {
      controller.initialize().then((_) {
        update();
      });
    }
  }

  @override
  void onClose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.onClose();
  }

  void togglePlay(int index) {
    isPlaying[index].value = !isPlaying[index].value;
    if (isPlaying[index].value) {
      controllers[index].play();
    } else {
      controllers[index].pause();
    }
  }
}

Widget videoPlayerSection(BuildContext context) {
  final controllerGetX = Get.put(VideoPlayerControllerGetX());
  double height = MediaQuery.of(context).size.height;
  double width = MediaQuery.of(context).size.width;

  return Obx(() => Container(
        height: height * 0.43,
        color: AppColors.whiteTheme,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.px),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appText('Celebrating Professionals', fontSize: 20.px, fontWeight: FontWeight.bold),
              SizedBox(height: 8.px),
              appText('Real lives , real Impact', fontSize: 16.px),
              SizedBox(height: 16.px),
              SizedBox(
                height: height * 0.32,
                child: ListView.builder(
                  itemCount: controllerGetX.videoUrls.length,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    final controller = controllerGetX.controllers[index];
                    return Container(
                      width: width * .38,
                      margin: EdgeInsets.only(right: 10.px),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Stack(
                          children: [
                            controller.value.isInitialized
                                ? VideoPlayer(controller)
                                : const Center(child: CircularProgressIndicator()),
                            Align(
                              alignment: Alignment.center,
                              child: IconButton(
                                icon: Icon(
                                  controllerGetX.isPlaying[index].value ? Icons.pause : Icons.play_arrow,
                                  color: AppColors.whiteTheme,
                                  size: 30.px,
                                ),
                                onPressed: () => controllerGetX.togglePlay(index),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ));
}
