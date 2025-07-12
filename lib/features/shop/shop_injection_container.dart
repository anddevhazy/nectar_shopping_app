import 'package:grocery_mart/features/shop/data/data_sources/local/shop_local_data_source.dart';
import 'package:grocery_mart/features/shop/data/data_sources/local/shop_local_remote_source_impl.dart';
import 'package:grocery_mart/features/shop/data/repository/shop_repository_impl.dart';
import 'package:grocery_mart/features/shop/domain/repositories/shop_repository.dart';
import 'package:grocery_mart/features/shop/domain/usecases/get_best_selling_products_usecase.dart';
import 'package:grocery_mart/features/shop/domain/usecases/get_category_usecase.dart';
import 'package:grocery_mart/features/shop/domain/usecases/get_exclusive_offer_usecase.dart';
import 'package:grocery_mart/features/shop/domain/usecases/get_grocery_products_usecase.dart';
import 'package:grocery_mart/features/shop/presentation/bloc/shop_cubit.dart';
import 'package:grocery_mart/main_injection_container.dart';

Future<void> shopInjectionContainer() async {
  //CUBITS INJECTION
  sl.registerFactory<ShopCubit>(
    () => ShopCubit(
      getBestSellingProductsUseCase: sl.call(),
      getCategoriesUseCase: sl.call(),
      getExclusiveOffersUseCase: sl.call(),
      getGroceryProductsUseCase: sl.call(),
    ),
  );

  //USE CASES INJECTION
  sl.registerLazySingleton<GetBestSellingProductsUseCase>(
    () => GetBestSellingProductsUseCase(repository: sl.call()),
  );

  sl.registerLazySingleton<GetCategoriesUseCase>(
    () => GetCategoriesUseCase(repository: sl.call()),
  );

  sl.registerLazySingleton<GetExclusiveOffersUseCase>(
    () => GetExclusiveOffersUseCase(repository: sl.call()),
  );

  sl.registerLazySingleton<GetGroceryProductsUseCase>(
    () => GetGroceryProductsUseCase(repository: sl.call()),
  );

  //REPOSITORY & DATA SOURCES INJECTION
  sl.registerLazySingleton<ShopRepository>(
    () => ShopRepositoryImpl(localDataSource: sl.call()),
  );

  sl.registerLazySingleton<ShopLocalDataSource>(
    () => ShopLocalDataSourceImpl(),
  );
}
