import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final VoidCallback? onSeeAllPressed;
  final Widget? trailing;

  const SectionHeader({
    super.key,
    required this.title,
    this.onSeeAllPressed,
    this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1A1A1A),
            ),
          ),
          if (trailing != null) trailing!,
          if (onSeeAllPressed != null && trailing == null)
            GestureDetector(
              onTap: onSeeAllPressed,
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
    );
  }
}
