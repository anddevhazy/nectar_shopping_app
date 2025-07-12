import 'dart:convert';
import 'package:grocery_mart/features/cart/data/data_sources/remote/cart_remote_data_source.dart';
import 'package:grocery_mart/features/cart/domain/entities/item_entity.dart';
import 'package:grocery_mart/features/cart/data/models/item_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  static const String _cartKey = 'cart_items';

  @override
  Future<void> addToCart(ItemEntity item) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cartItems = await getCartItems();

      final existingItemIndex = cartItems.indexWhere(
        (i) => i.name == item.name && i.imagePath == item.imagePath,
      );

      if (existingItemIndex != -1) {
        final existingItem = cartItems[existingItemIndex];
        final updatedItem = ItemModel(
          name: existingItem.name,
          description: existingItem.description,
          price: existingItem.price,
          imagePath: existingItem.imagePath,
          quantity: existingItem.quantity + 1,
        );
        cartItems[existingItemIndex] = updatedItem;
      } else {
        final newItem = ItemModel(
          name: item.name,
          description: item.description,
          price: item.price,
          imagePath: item.imagePath,
          quantity: item.quantity,
        );
        cartItems.add(newItem);
      }

      await _saveCartItems(cartItems);
    } catch (e) {
      throw Exception('Failed to add item to cart: $e');
    }
  }

  @override
  Future<List<ItemEntity>> getCartItems() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cartJson = prefs.getStringList(_cartKey) ?? [];

      return cartJson
          .map((json) => ItemModel.fromJson(jsonDecode(json)))
          .cast<ItemEntity>()
          .toList();
    } catch (e) {
      return [];
    }
  }

  @override
  Future<void> removeFromCart(ItemEntity item) async {
    try {
      final cartItems = await getCartItems();
      cartItems.removeWhere(
        (i) => i.name == item.name && i.imagePath == item.imagePath,
      );
      await _saveCartItems(cartItems);
    } catch (e) {
      throw Exception('Failed to remove item from cart: $e');
    }
  }

  @override
  Future<void> updateCartItemQuantity(ItemEntity item, int quantity) async {
    try {
      final cartItems = await getCartItems();
      final existingItemIndex = cartItems.indexWhere(
        (i) => i.name == item.name && i.imagePath == item.imagePath,
      );

      if (existingItemIndex != -1) {
        if (quantity <= 0) {
          cartItems.removeAt(existingItemIndex);
        } else {
          final existingItem = cartItems[existingItemIndex];
          final updatedItem = ItemModel(
            name: existingItem.name,
            description: existingItem.description,
            price: existingItem.price,
            imagePath: existingItem.imagePath,
            quantity: quantity,
          );
          cartItems[existingItemIndex] = updatedItem;
        }
        await _saveCartItems(cartItems);
      }
    } catch (e) {
      throw Exception('Failed to update item quantity: $e');
    }
  }

  @override
  Future<void> clearCart() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_cartKey);
    } catch (e) {
      throw Exception('Failed to clear cart: $e');
    }
  }

  Future<void> _saveCartItems(List<ItemEntity> cartItems) async {
    final prefs = await SharedPreferences.getInstance();
    final cartJson =
        cartItems
            .map(
              (item) => jsonEncode(
                ItemModel(
                  name: item.name,
                  description: item.description,
                  price: item.price,
                  imagePath: item.imagePath,
                  quantity: item.quantity,
                ).toJson(),
              ),
            )
            .toList();

    await prefs.setStringList(_cartKey, cartJson);
  }
}
