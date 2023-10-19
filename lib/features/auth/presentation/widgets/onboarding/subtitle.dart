import 'package:flutter/material.dart';

class OnboardingSubTitle extends StatelessWidget {
  final String text;
  const OnboardingSubTitle({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    final textStyle =
        Theme.of(context).textTheme.headlineLarge!.copyWith(fontSize: 17);
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Text(
        text,
        style: textStyle,
      ),
    );
  }
}
