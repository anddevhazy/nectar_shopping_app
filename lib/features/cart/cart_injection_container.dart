import 'package:grocery_mart/features/cart/data/data_sources/remote/cart_remote_data_source.dart';
import 'package:grocery_mart/features/cart/data/data_sources/remote/cart_remote_data_source_impl.dart';
import 'package:grocery_mart/features/cart/data/repository/cart_repository_impl.dart';
import 'package:grocery_mart/features/cart/domain/repositories/cart_repository.dart';
import 'package:grocery_mart/features/cart/domain/usecases/add_to_cart_usecase.dart';
import 'package:grocery_mart/features/cart/domain/usecases/get_cart_items.dart';
import 'package:grocery_mart/features/cart/domain/usecases/remove_from_cart_usecase.dart';
import 'package:grocery_mart/features/cart/domain/usecases/clear_cart_usecase.dart';
import 'package:grocery_mart/features/cart/domain/usecases/update_cart_item_quantiy_usecase.dart';
import 'package:grocery_mart/features/cart/presentation/bloc/cart_cubit.dart';
import 'package:grocery_mart/main_injection_container.dart';

Future<void> cartInjectionContainer() async {
  //CUBITS INJECTION
  sl.registerFactory<CartCubit>(
    () => CartCubit(
      addToCartUseCase: sl.call(),
      getCartItemsUseCase: sl.call(),
      removeFromCartUseCase: sl.call(),
      updateCartItemQuantityUseCase: sl.call(),
      clearCartUseCase: sl.call(),
    ),
  );

  //USE CASES INJECTION
  sl.registerLazySingleton<AddToCartUseCase>(
    () => AddToCartUseCase(repository: sl.call()),
  );

  sl.registerLazySingleton<GetCartItemsUseCase>(
    () => GetCartItemsUseCase(repository: sl.call()),
  );

  sl.registerLazySingleton<RemoveFromCartUseCase>(
    () => RemoveFromCartUseCase(repository: sl.call()),
  );

  sl.registerLazySingleton<UpdateCartItemQuantityUseCase>(
    () => UpdateCartItemQuantityUseCase(repository: sl.call()),
  );

  sl.registerLazySingleton<ClearCartUseCase>(
    () => ClearCartUseCase(repository: sl.call()),
  );

  //REPOSITORY & DATA SOURCES INJECTION
  sl.registerLazySingleton<CartRepository>(
    () => CartRepositoryImpl(remoteDataSource: sl.call()),
  );

  sl.registerLazySingleton<CartRemoteDataSource>(
    () => CartRemoteDataSourceImpl(),
  );
}
