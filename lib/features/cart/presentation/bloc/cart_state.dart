part of 'cart_cubit.dart';

abstract class CartState extends Equatable {
  const CartState();
}

class Initial extends CartState {
  @override
  List<Object> get props => [];
}

class Loading extends CartState {
  final ItemEntity itemEntity;

  const Loading({required this.itemEntity});

  @override
  List<Object?> get props => [itemEntity];
}

class Successful extends CartState {
  final List<ItemEntity> cartItems;
  final String? message;

  const Successful({required this.cartItems, this.message});

  @override
  List<Object?> get props => [cartItems, message];
}

class Failed extends CartState {
  final String? message;

  const Failed({this.message});

  @override
  List<Object?> get props => [message];
}
