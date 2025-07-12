import 'package:grocery_mart/features/shop/domain/entities/category_entity.dart';
import 'package:grocery_mart/features/shop/domain/repositories/shop_repository.dart';

class GetCategoriesUseCase {
  final ShopRepository repository;

  GetCategoriesUseCase({required this.repository});

  Future<List<CategoryEntity>> call() async {
    return await repository.getCategories();
  }
}
