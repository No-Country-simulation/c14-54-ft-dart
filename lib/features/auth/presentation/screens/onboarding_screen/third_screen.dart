import 'package:flutter/material.dart';
import 'package:gestion_inventario/features/auth/presentation/widgets/widgets.dart';

class ThirdScreen extends StatelessWidget {
  static const route = 'third_screen';

  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 100),
            child: OnboardingImage(path: 'assets/images/onboarding/1.svg'),
          ),
          Column(
            children: [
              OnboardingTitle(title: 'PERSONALIZACIÓN'),
              OnboardingSubTitle(
                  text: 'Personaliza las categorías de pro ductos'),
              OnboardingSubTitle(text: 'Configura tu perfil de negocio'),
              OnboardingSubTitle(text: 'Configura alertas'),
            ],
          ),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}
