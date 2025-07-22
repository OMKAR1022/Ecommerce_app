import 'package:flutter/material.dart';

class PasswordDots extends StatelessWidget {
  final int totalDots;
  final int filledDots;
  final bool isError;

  const PasswordDots({
    super.key,
    required this.totalDots,
    required this.filledDots,
    this.isError = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalDots, (index) {
        final isFilled = index < filledDots;
        return Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          width: 16,
          height: 16,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: isFilled
                ? (isError ? Colors.red : const Color(0xFF4285F4))
                : Colors.grey.withOpacity(0.3),
          ),
        );
      }),
    );
  }
}
