import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_mart/core/shared/custom_dialog_widget.dart';
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
      height: 110.h,
      decoration: BoxDecoration(color: AppColors.background),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 60.w,
            height: 60.h,
            child: Image.asset(item.imagePath, fit: BoxFit.contain),
          ),

          SizedBox(width: 24.w),

          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                SizedBox(height: 8.h),
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

          SizedBox(width: 120.w),

          SizedBox(
            height: 110.h,
            // width: 120.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () => _showRemoveDialog(context),
                  icon: const Icon(Icons.close, size: 20, color: Colors.grey),
                ),

                Padding(
                  padding: EdgeInsets.only(bottom: 16.h),
                  child: StyledText(
                    text: item.price,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.black,
                    letterSpacing: 0.sp,
                    height: 1.2,
                  ),
                ),
              ],
            ),
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
        return CustomDialog(
          title: 'Remove Item',
          content: 'Remove ${item.name} from your cart?',
          actionText: 'Remove',
          actionTextColor: Colors.red,
          onCancel: () => Navigator.of(context).pop(),
          onAction: () {
            context.read<CartCubit>().removeFromCart(item);
            Navigator.of(context).pop();
          },
        );
      },
    );
  }
}
