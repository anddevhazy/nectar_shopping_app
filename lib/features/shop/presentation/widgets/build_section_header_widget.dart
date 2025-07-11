import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_mart/core/theme/colors.dart';
import 'package:grocery_mart/core/theme/styled_text.dart';

Widget buildSectionHeader(String title) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        StyledText(
          text: title,
          fontSize: 24.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.black,
          letterSpacing: 0.sp,
          height: 24.sp,
        ),
        StyledText(
          text: 'see all',
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          color: AppColors.primary,
          letterSpacing: 0.sp,
          height: 24.sp,
        ),
      ],
    ),
  );
}
