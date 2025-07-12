import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:grocery_mart/core/theme/colors.dart';
import 'package:grocery_mart/core/theme/styled_text.dart';
import 'package:grocery_mart/features/shop/domain/entities/category_entity.dart';
import 'package:grocery_mart/features/shop/domain/entities/product_entity.dart';
import 'package:grocery_mart/features/shop/presentation/bloc/shop_cubit.dart';
import 'package:grocery_mart/features/shop/presentation/bloc/shop_state.dart';
import 'package:grocery_mart/features/shop/presentation/widgets/build_category_card_widget.dart';
import 'package:grocery_mart/features/shop/presentation/widgets/build_product_card_widget.dart';
import 'package:grocery_mart/features/shop/presentation/widgets/build_section_header_widget.dart';

class ShopScreen extends StatelessWidget {
  const ShopScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetIt.instance<ShopCubit>()..loadShopData(),
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: BlocBuilder<ShopCubit, ShopState>(
            builder: (context, state) {
              if (state is ShopLoading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state is ShopError) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(state.message),
                      ElevatedButton(
                        onPressed:
                            () => context.read<ShopCubit>().loadShopData(),
                        child: const Text('Retry'),
                      ),
                    ],
                  ),
                );
              }

              if (state is ShopLoaded) {
                return _buildContent(state);
              }

              return const SizedBox();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildContent(ShopLoaded state) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          _buildHeader(),
          _buildSearchBar(),
          _buildBanner(),
          SizedBox(height: 30.h),
          _buildProductSection('Exclusive Offer', state.exclusiveOffers),
          const SizedBox(height: 24),
          _buildProductSection('Best Selling', state.bestSellingProducts),
          const SizedBox(height: 24),
          _buildGroceriesSection(state.categories, state.groceryProducts),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Align(
          alignment: Alignment.center,
          child: Image.asset('assets/coloured_carrot.png'),
        ),
        SizedBox(height: 16.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.location_on),
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
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 25.w),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.black),
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
    );
  }

  Widget _buildBanner() {
    return Container(
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
    );
  }

  Widget _buildProductSection(String title, List<ProductEntity> products) {
    return Column(
      children: [
        buildSectionHeader(title),
        SizedBox(height: 20.h),
        SizedBox(
          height: 240.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return buildProductCard(
                context,
                product.name,
                product.description,
                product.price,
                product.imagePath,
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildGroceriesSection(
    List<CategoryEntity> categories,
    List<ProductEntity> products,
  ) {
    return Column(
      children: [
        buildSectionHeader('Groceries'),
        const SizedBox(height: 16),
        SizedBox(
          height: 80.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            itemCount: categories.length,
            itemBuilder: (context, index) {
              final category = categories[index];
              return Padding(
                padding: EdgeInsets.only(
                  right: index < categories.length - 1 ? 16.w : 0,
                ),
                child: buildCategoryCard(
                  category.name,
                  category.backgroundColor.withOpacity(0.15),
                  category.imagePath,
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 240.h,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            itemCount: products.length,
            itemBuilder: (context, index) {
              final product = products[index];
              return buildProductCard(
                context,
                product.name,
                product.description,
                product.price,
                product.imagePath,
              );
            },
          ),
        ),
      ],
    );
  }
}
