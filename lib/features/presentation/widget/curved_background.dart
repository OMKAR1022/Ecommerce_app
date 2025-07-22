import 'package:flutter/material.dart';

class CurvedBackground extends StatelessWidget {
  final Widget child;
  final bool showAvatar;

  const CurvedBackground({
    super.key,
    required this.child,
    this.showAvatar = false,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background with curves
          Container(
            width: double.infinity,
            height: double.infinity,
            color: const Color(0xFFF8F9FA),
          ),
          // Top blue curve
          Positioned(
            top: -100,
            left: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: const BoxDecoration(
                color: Color(0xFF4285F4),
                shape: BoxShape.circle,
              ),
            ),
          ),
          // Bottom right blue curve
          Positioned(
            bottom: -50,
            right: -50,
            child: Container(
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                color: Color(0xFF4285F4),
                shape: BoxShape.circle,
              ),
            ),
          ),
          // Light blue overlay curves
          Positioned(
            top: -50,
            right: -150,
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                color: const Color(0xFF4285F4).withOpacity(0.1),
                shape: BoxShape.circle,
              ),
            ),
          ),
          // Avatar if needed
          if (showAvatar)
            Positioned(
              top: 300,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFE91E63),
                  ),
                  child: ClipOval(
                    child: Image.network(
                      '/placeholder.svg?height=100&width=100',
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const Icon(
                          Icons.person,
                          size: 50,
                          color: Colors.white,
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          // Content
          SafeArea(child: child),
        ],
      ),
    );
  }
}
