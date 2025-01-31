import 'package:flutter/material.dart';

import '../../constants/colors.dart';

Widget appTextField(
    {String? hint,
    TextEditingController? controller,
    IconData? prefixIcon,
    Widget? suffixIcon,
    Widget? prefix,
    bool? readOnly,
    int? maxLength,
    Color? focusColor,
    bool? obsecure,
    void Function()? onTap,
    String? Function(String?)? validator,
    TextInputType? keyboardType}) {
  return TextFormField(
    onTap: onTap,
    maxLines: maxLength,
    obscureText: obsecure ?? false,
    readOnly: readOnly ?? false,
    validator: validator,
    controller: controller,
    keyboardType: keyboardType,
    textInputAction: TextInputAction.next,
    cursorColor: AppColors.blueColor,
    decoration: InputDecoration(
        isDense: true,
        prefix: prefix,
        fillColor: AppColors.grey300.withOpacity(0.3),
        filled: true,
        errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: AppColors.redColor)),
        prefixIcon: Icon(prefixIcon, color: AppColors.blueColor),
        hintText: hint,
        hintStyle: TextStyle(color: AppColors.hintGrey),
        suffixIcon: suffixIcon,
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: focusColor ?? AppColors.transparentColor, width: 2)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: AppColors.grey300, width: 1.2))),
  );
}
