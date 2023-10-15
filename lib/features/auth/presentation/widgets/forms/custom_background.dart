import 'package:flutter/material.dart';

class CustomBackground extends StatelessWidget {
  final Color color;
  const CustomBackground({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
          height: size.height,
          width: double.infinity,
          color: color,
        ),
        CustomPaint(
          size: Size(size.width, size.height / 4),
          painter: CurvePainter(),
        ),
      ],
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.black12 // Color de la curva (mismo que el fondo azul)
      ..style = PaintingStyle.fill;

    final path = Path()
      ..moveTo(0, size.height)
      ..quadraticBezierTo(
          size.width / 2, size.height - 100, size.width, size.height)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
