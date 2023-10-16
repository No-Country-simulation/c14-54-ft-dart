import 'package:flutter/material.dart';

class CustomBackground extends StatelessWidget {
  final Color color;

  const CustomBackground({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: size.height, maxWidth: size.width),
      child: CustomPaint(
        size: const Size(double.infinity, double.infinity),
        painter: CurvePainter(
          color: color.withOpacity(0.8),
          up: true,
        ),
        child: CustomPaint(
            size: const Size(double.infinity, double.infinity),
            painter: CurvePainter(
              color: color,
              up: false,
            )),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  final Color color;
  final bool up;

  CurvePainter({required this.up, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = color;

    if (up) {
      final path = Path()
        ..moveTo(0, size.height / 2)
        ..cubicTo(
          size.width / 2,
          -size.height / 8,
          size.width / 2,
          size.height / 3,
          size.width,
          size.height / 8,
        )
        ..lineTo(size.width, 0)
        ..lineTo(0, 0)
        ..close();

      return canvas.drawPath(path, paint);
    }
    final path = Path()
      ..moveTo(0, size.height / 3)
      ..cubicTo(
        size.width / 2,
        -size.height / 8,
        size.width / 2,
        size.height / 3,
        size.width,
        size.height / 8,
      )
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..close();

    return canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
