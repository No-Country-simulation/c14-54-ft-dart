import 'package:formz/formz.dart';

enum UsernameError { empty, format }

class Username extends FormzInput<String, UsernameError> {
  static final RegExp emailRegExp = RegExp(
    r'^[a-z0-9_]{3,20}$',
  );
  const Username.pure() : super.pure('');
  const Username.dirty({String value = ''}) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == UsernameError.empty) return 'El campo es requerido';
    if (displayError == UsernameError.format) {
      return 'No tiene formato de nombre de usuario';
    }

    return null;
  }

  @override
  UsernameError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return UsernameError.empty;
    if (!emailRegExp.hasMatch(value)) return UsernameError.format;
    return null;
  }
}
