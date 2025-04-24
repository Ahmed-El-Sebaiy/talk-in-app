import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:talk_in_app/core/theming/colors.dart';
import 'package:talk_in_app/core/theming/font_weight_helper.dart';

class TextStyles{

  static TextStyle font24Black700Weight = TextStyle(
    fontSize: 24.sp,
    color: Colors.black,
    fontWeight: FontWeight.w700,
  );

  static TextStyle font32BlueBold = TextStyle(
    fontSize: 32.sp,
    color: ColorsManager.mainBlue,
    fontWeight: FontWeight.bold,
  );

  static TextStyle font24BlueBold = TextStyle(
    fontSize: 24.sp,
    color: ColorsManager.mainBlue,
    fontWeight: FontWeightHelper.fontWeights['bold'],
  );

  static TextStyle font13GrayRegular = TextStyle(
    fontSize: 13.sp,
    color: ColorsManager.gray,
    fontWeight: FontWeight.normal,
  );

  static TextStyle font13BlueRegular = TextStyle(
    fontSize: 13.sp,
    color: ColorsManager.mainBlue,
    fontWeight: FontWeightHelper.fontWeights['regular'],
  );

  static TextStyle font14GrayRegular = TextStyle(
    fontSize: 14.sp,
    color: ColorsManager.gray,
    fontWeight: FontWeightHelper.fontWeights['regular'],
  );

  static TextStyle font14LightGrayRegular = TextStyle(
    fontSize: 14.sp,
    color: ColorsManager.lightGray,
    fontWeight: FontWeightHelper.fontWeights['regular'],
  );

  static TextStyle font14DarkBlueMedium = TextStyle(
    fontSize: 14.sp,
    color: ColorsManager.darkBlue,
    fontWeight: FontWeightHelper.fontWeights['medium'],
  );

  static TextStyle font16WhiteSemiBold = TextStyle(
    fontSize: 16.sp,
    color: Colors.white,
    fontWeight: FontWeight.w500,
  );

}