import 'package:grocery_mart/features/shop/domain/entities/category_entity.dart';
import 'package:grocery_mart/features/shop/domain/entities/product_entity.dart';

abstract class ShopState {}

class ShopInitial extends ShopState {}

class ShopLoading extends ShopState {}

class ShopLoaded extends ShopState {
  final List<ProductEntity> exclusiveOffers;
  final List<ProductEntity> bestSellingProducts;
  final List<ProductEntity> groceryProducts;
  final List<CategoryEntity> categories;

  ShopLoaded({
    required this.exclusiveOffers,
    required this.bestSellingProducts,
    required this.groceryProducts,
    required this.categories,
  });
}

class ShopError extends ShopState {
  final String message;
  ShopError(this.message);
}
