import 'dart:ui';

class CategoryEntity {
  final String id;
  final String name;
  final String image;
  final int itemCount;
  final Color backgroundColor;

  const CategoryEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.itemCount,
    required this.backgroundColor,
  });
}
