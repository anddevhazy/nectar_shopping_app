import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_mart/core/shared/custom_dialog_widget.dart';
import 'package:grocery_mart/core/theme/colors.dart';
import 'package:grocery_mart/core/theme/styled_text.dart';
import 'package:grocery_mart/features/cart/presentation/bloc/cart_cubit.dart';
import 'package:grocery_mart/features/cart/presentation/widgets/cart_item_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        title: StyledText(
          text: 'My Cart',
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.black,
          height: 18.sp,
          letterSpacing: 0.sp,
        ),
        centerTitle: true,
        actions: [
          BlocBuilder<CartCubit, CartState>(
            builder: (context, state) {
              if (state is Successful && state.cartItems.isNotEmpty) {
                return IconButton(
                  icon: const Icon(Icons.delete_outline, color: Colors.red),
                  onPressed: () {
                    _showClearCartDialog(context);
                  },
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(color: Colors.grey.shade300, height: 1.0),
        ),
      ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is Loading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is Failed) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, size: 64, color: Colors.red),
                  SizedBox(height: 16.h),
                  StyledText(
                    text: state.message ?? 'Something went wrong',
                    fontSize: 16.sp,
                    color: Colors.red,
                    height: 16.sp,
                    letterSpacing: 0.sp,
                    fontWeight: FontWeight.normal,
                  ),
                  SizedBox(height: 16.h),
                  ElevatedButton(
                    onPressed: () => context.read<CartCubit>().fetchCartItems(),
                    child: const Text('Retry'),
                  ),
                ],
              ),
            );
          }

          if (state is Successful) {
            if (state.cartItems.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.shopping_cart_outlined,
                      size: 100.sp,
                      color: Colors.grey[400],
                    ),
                    SizedBox(height: 20.h),
                    StyledText(
                      text: 'Your cart is empty',
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[600]!,
                      height: 20.sp,
                      letterSpacing: 0.sp,
                    ),
                    SizedBox(height: 10.h),
                    StyledText(
                      text: 'Add some items to get started',
                      fontSize: 14.sp,
                      color: Colors.grey[500]!,
                      height: 14.sp,
                      letterSpacing: 0.sp,
                      fontWeight: FontWeight.normal,
                    ),
                  ],
                ),
              );
            }

            return Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    padding: EdgeInsets.symmetric(
                      horizontal: 24.w,
                      vertical: 8.h,
                    ),
                    itemCount: state.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = state.cartItems[index];
                      return Padding(
                        padding: EdgeInsets.only(top: index == 0 ? 0 : 24.h),
                        child: CartItemWidget(item: item),
                      );
                    },

                    separatorBuilder:
                        (context, index) => Divider(
                          color: Colors.grey.shade300,
                          thickness: 1,
                          height: 1.h,
                        ),
                  ),
                ),
                GestureDetector(
                  onTap: () => _showCheckoutDialog(context),
                  child: Container(
                    margin: EdgeInsets.all(24),
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const Text(
                          'Go to Checkout',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Positioned(
                          right: 16,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF489E64),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              '\$${context.read<CartCubit>().getTotalPrice().toStringAsFixed(2)}',
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  void _showClearCartDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(
          title: 'Clear Cart',

          content: 'Are you sure you want to clear cart?',
          actionText: 'Clear',
          actionTextColor: Colors.red,
          onCancel: () => Navigator.of(context).pop(),
          onAction: () {
            context.read<CartCubit>().clearCart();
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  void _showCheckoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CustomDialog(
          title: 'Checkout',
          content: 'Proceed to checkout?',
          actionText: 'Proceed',
          actionTextColor: AppColors.primary,
          onCancel: () => Navigator.of(context).pop(),
          onAction: () {
            Navigator.of(context).pop();
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Checkout feature coming soon!')),
            );
          },
        );
      },
    );
  }
}
