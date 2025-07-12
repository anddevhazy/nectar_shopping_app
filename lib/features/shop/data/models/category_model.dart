import 'package:flutter/material.dart';
import 'package:grocery_mart/features/shop/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({
    required super.id,
    required super.name,
    required super.imagePath,
    required super.backgroundColor,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      name: json['name'],
      imagePath: json['imagePath'],
      backgroundColor: Color(json['backgroundColor']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imagePath': imagePath,
      'backgroundColor': backgroundColor.value,
    };
  }
}
