import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../widgets/custom_text.dart';

class Services extends StatelessWidget {
  final VoidCallback? onTap;
  final String? image;
  final String serviceName;

  const Services({
    super.key,
    required this.onTap,
    required this.serviceName,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(height: 6),
        GestureDetector(
          onTap: onTap,
          child: Container(
            width: 80.px,
            height: 80.px,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              image: image != null
                  ? DecorationImage(
                      image: NetworkImage(image!),
                      fit: BoxFit.cover,
                    )
                  : null,
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(10),
            ),
            child: image == null ? Icon(Icons.image, size: 35, color: Colors.grey.shade600) : null,
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 30.px,
          child: appText(
            serviceName,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
