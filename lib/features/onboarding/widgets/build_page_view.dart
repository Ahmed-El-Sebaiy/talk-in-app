import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talk_in_app/core/helpers/spacing.dart';

Widget buildPageView({required String image, required String text}) {
  return Padding(
    padding: const EdgeInsets.all(30.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image, height: 300.h),
        verticalSpace(40.h),
        Text(
          text,
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    ),
  );
}