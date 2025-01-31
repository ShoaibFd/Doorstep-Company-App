import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class AgoraEngineManager {
  static Future<RtcEngine> createEngine({
    required String appId,
    required Function(String) onError,
  }) async {
    try {
      RtcEngine engine = createAgoraRtcEngine();

      await engine.initialize(RtcEngineContext(
        appId: appId,
        logConfig: const LogConfig(
          level: LogLevel.logLevelInfo,
        ),
        areaCode: AreaCode.areaCodeGlob.value(),
      ));

      await engine.setParameters(
          '{"che.video.lowBitRateStreamParameter":{"width":320,"height":180,"frameRate":15,"bitRate":140}}');

      await engine.enableVideo();
      await engine.setVideoEncoderConfiguration(
        const VideoEncoderConfiguration(
          dimensions: VideoDimensions(width: 640, height: 360),
          frameRate: 15,
          bitrate: 0, // Use adaptive bitrate
        ),
      );

      return engine;
    } catch (e) {
      onError('Engine initialization failed: $e');
      rethrow;
    }
  }

  static Future<bool> checkPermissions(BuildContext context) async {
    final permissions = await [
      Permission.camera,
      Permission.microphone,
    ].request();

    final allGranted = permissions.values.every(
      (status) => status == PermissionStatus.granted,
    );

    if (!allGranted) {
      if (context.mounted) {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => AlertDialog(
            title: const Text('Permissions Required'),
            content: const Text(
              'Camera and microphone permissions are required for video calls. '
              'Please enable them in your device settings.',
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  openAppSettings();
                },
                child: const Text('Open Settings'),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
            ],
          ),
        );
      }
      return false;
    }
    return true;
  }
}
