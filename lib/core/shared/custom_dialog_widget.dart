import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_mart/core/theme/colors.dart';
import 'package:grocery_mart/core/theme/styled_text.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String content;
  final String cancelText;
  final String actionText;
  final Color actionTextColor;
  final VoidCallback onCancel;
  final VoidCallback onAction;

  const CustomDialog({
    super.key,
    required this.title,
    required this.content,
    this.cancelText = 'Cancel',
    required this.actionText,
    this.actionTextColor = Colors.red,
    required this.onCancel,
    required this.onAction,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      backgroundColor: AppColors.background,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 8.h),

            StyledText(
              text: title,
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
              height: 1.2,
              letterSpacing: 0.sp,
            ),
            SizedBox(height: 32.h),
            StyledText(
              text: content,
              fontSize: 16.sp,
              fontWeight: FontWeight.normal,
              color: AppColors.lighterBlack,
              height: 1.2,
              letterSpacing: 0.sp,
            ),
            SizedBox(height: 12.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                  onPressed: onCancel,
                  child: StyledText(
                    text: cancelText,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.grey[600]!,
                    height: 1.2,
                    letterSpacing: 0.sp,
                  ),
                ),
                SizedBox(width: 16.w),
                TextButton(
                  onPressed: onAction,
                  child: StyledText(
                    text: actionText,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: actionTextColor,
                    height: 1.2,
                    letterSpacing: 0.sp,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
