import 'package:flutter/material.dart';

class CustomLoading extends StatelessWidget {
  const CustomLoading({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              strokeWidth: 1,
              color: colors.primary,
              backgroundColor: colors.secondary,
            ),
            const Text('Cargando...'),
          ],
        ),
      ),
    );
  }
}
