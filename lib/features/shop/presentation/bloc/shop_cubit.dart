import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery_mart/features/shop/domain/usecases/get_best_selling_products_usecase.dart';
import 'package:grocery_mart/features/shop/domain/usecases/get_category_usecase.dart';
import 'package:grocery_mart/features/shop/domain/usecases/get_exclusive_offer_usecase.dart';
import 'package:grocery_mart/features/shop/domain/usecases/get_grocery_products_usecase.dart';
import 'package:grocery_mart/features/shop/presentation/bloc/shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  final GetExclusiveOffersUseCase getExclusiveOffersUseCase;
  final GetBestSellingProductsUseCase getBestSellingProductsUseCase;
  final GetGroceryProductsUseCase getGroceryProductsUseCase;
  final GetCategoriesUseCase getCategoriesUseCase;

  ShopCubit({
    required this.getBestSellingProductsUseCase,
    required this.getGroceryProductsUseCase,
    required this.getExclusiveOffersUseCase,
    required this.getCategoriesUseCase,
  }) : super(ShopInitial());

  Future<void> loadShopData() async {
    emit(ShopLoading());

    try {
      final exclusiveOffers = await getExclusiveOffersUseCase.call();
      final bestSelling = await getBestSellingProductsUseCase.call();
      final groceryProducts = await getGroceryProductsUseCase.call();
      final categories = await getCategoriesUseCase();

      emit(
        ShopLoaded(
          exclusiveOffers: exclusiveOffers,
          bestSellingProducts: bestSelling,
          groceryProducts: groceryProducts,
          categories: categories,
        ),
      );
    } catch (e) {
      emit(ShopError('Failed to load shop data: ${e.toString()}'));
    }
  }
}
