import 'package:grocery_mart/features/shop/domain/entities/category_entity.dart';
import 'package:grocery_mart/features/shop/domain/entities/product_entity.dart';

abstract class ShopRepository {
  Future<List<ProductEntity>> getExclusiveOffers();
  Future<List<ProductEntity>> getBestSellingProducts();
  Future<List<ProductEntity>> getGroceryProducts();
  Future<List<CategoryEntity>> getCategories();
}
