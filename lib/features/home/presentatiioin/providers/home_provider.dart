import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/entities/category_entity.dart';

final homeDataProvider = Provider<HomeData>((ref) {
  return HomeData();
});

class HomeData {
  List<CategoryEntity> get categories => [
    const CategoryEntity(
      id: '1',
      name: 'Clothing',
      image: '/placeholder.svg?height=80&width=80',
      itemCount: 159,
      backgroundColor: Color(0xFFFF6B35),
    ),
    const CategoryEntity(
      id: '2',
      name: 'Shoes',
      image: '/placeholder.svg?height=80&width=80',
      itemCount: 530,
      backgroundColor: Color(0xFF4ECDC4),
    ),
    const CategoryEntity(
      id: '3',
      name: 'Bags',
      image: '/placeholder.svg?height=80&width=80',
      itemCount: 87,
      backgroundColor: Color(0xFFFFE66D),
    ),
    const CategoryEntity(
      id: '4',
      name: 'Lingerie',
      image: '/placeholder.svg?height=80&width=80',
      itemCount: 218,
      backgroundColor: Color(0xFFFF8B94),
    ),
    const CategoryEntity(
      id: '5',
      name: 'Watch',
      image: '/placeholder.svg?height=80&width=80',
      itemCount: 248,
      backgroundColor: Color(0xFF95E1D3),
    ),
    const CategoryEntity(
      id: '6',
      name: 'Hoodies',
      image: '/placeholder.svg?height=80&width=80',
      itemCount: 218,
      backgroundColor: Color(0xFFA8E6CF),
    ),
  ];

  List<ProductEntity> get topProducts => [
    const ProductEntity(
      id: '1',
      name: 'Product 1',
      image: '/placeholder.svg?height=60&width=60',
      price: 25.00,
    ),
    const ProductEntity(
      id: '2',
      name: 'Product 2',
      image: '/placeholder.svg?height=60&width=60',
      price: 35.00,
    ),
    const ProductEntity(
      id: '3',
      name: 'Product 3',
      image: '/placeholder.svg?height=60&width=60',
      price: 45.00,
    ),
    const ProductEntity(
      id: '4',
      name: 'Product 4',
      image: '/placeholder.svg?height=60&width=60',
      price: 55.00,
    ),
    const ProductEntity(
      id: '5',
      name: 'Product 5',
      image: '/placeholder.svg?height=60&width=60',
      price: 65.00,
    ),
  ];

  List<ProductEntity> get newItems => [
    const ProductEntity(
      id: '6',
      name: 'Blue Sneakers',
      image: '/placeholder.svg?height=120&width=120',
      price: 17.00,
    ),
    const ProductEntity(
      id: '7',
      name: 'Red Shoes',
      image: '/placeholder.svg?height=120&width=120',
      price: 32.00,
    ),
    const ProductEntity(
      id: '8',
      name: 'Blue Bag',
      image: '/placeholder.svg?height=120&width=120',
      price: 21.00,
    ),
  ];

  List<ProductEntity> get flashSaleItems => [
    const ProductEntity(
      id: '9',
      name: 'Pink Top',
      image: '/placeholder.svg?height=100&width=100',
      price: 15.00,
      originalPrice: 25.00,
      discountPercentage: 40,
    ),
    const ProductEntity(
      id: '10',
      name: 'Fashion Item',
      image: '/placeholder.svg?height=100&width=100',
      price: 20.00,
      originalPrice: 35.00,
      discountPercentage: 43,
    ),
    const ProductEntity(
      id: '11',
      name: 'Yellow Dress',
      image: '/placeholder.svg?height=100&width=100',
      price: 18.00,
      originalPrice: 30.00,
      discountPercentage: 40,
    ),
    const ProductEntity(
      id: '12',
      name: 'Pink Outfit',
      image: '/placeholder.svg?height=100&width=100',
      price: 22.00,
      originalPrice: 40.00,
      discountPercentage: 45,
    ),
    const ProductEntity(
      id: '13',
      name: 'White Top',
      image: '/placeholder.svg?height=100&width=100',
      price: 16.00,
      originalPrice: 28.00,
      discountPercentage: 43,
    ),
    const ProductEntity(
      id: '14',
      name: 'Purple Dress',
      image: '/placeholder.svg?height=100&width=100',
      price: 24.00,
      originalPrice: 42.00,
      discountPercentage: 43,
    ),
  ];

  List<ProductEntity> get mostPopular => [
    const ProductEntity(
      id: '15',
      name: 'Pink Dress',
      image: '/placeholder.svg?height=120&width=120',
      price: 750.00,
      badge: 'New',
      isFavorite: true,
    ),
    const ProductEntity(
      id: '16',
      name: 'Black Hat',
      image: '/placeholder.svg?height=120&width=120',
      price: 750.00,
      badge: 'Sale',
      isFavorite: false,
    ),
    const ProductEntity(
      id: '17',
      name: 'Red Dress',
      image: '/placeholder.svg?height=120&width=120',
      price: 750.00,
      badge: 'Hot',
      isFavorite: true,
    ),
    const ProductEntity(
      id: '18',
      name: 'Orange Top',
      image: '/placeholder.svg?height=120&width=120',
      price: 750.00,
      isFavorite: false,
    ),
  ];

  List<ProductEntity> get justForYou => [
    const ProductEntity(
      id: '19',
      name: 'Sunglasses Look',
      image: '/placeholder.svg?height=120&width=120',
      price: 17.00,
    ),
    const ProductEntity(
      id: '20',
      name: 'Yellow Top',
      image: '/placeholder.svg?height=120&width=120',
      price: 17.00,
    ),
    const ProductEntity(
      id: '21',
      name: 'Pink Shopping',
      image: '/placeholder.svg?height=120&width=120',
      price: 17.00,
    ),
    const ProductEntity(
      id: '22',
      name: 'Purple Style',
      image: '/placeholder.svg?height=120&width=120',
      price: 17.00,
    ),
    const ProductEntity(
      id: '23',
      name: 'Blue Casual',
      image: '/placeholder.svg?height=120&width=120',
      price: 17.00,
    ),
    const ProductEntity(
      id: '24',
      name: 'Red Fashion',
      image: '/placeholder.svg?height=120&width=120',
      price: 17.00,
    ),
  ];
}
