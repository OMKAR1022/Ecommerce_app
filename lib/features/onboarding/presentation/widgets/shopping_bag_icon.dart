import 'package:flutter/material.dart';

class ShoppingBagIcon extends StatelessWidget {
  const ShoppingBagIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,
      child: CustomPaint(
        painter: ShoppingBagPainter(),
      ),
    );
  }
}

class ShoppingBagPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..style = PaintingStyle.fill;

    // Create gradient for the shopping bag
    final gradient = LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        const Color(0xFF64B5F6),
        const Color(0xFF4285F4),
        const Color(0xFF1976D2),
      ],
    );

    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    paint.shader = gradient.createShader(rect);

    // Draw shopping bag shape
    final path = Path();

    // Bag body
    path.moveTo(size.width * 0.2, size.height * 0.35);
    path.lineTo(size.width * 0.15, size.height * 0.85);
    path.quadraticBezierTo(
      size.width * 0.15, size.height * 0.9,
      size.width * 0.2, size.height * 0.9,
    );
    path.lineTo(size.width * 0.8, size.height * 0.9);
    path.quadraticBezierTo(
      size.width * 0.85, size.height * 0.9,
      size.width * 0.85, size.height * 0.85,
    );
    path.lineTo(size.width * 0.8, size.height * 0.35);
    path.close();

    canvas.drawPath(path, paint);

    // Draw handles
    final handlePaint = Paint()
      ..color = const Color(0xFF4285F4)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..strokeCap = StrokeCap.round;

    // Left handle
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width * 0.35, size.height * 0.25),
        width: size.width * 0.2,
        height: size.height * 0.25,
      ),
      -3.14159, // Start angle (pi radians = 180 degrees)
      3.14159,  // Sweep angle (pi radians = 180 degrees)
      false,
      handlePaint,
    );

    // Right handle
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width * 0.65, size.height * 0.25),
        width: size.width * 0.2,
        height: size.height * 0.25,
      ),
      -3.14159, // Start angle
      3.14159,  // Sweep angle
      false,
      handlePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
