import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../providers/home_provider.dart';
import '../widgets/section_header.dart';
import '../widgets/product_card.dart';
import '../widgets/flash_sale_timer.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeData = ref.watch(homeDataProvider);

    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // App Bar
            SliverAppBar(
              floating: true,
              backgroundColor: Color(0xFFF8F9FA),
              elevation: 0,
              title: const Text(
                'Shop',
                style: TextStyle(
                  color: Color(0xFF1A1A1A),
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              actions: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Row(
                    children: [
                      // Search Bar
                      Container(
                        width: 200,
                        height: 50,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF3F4F6),
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: const TextField(
                          decoration: InputDecoration(
                            hintText: 'Search',
                            hintStyle: TextStyle(
                              color: Color(0xFF9CA3AF),
                              fontSize: 19,
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Color(0xFF9CA3AF),
                              size: 20,
                            ),
                            suffixIcon: Icon(Icons.camera_alt_outlined,color: Colors.blue,),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: 8),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      // Camera Icon

                    ],
                  ),
                ),
              ],
            ),

            // Big Sale Banner
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.all(16),
                height: 150,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xFFFF8A00), Color(0xFFFFB347)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      left: 20,
                      top: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Big Sale',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Text(
                            'up to 50%',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                            decoration: BoxDecoration(
                              color: const Color(0xFF4285F4),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Text(
                              'Shop Now',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.horizontal(right: Radius.circular(16)),
                        child: Image.asset(
                          "assets/home/big_sale.png",
                          fit: BoxFit.fill,
                          width: 120,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 120,
                              color: Colors.white.withOpacity(0.2),
                              child: const Icon(Icons.person, color: Colors.white),
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Categories Section
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SectionHeader(title: 'Categories'),
                  const SizedBox(height: 16),
                  Container(
                    height: 200,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.8,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                      ),
                      itemCount: homeData.categories.length,
                      itemBuilder: (context, index) {
                        final category = homeData.categories[index];
                        return Container(
                          decoration: BoxDecoration(
                            color: category.backgroundColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                bottom: 12,
                                left: 12,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      category.name,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      '${category.itemCount}',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                right: 8,
                                top: 8,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    category.image,
                                    width: 60,
                                    height: 60,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        width: 60,
                                        height: 60,
                                        color: Colors.white.withOpacity(0.2),
                                        child: const Icon(Icons.category, color: Colors.white),
                                      );
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Top Products Section
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: 32),
                  const SectionHeader(title: 'Top Products'),
                  const SizedBox(height: 16),
                  SizedBox(
                    height: 80,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: homeData.topProducts.length,
                      itemBuilder: (context, index) {
                        final product = homeData.topProducts[index];
                        return Container(
                          width: 60,
                          margin: const EdgeInsets.only(right: 16),
                          child: Column(
                            children: [
                              Container(
                                width: 60,
                                height: 60,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey[100],
                                ),
                                child: ClipOval(
                                  child: Image.network(
                                    product.image,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Icon(Icons.image, color: Colors.grey);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // New Items Section
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: 32),
                  const SectionHeader(title: 'New Items'),
                  const SizedBox(height: 16),
                  Container(
                    height: 200,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: homeData.newItems.length,
                      itemBuilder: (context, index) {
                        final product = homeData.newItems[index];
                        return Container(
                          width: 140,
                          margin: const EdgeInsets.only(right: 12),
                          child: ProductCard(product: product),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Flash Sale Section
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: 32),
                  SectionHeader(
                    title: 'Flash Sale',
                    trailing: const FlashSaleTimer(),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.8,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                      ),
                      itemCount: homeData.flashSaleItems.length,
                      itemBuilder: (context, index) {
                        final product = homeData.flashSaleItems[index];
                        return ProductCard(product: product);
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Most Popular Section
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: 32),
                  const SectionHeader(title: 'Most Popular'),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.8,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                      ),
                      itemCount: homeData.mostPopular.length,
                      itemBuilder: (context, index) {
                        final product = homeData.mostPopular[index];
                        return ProductCard(
                          product: product,
                          onFavoritePressed: () {
                            // Handle favorite toggle
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            // Just For You Section
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const SizedBox(height: 32),
                  SectionHeader(
                    title: 'Just For You',
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.star, color: Color(0xFFFFB347), size: 16),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: [
                              const Text(
                                'See All',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF4285F4),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Container(
                                width: 20,
                                height: 20,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF4285F4),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                  size: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.8,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                      ),
                      itemCount: homeData.justForYou.length,
                      itemBuilder: (context, index) {
                        final product = homeData.justForYou[index];
                        return ProductCard(product: product);
                      },
                    ),
                  ),
                  const SizedBox(height: 100), // Bottom padding for navigation
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNavItem(Icons.home, true),
            _buildNavItem(Icons.favorite_border, false),
            _buildNavItem(Icons.chat_bubble_outline, false),
            _buildNavItem(Icons.shopping_bag_outlined, false),
            _buildNavItem(Icons.person_outline, false),
          ],
        ),
      ),
    );
  }

  Widget _buildNavItem(IconData icon, bool isActive) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: Icon(
        icon,
        color: isActive ? const Color(0xFF4285F4) : const Color(0xFF9CA3AF),
        size: 24,
      ),
    );
  }
}
