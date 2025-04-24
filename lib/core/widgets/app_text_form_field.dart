import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {

  final EdgeInsetsGeometry? contentPadding;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final TextStyle? inputTextStyle;
  final TextStyle? hintStyle;
  final String? hintText;
  final bool? isObscureText;
  final Widget? suffixIcon;
  final Color? backgroundColor;
  final TextEditingController? controller;
  Function(String)? onChanged;

   AppTextFormField({
    super.key,
    this.contentPadding,
    this.focusedBorder,
    this.enabledBorder,
    this.inputTextStyle,
    this.hintStyle,
    required this.hintText,
    this.isObscureText,
    this.suffixIcon,
    this.backgroundColor,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: hintText,
        isDense: true,
        border: OutlineInputBorder(
          borderRadius:BorderRadius.circular(25.0,),
        ),
        hintStyle: hintStyle ?? TextStyle(
          fontSize: 14.sp,
          color: Colors.black,
        ),
        hintText: hintText,
        suffixIcon: suffixIcon,
        filled: true,
      ),
      obscureText: isObscureText ?? false,
      style: TextStyle(
        fontSize: 14.sp,
        color: Colors.black,
      ),
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }
}
