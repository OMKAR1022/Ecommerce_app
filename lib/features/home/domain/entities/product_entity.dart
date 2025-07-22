class ProductEntity {
  final String id;
  final String name;
  final String image;
  final double price;
  final double? originalPrice;
  final String? badge; // 'New', 'Sale', 'Hot', etc.
  final int? discountPercentage;
  final bool isFavorite;

  const ProductEntity({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    this.originalPrice,
    this.badge,
    this.discountPercentage,
    this.isFavorite = false,
  });
}
