import 'package:flutter/material.dart';
import 'package:grocery_mart/core/theme/colors.dart';
import 'package:grocery_mart/features/shop/data/data_sources/local/shop_local_data_source.dart';
import 'package:grocery_mart/features/shop/data/models/category_model.dart';
import 'package:grocery_mart/features/shop/data/models/product_model.dart';

class ShopLocalDataSourceImpl implements ShopLocalDataSource {
  @override
  Future<List<ProductModel>> getExclusiveOffers() async {
    // This would typically load from local storage, but for demo purposes:
    return [
      ProductModel(
        id: '1',
        name: 'Chicken',
        description: '1kg',
        price: '\$7.99',
        imagePath: 'assets/a.png',
        category: 'meat',
      ),
      ProductModel(
        id: '2',
        name: 'Pepper',
        description: '3g',
        price: '\$4.99',
        imagePath: 'assets/b.png',
        category: 'vegetables',
      ),
      ProductModel(
        id: '3',
        name: 'Apples',
        description: '500g',
        price: '\$5.50',
        imagePath: 'assets/c.png',
        category: 'fruits',
      ),
      ProductModel(
        id: '4',
        name: 'Potatoes',
        description: '2kg',
        price: '\$11.00',
        imagePath: 'assets/d.png',
        category: 'tuber',
      ),
      ProductModel(
        id: '5',
        name: 'Meat',
        description: '3kg',
        price: '\$20.99',
        imagePath: 'assets/e.png',
        category: 'meat',
      ),
    ];
  }

  @override
  Future<List<ProductModel>> getBestSellingProducts() async {
    return [
      ProductModel(
        id: '6',
        name: 'Apple',
        description: '1kg',
        price: '\$2.99',
        imagePath: 'assets/j.png',
        category: 'fruits',
      ),
      ProductModel(
        id: '7',
        name: 'Strawberry',
        description: '200g',
        price: '\$1.99',
        imagePath: 'assets/k.png',
        category: 'fruits',
      ),
      ProductModel(
        id: '8',
        name: 'Turkey',
        description: '5kg',
        price: '\$34.20',
        imagePath: 'assets/l.png',
        category: 'fruits',
      ),
      ProductModel(
        id: '9',
        name: 'Beef',
        description: '1kg',
        price: '\$8.40',
        imagePath: 'assets/m.png',
        category: 'meat',
      ),
      ProductModel(
        id: '10',
        name: 'Yam',
        description: '10kg',
        price: '\$40.00',
        imagePath: 'assets/n.png',
        category: 'tuber',
      ),
    ];
  }

  @override
  Future<List<ProductModel>> getGroceryProducts() async {
    return [
      ProductModel(
        id: '11',
        name: 'Bell Pepper',
        description: '1kg',
        price: '\$4.99',
        imagePath: 'assets/p.png',
        category: 'pepper',
      ),
      ProductModel(
        id: '12',
        name: 'Cocoyam',
        description: '1kg',
        price: '\$4.99',
        imagePath: 'assets/q.png',
        category: 'tuber',
      ),
      ProductModel(
        id: '13',
        name: 'Vitamins',
        description: '1kg',
        price: '\$13.49',
        imagePath: 'assets/r.png',
        category: 'fruits',
      ),
      ProductModel(
        id: '14',
        name: 'Broiler Chicken',
        description: '1kg',
        price: '\$8.23',
        imagePath: 'assets/s.png',
        category: 'vegetables',
      ),
      ProductModel(
        id: '15',
        name: 'Chevon',
        description: '1kg',
        price: '\$4.99',
        imagePath: 'assets/t.png',
        category: 'vegetables',
      ),
    ];
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    return [
      CategoryModel(
        id: '1',
        name: 'Pulses',
        imagePath: 'assets/rice.png',
        backgroundColor: const Color(0xFFF8A44C),
      ),
      CategoryModel(
        id: '2',
        name: 'Rice',
        imagePath: 'assets/pulses.png',
        backgroundColor: AppColors.primary.withOpacity(0.15),
      ),
    ];
  }
}
