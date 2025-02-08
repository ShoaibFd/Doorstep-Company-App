import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constants/colors.dart';
import '../../../components/custom_text.dart';

class AddButton extends StatefulWidget {
  final Function() onIncrement;
  final Function() onDecrement;
  final String count;
  final double? width;
  final double? height;
  final Color? borderColor;
  final Color? color;

  const AddButton({
    super.key,
    required this.onIncrement,
    required this.onDecrement,
    required this.count,
    this.width,
    this.height,
    this.borderColor,
    this.color,
  });

  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  final RxInt count = 0.obs;

  @override
  void initState() {
    super.initState();
    count.value = int.parse(widget.count);
  }

  @override
  void didUpdateWidget(AddButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.count != widget.count) {
      count.value = int.parse(widget.count);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (count.value == 0) {
          count.value = 1;
          widget.onIncrement();
        }
      },
      child: Obx(
        () => count.value > 0
            ? Container(
                height: widget.height ?? 32.px,
                width: widget.width ?? 80.px,
                decoration: BoxDecoration(
                  color: widget.color ?? AppColors.lowPurple.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8.px),
                  border: Border.all(color: AppColors.lowPurple),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        if (count.value == 1) {
                          count.value = 0;
                          widget.onDecrement();
                        } else if (count.value > 1) {
                          count.value -= 1;
                          widget.onDecrement();
                        }
                      },
                      child: const Icon(Icons.remove, size: 16, color: AppColors.lowPurple),
                    ),
                    appText(
                      count.value.toString(),
                      color: AppColors.lowPurple,
                      fontSize: 16.px,
                      fontWeight: FontWeight.bold,
                    ),
                    InkWell(
                      onTap: () {
                        count.value += 1;
                        widget.onIncrement();
                      },
                      child: const Icon(Icons.add, size: 16, color: AppColors.lowPurple),
                    ),
                  ],
                ),
              )
            : Container(
                height: widget.height ?? 32.px,
                width: widget.width ?? 76.px,
                decoration: BoxDecoration(
                  color: AppColors.whiteTheme,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: const Offset(0, 2),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(6.px),
                ),
                child: Center(
                  child: appText(
                    'Add',
                    fontWeight: FontWeight.bold,
                    color: AppColors.lowPurple,
                  ),
                ),
              ),
      ),
    );
  }
}
