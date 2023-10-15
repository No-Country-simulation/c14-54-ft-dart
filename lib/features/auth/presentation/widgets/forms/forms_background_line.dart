import 'package:flutter/material.dart';

class BackgroundLine extends StatelessWidget {
  const BackgroundLine({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: LinePainter(),
      size: const Size(80, 3),
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = Colors.black87;
    final startPoint = Offset(0, size.height / 2);
    final endPoint = Offset(size.width, size.height / 2);
    canvas.drawLine(startPoint, endPoint, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
