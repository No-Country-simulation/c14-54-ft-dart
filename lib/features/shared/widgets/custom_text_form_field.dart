import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String? label;
  final String? hint;
  final String? errorMessage;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Function(String)? onFieldSubmitted;
  final Widget? subfixIcon;

  const CustomTextFormField({
    super.key,
    this.label,
    this.onFieldSubmitted,
    this.hint,
    this.errorMessage,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.onChanged,
    this.validator,
    this.subfixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    final border = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent),
      borderRadius: BorderRadius.circular(40),
    );

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 10,
                offset: const Offset(0, 5))
          ]),
      child: Card(
        surfaceTintColor: colors.background,
        elevation: 5,
        child: TextFormField(
          onChanged: onChanged,
          validator: validator,
          onFieldSubmitted: onFieldSubmitted,
          obscureText: obscureText,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.only(top: 25, left: 15, bottom: 10),

            errorMaxLines: 2,
            suffixIcon: subfixIcon,
            floatingLabelStyle: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
            enabledBorder: border,
            focusedBorder: border,
            errorBorder: border.copyWith(
                borderSide: const BorderSide(color: Colors.transparent)),
            focusedErrorBorder: border.copyWith(
                borderSide: const BorderSide(color: Colors.transparent)),
            isDense: true,
            label: label != null
                ? Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(label!),
                  )
                : null,

            hintText: hint,

            errorText: errorMessage,
            focusColor: colors.primary,
            // icon: Icon( Icons.supervised_user_circle_outlined, color: colors.primary, )
          ),
        ),
      ),
    );
  }
}
