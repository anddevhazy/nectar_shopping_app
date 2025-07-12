import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_mart/core/theme/colors.dart';
import 'package:grocery_mart/core/theme/styled_text.dart';
import 'package:grocery_mart/features/cart/domain/entities/item_entity.dart';
import 'package:grocery_mart/features/cart/presentation/bloc/cart_cubit.dart';

class CartItemWidget extends StatelessWidget {
  final ItemEntity item;

  const CartItemWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 16.h),
      decoration: BoxDecoration(
        // color: AppColors.background,
        color: AppColors.white,

        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 60.w,
            height: 60.h,
            child: Image.asset(item.imagePath, fit: BoxFit.contain),
          ),

          SizedBox(width: 24.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                StyledText(
                  text: item.name,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.black,
                  letterSpacing: 0.sp,
                  height: 1.2,
                ),
                SizedBox(height: 20.h),
                StyledText(
                  text: item.description,
                  fontSize: 14.sp,
                  color: AppColors.lighterBlack,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.sp,
                  height: 1.2,
                ),
                SizedBox(height: 22.h),

                Row(
                  children: [
                    _buildQuantityButton(
                      context,
                      Icons.remove,
                      () => _updateQuantity(context, item.quantity - 1),
                    ),
                    SizedBox(width: 16.w),
                    StyledText(
                      text: '${item.quantity}',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.black,
                      letterSpacing: 0.sp,
                      height: 1.2,
                    ),
                    SizedBox(width: 16.w),
                    _buildQuantityButton(
                      context,
                      Icons.add,
                      () => _updateQuantity(context, item.quantity + 1),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => _showRemoveDialog(context),
                icon: const Icon(Icons.close, size: 20, color: Colors.grey),
              ),

              StyledText(
                text: item.price,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
                color: AppColors.black,
                letterSpacing: 0.sp,
                height: 1.2,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityButton(
    BuildContext context,
    IconData icon,
    VoidCallback onPressed,
  ) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 30.w,
        height: 30.h,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Icon(icon, size: 18.sp, color: AppColors.primary),
      ),
    );
  }

  void _updateQuantity(BuildContext context, int newQuantity) {
    if (newQuantity <= 0) {
      context.read<CartCubit>().removeFromCart(item);
    } else {
      context.read<CartCubit>().updateQuantity(item, newQuantity);
    }
  }

  void _showRemoveDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Remove Item'),
          content: Text('Remove ${item.name} from your cart?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                context.read<CartCubit>().removeFromCart(item);
                Navigator.of(context).pop();
              },
              child: const Text('Remove', style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}
