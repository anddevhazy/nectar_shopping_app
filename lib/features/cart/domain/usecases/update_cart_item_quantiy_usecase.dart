import 'package:grocery_mart/features/cart/domain/entities/item_entity.dart';
import 'package:grocery_mart/features/cart/domain/repositories/cart_repository.dart';

class UpdateCartItemQuantityUseCase {
  final CartRepository repository;

  UpdateCartItemQuantityUseCase({required this.repository});

  Future<void> call(ItemEntity itemEntity, int quantity) async {
    return await repository.updateCartItemQuantity(itemEntity, quantity);
  }
}
