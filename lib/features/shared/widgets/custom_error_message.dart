import 'package:flutter/material.dart';

void customErrorMessage(BuildContext context, String errorMessage) {
  final colors = Theme.of(context).colorScheme;
  final textStyle = Theme.of(context).textTheme.labelLarge!.copyWith(
        color: colors.primary,
        fontWeight: FontWeight.bold,
      );
  ScaffoldMessenger.of(context).hideCurrentSnackBar();
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: colors.secondaryContainer,
      content: Text(
        errorMessage,
        style: textStyle,
      ),
    ),
  );
}
