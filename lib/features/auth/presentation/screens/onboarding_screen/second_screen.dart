import 'package:flutter/material.dart';
import 'package:gestion_inventario/features/auth/presentation/widgets/widgets.dart';

class SecondScreen extends StatelessWidget {
  static const route = 'second_screen';

  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 100),
            child: OnboardingImage(path: 'assets/images/onboarding/6.svg'),
          ),
          Column(
            children: [
              OnboardingTitle(
                title: 'INFORMES Y ANALÍTICA',
              ),
              OnboardingSubTitle(
                  text: 'Accede a informes detallados de inventario'),
              OnboardingSubTitle(text: 'Visualiza datos clave de tu negocio'),
              OnboardingSubTitle(text: 'Toma decisiones basadas en análisis'),
            ],
          ),
          SizedBox(height: 100),
        ],
      ),
    );
  }
}
