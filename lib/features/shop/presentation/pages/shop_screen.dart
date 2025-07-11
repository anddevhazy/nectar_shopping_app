import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_mart/core/theme/colors.dart';
import 'package:grocery_mart/core/theme/styled_text.dart';
import 'package:grocery_mart/features/shop/presentation/widgets/build_product_card_widget.dart';
import 'package:grocery_mart/features/shop/presentation/widgets/build_section_header_widget.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16.h),
              Align(
                alignment: Alignment.center,
                child: Image.asset('assets/coloured_carrot.png'),
              ),
              SizedBox(height: 16.h),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on),
                  SizedBox(width: 4.w),
                  StyledText(
                    text: "Dhaka, Banassre",
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: AppColors.black,
                    letterSpacing: 0.sp,
                    height: 18.sp,
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 25.w),
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Row(
                  children: [
                    Icon(Icons.search, color: Colors.black),
                    const SizedBox(width: 8),
                    StyledText(
                      text: 'Search Store',
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.lighterBlack,
                      letterSpacing: 0.sp,
                      height: 14.sp,
                    ),
                  ],
                ),
              ),

              Container(
                height: 100.h,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(16.r),
                ),
              ),

              SizedBox(height: 30.h),

              buildSectionHeader('Exclusive Offer'),
              SizedBox(height: 20.h),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    buildProductCard(
                      'Organic Bananas',
                      '7pcs, Priceg',
                      '\$4.99',
                      'assets/bananas.png',
                    ),
                    buildProductCard(
                      'Red Apple',
                      '1kg, Priceg',
                      '\$4.99',
                      'assets/apple.png',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Best Selling Section
              buildSectionHeader('Best Selling'),
              const SizedBox(height: 16),
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    buildProductCard(
                      'Bell Pepper Red',
                      '1kg, Priceg',
                      '\$4.99',
                      'assets/pepper.png',
                    ),
                    buildProductCard(
                      'Ginger',
                      '250gm, Priceg',
                      '\$4.99',
                      'assets/ginger.png',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // Groceries Section
              buildSectionHeader('Groceries'),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: _buildCategoryCard('Pulses', Colors.orange[100]!),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildCategoryCard('Rice', Colors.brown[100]!),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              // Meat Section
              SizedBox(
                height: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    buildProductCard(
                      'Beef Bone',
                      '1kg, Priceg',
                      '\$4.99',
                      'assets/beef.png',
                    ),
                    buildProductCard(
                      'Broiler Chicken',
                      '1kg, Priceg',
                      '\$4.99',
                      'assets/chicken.png',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCategoryCard(String title, Color backgroundColor) {
    return Container(
      height: 100,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: const Icon(Icons.category, color: Colors.orange),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
