import 'package:equatable/equatable.dart';

class ItemEntity extends Equatable {
  final String name;
  final String description;
  final String price;
  final String imagePath;
  final int quantity;

  const ItemEntity({
    required this.name,
    required this.description,
    required this.price,
    required this.imagePath,
    required this.quantity,
  });

  ItemEntity copyWith({
    String? name,
    String? description,
    String? price,
    String? imagePath,
    int? quantity,
  }) {
    return ItemEntity(
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      imagePath: imagePath ?? this.imagePath,
      quantity: quantity ?? this.quantity,
    );
  }

  @override
  List<Object?> get props => [imagePath, name, description, price, quantity];
}
