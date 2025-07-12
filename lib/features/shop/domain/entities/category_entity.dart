import 'package:flutter/material.dart';

class CategoryEntity {
  final String id;
  final String name;
  final String imagePath;
  final Color backgroundColor;

  CategoryEntity({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.backgroundColor,
  });
}
