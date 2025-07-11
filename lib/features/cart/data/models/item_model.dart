import 'package:grocery_mart/features/cart/domain/entities/item_entity.dart';

class ItemModel extends ItemEntity {
  const ItemModel({
    required super.name,
    required super.description,
    required super.price,
    required super.imagePath,
    required super.quantity,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      name: json['name'] ?? '',
      description: json['description'] ?? '',
      price: json['price'] ?? '',
      imagePath: json['imagePath'] ?? '',
      quantity: json['quantity'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'description': description,
      'price': price,
      'imagePath': imagePath,
      'quantity': quantity,
    };
  }
}
