import 'package:grocery_mart/features/shop/data/models/category_model.dart';
import 'package:grocery_mart/features/shop/data/models/product_model.dart';

abstract class ShopLocalDataSource {
  Future<List<ProductModel>> getExclusiveOffers();
  Future<List<ProductModel>> getBestSellingProducts();
  Future<List<ProductModel>> getGroceryProducts();
  Future<List<CategoryModel>> getCategories();
}
