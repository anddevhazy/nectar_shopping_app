import 'dart:convert';
import 'package:grocery_mart/features/cart/data/data_sources/remote/cart_remote_data_source.dart';
import 'package:grocery_mart/features/cart/domain/entities/item_entity.dart';
import 'package:grocery_mart/features/cart/data/models/item_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  static const String _cartKey = 'cart_items';

  @override
  Future<void> addToCart(ItemEntity item) async {
    final prefs = await SharedPreferences.getInstance();
    final cartItems = await getCartItems();

    final existingItemIndex = cartItems.indexWhere(
      (i) => i.name == item.name && i.imagePath == item.imagePath,
    );
    if (existingItemIndex != -1) {
      final updatedItem = cartItems[existingItemIndex].copyWith(
        quantity: cartItems[existingItemIndex].quantity + 1,
      );
      cartItems[existingItemIndex] = updatedItem;
    } else {
      cartItems.add(item);
    }

    final cartJson =
        cartItems
            .map(
              (item) => jsonEncode(
                (item is ItemModel
                        ? item
                        : ItemModel(
                          name: item.name,
                          description: item.description,
                          price: item.price,
                          imagePath: item.imagePath,
                          quantity: item.quantity,
                        ))
                    .toJson(),
              ),
            )
            .toList();

    await prefs.setStringList(_cartKey, cartJson);
  }

  @override
  Future<List<ItemEntity>> getCartItems() async {
    final prefs = await SharedPreferences.getInstance();
    final cartJson = prefs.getStringList(_cartKey) ?? [];

    return cartJson
        .map((json) => ItemModel.fromJson(jsonDecode(json)))
        .toList();
  }

  @override
  Future<void> removeFromCart(ItemEntity itemEntity) {
    // TODO: implement removeFromCart
    throw UnimplementedError();
  }
}
