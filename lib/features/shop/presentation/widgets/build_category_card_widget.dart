import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_mart/core/theme/colors.dart';
import 'package:grocery_mart/core/theme/styled_text.dart';

Widget buildCategoryCard(
  String title,
  Color backgroundColor,
  String imagePath,
) {
  return Container(
    width: 240.w,
    height: 80.h,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(16.r),
    ),
    child: Row(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: ClipOval(
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover,
              width: 40,
              height: 40,
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: StyledText(
            text: title,
            fontSize: 20.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.lighterBlack,
            letterSpacing: 0.sp,
            height: 20.sp,
          ),
        ),
      ],
    ),
  );
}
