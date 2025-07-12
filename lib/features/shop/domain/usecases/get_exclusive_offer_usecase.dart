import 'package:grocery_mart/features/shop/domain/entities/product_entity.dart';
import 'package:grocery_mart/features/shop/domain/repositories/shop_repository.dart';

class GetExclusiveOffersUseCase {
  final ShopRepository repository;

  GetExclusiveOffersUseCase({required this.repository});

  Future<List<ProductEntity>> call() async {
    return await repository.getExclusiveOffers();
  }
}
