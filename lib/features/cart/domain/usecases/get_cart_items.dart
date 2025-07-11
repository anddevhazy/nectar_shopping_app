import 'package:grocery_mart/features/cart/domain/entities/item_entity.dart';
import 'package:grocery_mart/features/cart/domain/repositories/cart_repository.dart';

class GetCartItemsUseCase {
  final CartRepository repository;

  GetCartItemsUseCase({required this.repository});

  Future<List<ItemEntity>> call() async {
    return await repository.getCartItems();
  }
}
