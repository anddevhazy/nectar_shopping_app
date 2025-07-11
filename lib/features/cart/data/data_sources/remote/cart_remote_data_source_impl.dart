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

      // Check if item already exists in cart
      final existingItemIndex = cartItems.indexWhere(
        (i) => i.name == item.name && i.imagePath == item.imagePath,
      );

      if (existingItemIndex != -1) {
        // Update existing item quantity
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
        // Add new item to cart
        final newItem = ItemModel(
          name: item.name,
          description: item.description,
          price: item.price,
          imagePath: item.imagePath,
          quantity: item.quantity,
        );
        cartItems.add(newItem);
      }

      // Convert all items to JSON and save
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
      print('Cart saved successfully. Items count: ${cartItems.length}');
    } catch (e) {
      print('Error adding to cart: $e');
      throw Exception('Failed to add item to cart: $e');
    }
  }

  @override
  Future<List<ItemEntity>> getCartItems() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final cartJson = prefs.getStringList(_cartKey) ?? [];

      print('Retrieved cart items: ${cartJson.length}');

      return cartJson
          .map((json) => ItemModel.fromJson(jsonDecode(json)))
          .cast<ItemEntity>()
          .toList();
    } catch (e) {
      print('Error getting cart items: $e');
      return [];
    }
  }
}
