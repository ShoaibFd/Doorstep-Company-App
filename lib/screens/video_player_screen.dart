import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../theme/colors.dart';

class VideoSection extends StatefulWidget {
  @override
  _VideoSectionState createState() => _VideoSectionState();
}

class _VideoSectionState extends State<VideoSection> {
  // Sample video URLs for the ListView
  List<String> addimages = [
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    // Add more video URLs here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Reels Demo'),
      // ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemCount: addimages.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: GestureDetector(
                onTap: () {
                  // When a thumbnail is clicked, navigate to full-screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => FullScreenVideoPage(
                        videoUrl: addimages[index], // Pass the video URL
                      ),
                    ),
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 200, // Adjust the size as needed
                    width: 200,  // Adjust the size as needed
                    decoration: BoxDecoration(
                      color: AppColors.greyColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: VideoThumbnail(videoUrl: addimages[index]), // Thumbnails for preview
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Thumbnail Widget for video preview
class VideoThumbnail extends StatelessWidget {
  final String videoUrl;

  const VideoThumbnail({required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: AppColors.blackColor,
        child: const Icon(
          Icons.play_arrow,
          color: AppColors.whiteTheme,
          size: 50,
        ),
      ),
    );
  }
}
class FullScreenVideoPage extends StatefulWidget {
  final String videoUrl;

  const FullScreenVideoPage({Key? key, required this.videoUrl}) : super(key: key);

  @override
  _FullScreenVideoPageState createState() => _FullScreenVideoPageState();
}

class _FullScreenVideoPageState extends State<FullScreenVideoPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _controller.value.isInitialized
            ? GestureDetector(
          onTap: () {
            setState(() {
              if (_controller.value.isPlaying) {
                _controller.pause();
              } else {
                _controller.play();
              }
            });
          },
          child: AspectRatio(
            aspectRatio: _controller.value.aspectRatio,
            child: VideoPlayer(_controller),
          ),
        )
            : Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
