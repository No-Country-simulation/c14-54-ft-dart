import 'package:flutter/material.dart';

class CustomFilledButton extends StatelessWidget {
  final void Function()? onPressed;
  final String text;
  final Color? buttonColor;
  final TextStyle textStyle;

  const CustomFilledButton({
    super.key,
    this.onPressed,
    required this.text,
    this.buttonColor,
    this.textStyle = const TextStyle(),
  });

  @override
  Widget build(BuildContext context) {
    return FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: buttonColor,
          shape: const StadiumBorder(),
        ),
        onPressed: onPressed,
        child: Text(
          text,
          style: textStyle,
        ));
  }
}
