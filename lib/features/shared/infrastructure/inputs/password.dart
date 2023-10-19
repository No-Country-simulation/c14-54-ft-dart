import 'package:formz/formz.dart';

enum PasswordError { empty, format }

class Password extends FormzInput<String, PasswordError> {
  static final RegExp passwordRegExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );
  const Password.pure() : super.pure('');
  const Password.dirty({String value = ''}) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == PasswordError.empty) return 'El campo es requerido';
    if (displayError == PasswordError.format) {
      return 'Debe contener al menos 8 caracteres.';
    }

    return null;
  }

  @override
  PasswordError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return PasswordError.empty;
    if (!passwordRegExp.hasMatch(value)) return PasswordError.format;
    return null;
  }
}
