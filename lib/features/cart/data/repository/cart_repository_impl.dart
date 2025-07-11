import 'package:grocery_mart/features/cart/data/data_sources/remote/cart_remote_data_source.dart';
import 'package:grocery_mart/features/cart/domain/entities/item_entity.dart';
import 'package:grocery_mart/features/cart/domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  final CartRemoteDataSource remoteDataSource;

  CartRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> addToCart(ItemEntity itemEntity) async =>
      remoteDataSource.addToCart(itemEntity);
  @override
  Future<List<ItemEntity>> getCartItems() async =>
      remoteDataSource.getCartItems();

  @override
  Future<void> removeFromCart(ItemEntity itemEntity) async =>
      remoteDataSource.removeFromCart(itemEntity);
}
