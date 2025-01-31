import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants/colors.dart';

class TopSnackbar extends StatefulWidget {
  final String message;
  final Color backgroundColor;
  final IconData icon;

  const TopSnackbar({
    super.key,
    required this.message,
    required this.backgroundColor,
    required this.icon,
  });

  @override
  _TopSnackbarState createState() => _TopSnackbarState();
}

class _TopSnackbarState extends State<TopSnackbar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, -1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOut,
    ));

    _showSnackbar();
  }

  void _showSnackbar() {
    _controller.forward();
    Future.delayed(const Duration(seconds: 3), () {
      _controller.reverse();
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.px),
        child: Material(
          color: widget.backgroundColor,
          elevation: 6,
          borderRadius: BorderRadius.circular(8.px),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.px, vertical: 12.px),
            child: Row(
              children: [
                Icon(widget.icon, color: AppColors.whiteTheme),
                SizedBox(width: 8.px),
                Expanded(
                    child: Text(widget.message, style: const TextStyle(color: AppColors.whiteTheme, fontSize: 16))),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Function to show a success snackbar
void showSuccessSnackbar(BuildContext context, String message) {
  showTopSnackbar(context, message, color: AppColors.greenColor, icon: Icons.check_circle);
}

// Function to show an error snackbar
void showErrorSnackbar(BuildContext context, String message) {
  showTopSnackbar(
    context,
    message,
    color: AppColors.redColor,
    icon: Icons.error,
  );
}

// Helper function to insert snackbar into overlay
void showTopSnackbar(BuildContext context, String message, {required Color color, required IconData icon}) {
  final overlay = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top,
        left: 0,
        right: 0,
        child: TopSnackbar(message: message, backgroundColor: color, icon: icon)),
  );

  overlay.insert(overlayEntry);

  Future.delayed(const Duration(seconds: 3), () {
    overlayEntry.remove();
  });
}
