import 'package:flutter/material.dart';

class FormIcon extends StatelessWidget {
  final double scale;
  final IconData icon;
  const FormIcon({
    super.key,
    this.scale = 1,
    this.icon = Icons.person_4,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Transform.scale(
      scale: scale,
      child: Container(
        height: 120,
        width: 120,
        decoration: BoxDecoration(
          color: colors.background,
          borderRadius: BorderRadius.circular(100),
        ),
        child: Icon(
          icon,
          color: colors.primary,
          size: 100,
        ),
      ),
    );
  }
}
