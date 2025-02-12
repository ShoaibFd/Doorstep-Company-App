import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/colors.dart';
import '../../components/custom_container.dart';
import '../../components/app_text.dart';
import 'video_call_screen.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController messageController = TextEditingController();
  final List<String> messages = [];

  // Method to handle sending messages
  void sendMessage() {
    if (messageController.text.isNotEmpty) {
      setState(() {
        messages.add(messageController.text);
      });
      messageController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: appText('Muhammad Shoaib', fontSize: 18.px, fontWeight: FontWeight.w400),
          actions: [
            GestureDetector(
                onTap: () {
                  showCenteredAlertDialog(context);
                },
                child: Container(
                    margin: EdgeInsets.only(right: 20.px),
                    height: 50.px,
                    width: 50.px,
                    decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: AppColors.grey300)),
                    child: Center(child: Icon(Icons.videocam, size: 30.px))))
          ],
        ),
        body: Column(
          children: [
            Expanded(
                child: messages.isEmpty
                    ? Center(child: appText('No messages yet', fontSize: 16.px, color: AppColors.greyColor))
                    : ListView.builder(
                        padding: EdgeInsets.symmetric(horizontal: 10.px, vertical: 8.px),
                        itemCount: messages.length,
                        // reverse: true,
                        itemBuilder: (context, index) {
                          return Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                  margin: EdgeInsets.symmetric(vertical: 4.px),
                                  padding: EdgeInsets.symmetric(horizontal: 12.px, vertical: 8.px),
                                  decoration: BoxDecoration(
                                      color: AppColors.lowPurple.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(30.px)),
                                  child: appText(
                                    messages[index],
                                  )));
                        },
                      )),
            // Input field and send button
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.px, vertical: 8.px),
                child: Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                            controller: messageController,
                            cursorColor: AppColors.blueColor,
                            decoration: InputDecoration(
                                hintText: 'Type your message...',
                                filled: true,
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.px),
                                    borderSide: const BorderSide(color: AppColors.transparentColor)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.px),
                                    borderSide: const BorderSide(color: AppColors.transparentColor)),
                                fillColor: AppColors.grey300.withOpacity(0.4),
                                contentPadding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 12)))),
                    SizedBox(width: 10.px),
                    IconButton(onPressed: sendMessage, icon: const Icon(Icons.send, color: AppColors.blueColor))
                  ],
                ))
          ],
        ));
  }

  // Method to display the video call alert dialog
  void showCenteredAlertDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          title: appText('Video call', fontSize: 20, fontWeight: FontWeight.w400),
          content: appText('Do you want to make a video call?', fontSize: 16, color: Colors.grey),
          actionsAlignment: MainAxisAlignment.center,
          actions: [
            CustomContainer(
                onTap: () {
                  Navigator.pop(context);
                },
                height: 40.px,
                width: 80.px,
                color: AppColors.transparentColor,
                borderColor: AppColors.lowPurple,
                borderRadius: 40.px,
                child: Center(child: appText('Go Back', fontSize: 16.px, color: AppColors.lowPurple))),
            CustomContainer(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              const VideoCallScreen(channelName: 'Shoaib', token: 'fcdgdgfdgfahha', userId: 3)));
                },
                height: 40.px,
                width: 100.px,
                color: AppColors.lowPurple,
                borderRadius: 40.px,
                child: Center(child: appText('Video Call', fontSize: 16.px, color: AppColors.whiteTheme)))
          ],
        );
      },
    );
  }
}
