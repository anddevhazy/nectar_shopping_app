import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grocery_mart/features/cart/domain/entities/item_entity.dart';
import 'package:grocery_mart/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:grocery_mart/features/cart/domain/usecases/get_cart_items.dart';
import 'package:grocery_mart/features/cart/domain/usecases/remove_from_cart_usecase.dart';
import 'package:grocery_mart/features/cart/domain/usecases/clear_cart_usecase.dart';
import 'package:grocery_mart/features/cart/domain/usecases/update_cart_item_quantiy_usecase.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final AddToCartUseCase addToCartUseCase;
  final GetCartItemsUseCase getCartItemsUseCase;
  final RemoveFromCartUseCase removeFromCartUseCase;
  final UpdateCartItemQuantityUseCase updateCartItemQuantityUseCase;
  final ClearCartUseCase clearCartUseCase;

  CartCubit({
    required this.addToCartUseCase,
    required this.getCartItemsUseCase,
    required this.removeFromCartUseCase,
    required this.updateCartItemQuantityUseCase,
    required this.clearCartUseCase,
  }) : super(Initial()) {
    fetchCartItems();
  }

  Future<void> addToCart(ItemEntity item) async {
    try {
      await addToCartUseCase(item);
      final cartItems = await getCartItemsUseCase();
      emit(Successful(cartItems: cartItems));
    } catch (e) {
      emit(Failed(message: 'Failed to add item to cart: $e'));
      await fetchCartItems();
    }
  }

  Future<void> removeFromCart(ItemEntity item) async {
    try {
      await removeFromCartUseCase(item);
      final cartItems = await getCartItemsUseCase();
      emit(Successful(cartItems: cartItems));
    } catch (e) {
      emit(Failed(message: 'Failed to remove item from cart: $e'));
      await fetchCartItems();
    }
  }

  Future<void> updateQuantity(ItemEntity item, int quantity) async {
    try {
      await updateCartItemQuantityUseCase(item, quantity);
      final cartItems = await getCartItemsUseCase();
      emit(Successful(cartItems: cartItems));
    } catch (e) {
      emit(Failed(message: 'Failed to update item quantity: $e'));
      await fetchCartItems();
    }
  }

  Future<void> clearCart() async {
    try {
      await clearCartUseCase();
      emit(const Successful(cartItems: []));
    } catch (e) {
      emit(Failed(message: 'Failed to clear cart: $e'));
    }
  }

  Future<void> fetchCartItems() async {
    try {
      final cartItems = await getCartItemsUseCase();
      emit(Successful(cartItems: cartItems));
    } catch (e) {
      emit(Failed(message: 'Failed to fetch cart items: $e'));
    }
  }

  double getTotalPrice() {
    if (state is Successful) {
      final cartItems = (state as Successful).cartItems;
      return cartItems.fold(0.0, (total, item) {
        final price = double.tryParse(item.price.replaceAll('\$', '')) ?? 0.0;
        return total + (price * item.quantity);
      });
    }
    return 0.0;
  }
}
