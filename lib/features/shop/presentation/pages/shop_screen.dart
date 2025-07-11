import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_mart/core/theme/colors.dart';
import 'package:grocery_mart/core/theme/styled_text.dart';
import 'package:grocery_mart/features/shop/presentation/widgets/build_category_card_widget.dart';
import 'package:grocery_mart/features/shop/presentation/widgets/build_product_card_widget.dart';
import 'package:grocery_mart/features/shop/presentation/widgets/build_section_header_widget.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
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
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: Image.asset('assets/veg.png', fit: BoxFit.cover),
                ),
              ),

              SizedBox(height: 30.h),

              buildSectionHeader('Exclusive Offer'),
              SizedBox(height: 20.h),
              SizedBox(
                height: 240.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  children: [
                    buildProductCard(
                      context,
                      'Beef Bone',
                      '1kg, Priceg',
                      '\$4.99',
                      'assets/a.png',
                    ), // Pass context
                    buildProductCard(
                      context,
                      'Broiler Chicken',
                      '1kg, Priceg',
                      '\$4.99',
                      'assets/b.png',
                    ),
                    buildProductCard(
                      context,
                      'Broiler Chicken',
                      '1kg, Priceg',
                      '\$4.99',
                      'assets/c.png',
                    ),
                    buildProductCard(
                      context,
                      'Broiler Chicken',
                      '1kg, Priceg',
                      '\$4.99',
                      'assets/d.png',
                    ),
                    buildProductCard(
                      context,
                      'Broiler Chicken',
                      '1kg, Priceg',
                      '\$4.99',
                      'assets/e.png',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              buildSectionHeader('Best Selling'),
              const SizedBox(height: 16),
              SizedBox(
                height: 240.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  children: [
                    buildProductCard(
                      context,
                      'Beef Bone',
                      '1kg, Priceg',
                      '\$4.99',
                      'assets/j.png',
                    ),
                    buildProductCard(
                      context,
                      'Broiler Chicken',
                      '1kg, Priceg',
                      '\$4.99',
                      'assets/k.png',
                    ),
                    buildProductCard(
                      context,
                      'Broiler Chicken',
                      '1kg, Priceg',
                      '\$4.99',
                      'assets/l.png',
                    ),
                    buildProductCard(
                      context,
                      'Broiler Chicken',
                      '1kg, Priceg',
                      '\$4.99',
                      'assets/m.png',
                    ),
                    buildProductCard(
                      context,
                      'Broiler Chicken',
                      '1kg, Priceg',
                      '\$4.99',
                      'assets/n.png',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              buildSectionHeader('Groceries'),
              const SizedBox(height: 16),

              SizedBox(
                height: 80.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  children: [
                    buildCategoryCard(
                      'Pulses',
                      Color(0xFFF8A44C).withOpacity(0.15),
                      'assets/rice.png',
                    ),
                    const SizedBox(width: 16),
                    buildCategoryCard(
                      'Rice',
                      AppColors.primary.withOpacity(0.15),
                      'assets/pulses.png',
                    ),
                    const SizedBox(width: 16),
                    buildCategoryCard(
                      'Grains',
                      Color(0xFFF8A44C).withOpacity(0.15),
                      'assets/rice.png',
                    ),
                    const SizedBox(width: 16),
                    buildCategoryCard(
                      'Cereals',
                      AppColors.primary.withOpacity(0.15),
                      'assets/pulses.png',
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              SizedBox(
                height: 240.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  children: [
                    buildProductCard(
                      context,
                      'Beef Bone',
                      '1kg, Priceg',
                      '\$4.99',
                      'assets/p.png',
                    ),
                    buildProductCard(
                      context,
                      'Broiler Chicken',
                      '1kg, Priceg',
                      '\$4.99',
                      'assets/q.png',
                    ),
                    buildProductCard(
                      context,
                      'Broiler Chicken',
                      '1kg, Priceg',
                      '\$4.99',
                      'assets/r.png',
                    ),
                    buildProductCard(
                      context,
                      'Broiler Chicken',
                      '1kg, Priceg',
                      '\$4.99',
                      'assets/s.png',
                    ),
                    buildProductCard(
                      context,
                      'Broiler Chicken',
                      '1kg, Priceg',
                      '\$4.99',
                      'assets/t.png',
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
}
