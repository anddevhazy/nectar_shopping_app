import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_mart/core/theme/colors.dart';
import 'package:grocery_mart/core/theme/styled_text.dart';
import 'package:grocery_mart/features/cart/domain/entities/item_entity.dart';
import 'package:grocery_mart/features/cart/presentation/bloc/cart_cubit.dart';

Widget buildProductCard(
  BuildContext context,
  String name,
  String subtitle,
  String price,
  String imagePath,
) {
  return Container(
    width: 160.w,
    margin: const EdgeInsets.only(right: 16),
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16.r),
      border: Border.all(color: Colors.grey[300]!),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: SizedBox(
            width: 80,
            height: 80,
            child: Image.asset(imagePath, fit: BoxFit.contain),
          ),
        ),

        SizedBox(height: 30.h),
        StyledText(
          text: name,
          fontSize: 16.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.black,
          letterSpacing: 0.1.sp,
          height: 18.sp,
        ),
        SizedBox(height: 5.h),
        StyledText(
          text: subtitle,
          fontSize: 14.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.lighterBlack,
          letterSpacing: 0.0.sp,
          height: 18.sp,
        ),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StyledText(
              text: price,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
              letterSpacing: 0.1.sp,
              height: 18.sp,
            ),
            GestureDetector(
              onTap: () {
                final item = ItemEntity(
                  name: name,
                  description: subtitle,
                  price: price,
                  imagePath: imagePath,
                  quantity: 1,
                );
                context.read<CartCubit>().addToCart(item);
              },
              child: Container(
                width: 45.h,
                height: 45.h,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(17.r),
                ),
                child: const Icon(Icons.add, color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
