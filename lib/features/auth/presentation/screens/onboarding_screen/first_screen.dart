import 'package:flutter/material.dart';
import 'package:gestion_inventario/features/auth/presentation/widgets/widgets.dart';

class FirstScreen extends StatelessWidget {
  static const route = 'first_screen';

  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 100),
            child: OnboardingImage(path: 'assets/images/onboarding/5.svg'),
          ),
          Column(
            children: [
              OnboardingTitle(title: 'GESTIONA TU INVENTARIO'),
              OnboardingSubTitle(text: 'Impulsa el crecimiento de tu negocio'),
              OnboardingSubTitle(text: 'Analiza tus métricas de ventas'),
              OnboardingSubTitle(text: 'Registra tus ventas'),
            ],
          ),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}
