import 'package:grocery_mart/features/shop/data/data_sources/local/shop_local_data_source.dart';
import 'package:grocery_mart/features/shop/domain/entities/category_entity.dart';
import 'package:grocery_mart/features/shop/domain/entities/product_entity.dart';
import 'package:grocery_mart/features/shop/domain/repositories/shop_repository.dart';

class ShopRepositoryImpl implements ShopRepository {
  final ShopLocalDataSource localDataSource;

  ShopRepositoryImpl({required this.localDataSource});

  @override
  Future<List<ProductEntity>> getExclusiveOffers() {
    return localDataSource.getExclusiveOffers();
  }

  @override
  Future<List<ProductEntity>> getBestSellingProducts() {
    return localDataSource.getBestSellingProducts();
  }

  @override
  Future<List<ProductEntity>> getGroceryProducts() {
    return localDataSource.getGroceryProducts();
  }

  @override
  Future<List<CategoryEntity>> getCategories() {
    return localDataSource.getCategories();
  }
}
