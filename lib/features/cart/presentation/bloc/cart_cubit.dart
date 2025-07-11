import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grocery_mart/features/cart/domain/entities/item_entity.dart';
import 'package:grocery_mart/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:grocery_mart/features/cart/domain/usecases/get_cart_items.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final AddToCartUseCase addToCartUseCase;
  final GetCartItemsUseCase getCartItemsUseCase;

  CartCubit({required this.addToCartUseCase, required this.getCartItemsUseCase})
    : super(Initial());

  Future<void> addToCart(ItemEntity item) async {
    try {
      emit(Loading(itemEntity: item));
      await addToCartUseCase(item);
      final cartItems = await getCartItemsUseCase();
      emit(Successful(cartItems: cartItems, message: 'Item added to cart'));
    } catch (e) {
      emit(Failed(message: 'Failed to add item to cart: $e'));
    }
  }

  Future<void> fetchCartItems() async {
    try {
      emit(
        Loading(
          itemEntity: const ItemEntity(
            name: '',
            description: '',
            price: '',
            imagePath: '',
            quantity: 0,
          ),
        ),
      );
      final cartItems = await getCartItemsUseCase();
      emit(Successful(cartItems: cartItems));
    } catch (e) {
      emit(Failed(message: 'Failed to fetch cart items: $e'));
    }
  }
}
