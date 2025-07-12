import 'package:grocery_mart/features/shop/domain/entities/product_entity.dart';
import 'package:grocery_mart/features/shop/domain/repositories/shop_repository.dart';

class GetBestSellingProductsUseCase {
  final ShopRepository repository;

  GetBestSellingProductsUseCase({required this.repository});

  Future<List<ProductEntity>> call() {
    return repository.getBestSellingProducts();
  }
}
