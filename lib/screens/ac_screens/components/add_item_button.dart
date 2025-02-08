import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddItemButton extends StatelessWidget {
  final String? image;
  final Widget? addButton;
  final Widget? optionWidget;
  final EdgeInsetsGeometry? margin;
  const AddItemButton({super.key, this.image, this.addButton, this.optionWidget, this.margin});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      image == null
          ? SizedBox()
          : Container(
              width: 100.px,
              height: 90.px,
              margin: margin,
              decoration: BoxDecoration(
                  image: image != null ? DecorationImage(image: NetworkImage(image!), fit: BoxFit.cover) : null,
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10)),
            ),
      Container(margin: EdgeInsets.only(left: 14, top: image == null ? 0 : 90), child: addButton),
      Container(margin: EdgeInsets.only(left: 20, top: image == null ? 70 : 130), child: optionWidget)
    ]);
  }
}
