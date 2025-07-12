import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_mart/core/theme/colors.dart';
import 'package:grocery_mart/core/theme/styled_text.dart';

class CheckoutButtonWidget extends StatelessWidget {
  final double totalPrice;
  final VoidCallback onCheckout;

  const CheckoutButtonWidget({
    super.key,
    required this.totalPrice,
    required this.onCheckout,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              StyledText(
                text: 'Total:',
                fontSize: 18.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
                letterSpacing: 0.sp,
                height: 16.sp,
              ),
              StyledText(
                text: '\$${totalPrice.toStringAsFixed(2)}',
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
                letterSpacing: 0.sp,
                height: 20.sp,
              ),
            ],
          ),
          SizedBox(height: 16.h),
          SizedBox(
            width: double.infinity,
            height: 50.h,
            child: ElevatedButton(
              onPressed: onCheckout,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
              ),
              child: StyledText(
                text: 'Go to Checkout',
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                height: 16.sp,
                letterSpacing: 0.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
