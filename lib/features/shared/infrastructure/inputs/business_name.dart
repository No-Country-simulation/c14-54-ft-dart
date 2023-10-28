import 'package:formz/formz.dart';

enum BusinessnameError { empty, format }

class Businessname extends FormzInput<String, BusinessnameError> {
  static final RegExp emailRegExp = RegExp(
    r'^^[a-zA-Z0-9\s.-]{3,50}$',
  );
  const Businessname.pure() : super.pure('');
  const Businessname.dirty({String value = ''}) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == BusinessnameError.empty) return 'El campo es requerido';
    if (displayError == BusinessnameError.format) {
      return 'No tiene formato de nombre de negocio';
    }

    return null;
  }

  @override
  BusinessnameError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return BusinessnameError.empty;
    if (!emailRegExp.hasMatch(value)) return BusinessnameError.format;
    return null;
  }
}
