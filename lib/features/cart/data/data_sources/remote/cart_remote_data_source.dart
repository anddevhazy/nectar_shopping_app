import 'package:grocery_mart/features/cart/domain/entities/item_entity.dart';

abstract class CartRemoteDataSource {
  Future<void> addToCart(ItemEntity itemEntity);
  Future<void> removeFromCart(ItemEntity itemEntity);
  Future<List<ItemEntity>> getCartItems();
}
