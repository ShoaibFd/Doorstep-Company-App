import 'package:doorstep_company_app/components/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerSection extends StatefulWidget {
  const VideoPlayerSection({super.key});

  @override
  State<VideoPlayerSection> createState() => _VideoPlayerSectionState();
}

class _VideoPlayerSectionState extends State<VideoPlayerSection> {
  final List<String> videoUrls = [
    'https://samplelib.com/lib/preview/mp4/sample-5s.mp4',
    'https://samplelib.com/lib/preview/mp4/sample-5s.mp4',
    'https://samplelib.com/lib/preview/mp4/sample-5s.mp4',
  ];

  final List<VideoPlayerController> _controllers = [];
  final List<bool> _isVideoFinished = [];

  @override
  void initState() {
    super.initState();
    for (var url in videoUrls) {
      final controller = VideoPlayerController.network(url)
        ..initialize().then((_) {
          setState(() {});
        })
        ..setVolume(0.0); // Set initial volume to 0

      controller.addListener(() {
        if (controller.value.isInitialized && !controller.value.isBuffering) {
          if (controller.value.position >= controller.value.duration) {
            setState(() {
              _isVideoFinished[_controllers.indexOf(controller)] = true;
            });
          }
        }
      });

      _controllers.add(controller);
      _isVideoFinished.add(false);
    }
  }

  @override
  void dispose() {
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  int? hoveredVideoIndex;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;
    double width = MediaQuery.sizeOf(context).width;
    return SizedBox(
      height: height * 0.32,
      child: ListView.builder(
        itemCount: videoUrls.length,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final controller = _controllers[index];
          final isVideoFinished = _isVideoFinished[index];
          return MouseRegion(
            onEnter: (_) {
              setState(() {
                hoveredVideoIndex = index;
                controller.setVolume(0.0);
                controller.play();
              });
            },
            onExit: (_) {
              setState(() {
                hoveredVideoIndex = null;
                controller.pause();
                controller.seekTo(Duration.zero);
              });
            },
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(
                  MaterialPageRoute(
                    builder: (context) => Scaffold(
                      backgroundColor: Colors.black,
                      appBar: AppBar(
                        backgroundColor: Colors.black,
                        leading: IconButton(
                          icon: const Icon(Icons.close, color: Colors.white),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                      body: Center(
                        child: AspectRatio(
                          aspectRatio: controller.value.aspectRatio,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              VideoPlayer(controller),
                              if (controller.value.isBuffering) const CircularProgressIndicator(color: Colors.white),
                              if (isVideoFinished)
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      _isVideoFinished[index] = false;
                                      controller.seekTo(Duration.zero);
                                      controller.play();
                                    });
                                  },
                                  child: appText('Watch Again'),
                                ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                )
                    .then((_) {
                  controller.pause();
                  controller.seekTo(Duration.zero);
                });

                controller.setVolume(1.0); // Enable sound
                controller.play();
              },
              child: Container(
                width: width * .38,
                margin: EdgeInsets.only(right: 10.px),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Stack(
                    children: [
                      Positioned.fill(
                        child: controller.value.isInitialized
                            ? VideoPlayer(controller)
                            : Center(child: appText('Loading..')),
                      ),
                      if (isVideoFinished)
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _isVideoFinished[index] = false;
                                controller.seekTo(Duration.zero);
                                controller.play();
                              });
                            },
                            child: const Text('Watch Again'),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
