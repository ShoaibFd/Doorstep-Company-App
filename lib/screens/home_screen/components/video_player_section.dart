import 'package:doorstep_company_app/utils/enum/reel_enum.dart';
import 'package:doorstep_company_app/components/app_text.dart';
import 'package:doorstep_company_app/components/show_loading.dart';
import 'package:doorstep_company_app/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:video_player/video_player.dart';

import '../../../api/controllers/banner/reels_controller.dart';

class VideoPlayerSection extends StatelessWidget {
  final ReelType reelType;
  final double? height;
  final double? width;

  const VideoPlayerSection({
    super.key,
    required this.reelType,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    // Create a GetX controller for this specific reel type
    final ReelsController reelsController = Get.put(
      ReelsController(reelType),
      tag: reelType.toString(), // Use tag to support multiple instances
    );

    // Use MediaQuery if no custom height/width is provided
    final screenHeight = MediaQuery.sizeOf(context).height;
    final screenWidth = MediaQuery.sizeOf(context).width;
    final sectionHeight = height ?? screenHeight * 0.32;
    final sectionWidth = width ?? screenWidth;

    return Obx(() {
      // Loading state
      if (reelsController.isLoading.value) {
        return SizedBox(
          height: sectionHeight,
          child: Center(child: showLoading()),
        );
      }

      // Error state
      if (reelsController.errorMessage.value.isNotEmpty) {
        return SizedBox(
          height: sectionHeight,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(reelsController.errorMessage.value),
                ElevatedButton(
                  onPressed: () => reelsController.refreshReels(),
                  child: const Text('Try Again'),
                ),
              ],
            ),
          ),
        );
      }

      // No videos available
      if (reelsController.reelsList.isEmpty) {
        return SizedBox(
          height: sectionHeight,
          child: Center(child: appText('No videos available')),
        );
      }

      // Video list
      return SizedBox(
        height: sectionHeight,
        child: ListView.builder(
          itemCount: reelsController.reelsList.length,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final reel = reelsController.reelsList[index];
            return VideoPlayerItem(
              reel: reel,
              width: sectionWidth * 0.38,
            );
          },
        ),
      );
    });
  }
}

class VideoPlayerItem extends StatefulWidget {
  final dynamic reel;
  final double width;

  const VideoPlayerItem({
    super.key,
    required this.reel,
    required this.width,
  });

  @override
  State<VideoPlayerItem> createState() => _VideoPlayerItemState();
}

class _VideoPlayerItemState extends State<VideoPlayerItem> {
  late VideoPlayerController _controller;
  bool _isVideoFinished = false;

  @override
  void initState() {
    super.initState();
    _initializeVideoController();
  }

  void _initializeVideoController() {
    if (widget.reel.video != null && widget.reel.video!.isNotEmpty) {
      _controller = VideoPlayerController.network(widget.reel.video!)
        ..initialize().then((_) {
          setState(() {});
        })
        ..setVolume(0.0);

      _controller.addListener(() {
        if (_controller.value.isInitialized && !_controller.value.isBuffering) {
          if (_controller.value.position >= _controller.value.duration) {
            setState(() {
              _isVideoFinished = true;
            });
          }
        }
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(
          MaterialPageRoute(
            builder: (context) => Scaffold(
              backgroundColor: Colors.black,
              appBar: AppBar(
                backgroundColor: Colors.black,
                leading: IconButton(
                  icon: const Icon(Icons.close, color: AppColors.whiteTheme),
                  onPressed: () => Navigator.pop(context),
                ),
                title: appText(widget.reel.title ?? '', color: AppColors.whiteTheme, fontWeight: FontWeight.bold),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          VideoPlayer(_controller),
                          if (_controller.value.isBuffering) const CircularProgressIndicator(color: Colors.white),
                          if (_isVideoFinished)
                            IconButton(
                                onPressed: () {
                                  setState(() {
                                    _isVideoFinished = false;
                                    _controller.seekTo(Duration.zero);
                                    _controller.play();
                                  });
                                },
                                icon: const Icon(Icons.refresh_rounded))
                        ],
                      ),
                    ),
                    if (widget.reel.description != null && widget.reel.description!.isNotEmpty)
                      Padding(
                        padding: EdgeInsets.all(16.px),
                        child: appText(widget.reel.description!,
                            color: AppColors.whiteTheme, textAlign: TextAlign.center, fontWeight: FontWeight.bold),
                      ),
                  ],
                ),
              ),
            ),
          ),
        )
            .then((_) {
          _controller.pause();
          _controller.seekTo(Duration.zero);
        });

        _controller.setVolume(1.0);
        _controller.play();
      },
      child: Container(
        width: widget.width,
        margin: EdgeInsets.only(right: 10.px),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Stack(
            children: [
              Positioned.fill(
                child: _controller.value.isInitialized ? VideoPlayer(_controller) : Center(child: appText('Loading..')),
              ),
              if (_isVideoFinished)
                Center(
                  child: IconButton(
                      onPressed: () {
                        setState(() {
                          _isVideoFinished = false;
                          _controller.seekTo(Duration.zero);
                          _controller.play();
                        });
                      },
                      icon: const Icon(Icons.refresh_rounded, color: AppColors.blueColor)),
                ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 8.px,
                    horizontal: 10.px,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        AppColors.blackColor.withOpacity(0.7),
                        Colors.transparent,
                      ],
                    ),
                  ),
                  child: appText(
                    widget.reel.title ?? '',
                    color: AppColors.whiteTheme,
                    fontSize: 14.px,
                    maxLines: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
