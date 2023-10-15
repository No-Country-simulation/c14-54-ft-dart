import 'package:flutter/material.dart';

import '../widgets.dart';

class FormTitle extends StatelessWidget {
  final String title;
  const FormTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const BackgroundLine(),
          const SizedBox(
            width: 10,
          ),
          Text(
            title,
            style: textStyles.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: colors.primary,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          const BackgroundLine(),
        ],
      ),
    );
  }
}
