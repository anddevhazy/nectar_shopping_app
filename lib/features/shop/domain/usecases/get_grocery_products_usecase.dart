import 'package:grocery_mart/features/shop/domain/entities/product_entity.dart';
import 'package:grocery_mart/features/shop/domain/repositories/shop_repository.dart';

class GetGroceryProductsUseCase {
  final ShopRepository repository;

  GetGroceryProductsUseCase({required this.repository});

  Future<List<ProductEntity>> call() async {
    return await repository.getBestSellingProducts();
  }
}
