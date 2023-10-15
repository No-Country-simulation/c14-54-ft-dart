import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnboardingImage extends StatelessWidget {
  final String path;
  const OnboardingImage({super.key, required this.path});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return FadeInRight(
      duration: const Duration(seconds: 1),
      child: SizedBox(
        height: 300,
        width: double.infinity,
        child: SvgPicture.asset(
          path,
          colorFilter: ColorFilter.mode(
            colors.secondary,
            BlendMode.srcIn,
          ),
          height: 300,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
