import 'package:grocery_mart/features/cart/domain/repositories/cart_repository.dart';

class ClearCartUseCase {
  final CartRepository repository;

  ClearCartUseCase({required this.repository});

  Future<void> call() async {
    return await repository.clearCart();
  }
}
