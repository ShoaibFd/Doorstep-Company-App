import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../components/app_text.dart';
import '../../components/custom_snackbar.dart';
import '../../theme/colors.dart';

class VideoCallScreen extends StatefulWidget {
  final String channelName;
  final String token;
  final int userId;

  const VideoCallScreen({
    super.key,
    required this.channelName,
    required this.token,
    required this.userId,
  });

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  late final RtcEngine _engine;
  bool _isInitialized = false;
  bool _isJoined = false;
  int? _remoteUid;
  bool _localVideoMuted = false;
  bool _localAudioMuted = false;

  @override
  void initState() {
    super.initState();
    _initializeAgora();
  }

  Future<void> _initializeAgora() async {
    try {
      // Request permissions
      final permissions = await [
        Permission.camera,
        Permission.microphone,
      ].request();

      // Check if any permission was denied
      final denied = permissions.values.any(
        (status) => status != PermissionStatus.granted,
      );

      if (denied) {
        if (mounted) {
          showInfoSnackbar(context, 'Camera and microphone permissions are required');
          Navigator.pop(context);
        }
        return;
      }

      // Initialize Agora engine
      _engine = createAgoraRtcEngine();
      await _engine.initialize(const RtcEngineContext(
        appId: "527269a890294b43aecf5fc006d348f7",
      ));

      // Set up event handlers
      _engine.registerEventHandler(
        RtcEngineEventHandler(
          onJoinChannelSuccess: (connection, elapsed) {
            if (mounted) {
              setState(() => _isJoined = true);
            }
          },
          onUserJoined: (connection, uid, elapsed) {
            if (mounted) {
              setState(() => _remoteUid = uid);
            }
          },
          onUserOffline: (connection, uid, reason) {
            if (mounted) {
              setState(() => _remoteUid = null);
            }
          },
          onError: (err, msg) {
            if (mounted) {
              showInfoSnackbar(context, 'Error: $msg');
            }
          },
        ),
      );

      // Enable video
      await _engine.enableVideo();
      await _engine.startPreview();

      // Join the channel
      await _engine.joinChannel(
        token: widget.token,
        channelId: widget.channelName,
        uid: widget.userId,
        options: const ChannelMediaOptions(),
      );

      if (mounted) {
        setState(() => _isInitialized = true);
      }
    } catch (e) {
      if (mounted) {
        showInfoSnackbar(context, 'Failed to initialize: $e');
        Navigator.pop(context);
      }
    }
  }

  Future<void> _toggleLocalVideo() async {
    if (!_isInitialized) return;

    setState(() => _localVideoMuted = !_localVideoMuted);
    await _engine.muteLocalVideoStream(_localVideoMuted);
  }

  Future<void> _toggleLocalAudio() async {
    if (!_isInitialized) return;

    setState(() => _localAudioMuted = !_localAudioMuted);
    await _engine.muteLocalAudioStream(_localAudioMuted);
  }

  Future<void> _endCall() async {
    if (_isInitialized) {
      await _engine.leaveChannel();
    }
    if (mounted) {
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    if (_isInitialized) {
      _engine.leaveChannel();
      _engine.release();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await _endCall();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
            title: appText('Muhammad Shoaib', fontSize: 18, fontWeight: FontWeight.w400),
            automaticallyImplyLeading: false),
        body: _isInitialized
            ? Stack(
                children: [
                  // Remote video
                  Center(
                    child: _remoteUid != null
                        ? AgoraVideoView(
                            controller: VideoViewController(rtcEngine: _engine, canvas: VideoCanvas(uid: _remoteUid)))
                        : Center(
                            child: appText('Waiting for other user...', fontSize: 18),
                          ),
                  ),
                  // Local video
                  Positioned(
                      top: 16,
                      right: 16,
                      child: Container(
                          width: 120,
                          height: 160,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.white, width: 2),
                              borderRadius: BorderRadius.circular(8)),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(6),
                              child: _localVideoMuted
                                  ? const ColoredBox(
                                      color: AppColors.lightBlack,
                                      child: Center(
                                          child: Icon(Icons.videocam_off, color: AppColors.whiteTheme, size: 32)))
                                  : AgoraVideoView(
                                      controller:
                                          VideoViewController(rtcEngine: _engine, canvas: const VideoCanvas(uid: 0))))))
                ],
              )
            : Center(child: Center(child: appText('Calling! please wait'))),
        bottomNavigationBar: _isInitialized
            ? SafeArea(
                child: Container(
                    padding: const EdgeInsets.all(16),
                    color: AppColors.lightBlack,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                            onPressed: _toggleLocalAudio,
                            icon: Icon(_localAudioMuted ? Icons.mic_off : Icons.mic, color: AppColors.whiteTheme)),
                        FloatingActionButton(
                            onPressed: _endCall,
                            backgroundColor: AppColors.redColor,
                            child: const Icon(Icons.call_end_sharp, color: AppColors.whiteTheme)),
                        IconButton(
                            onPressed: _toggleLocalVideo,
                            icon: Icon(_localVideoMuted ? Icons.videocam_off : Icons.videocam,
                                color: AppColors.whiteTheme))
                      ],
                    )))
            : null,
      ),
    );
  }
}
