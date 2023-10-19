import 'package:formz/formz.dart';

enum PhoneError { empty, format }

class Phone extends FormzInput<String, PhoneError> {
  static final RegExp emailRegExp = RegExp(
    r'^\d{1,10}$',
  );
  const Phone.pure() : super.pure('');
  const Phone.dirty({String value = ''}) : super.dirty(value);

  String? get errorMessage {
    if (isValid || isPure) return null;

    if (displayError == PhoneError.empty) return 'El campo es requerido';
    if (displayError == PhoneError.format) {
      return 'No tiene formato de teléfono';
    }

    return null;
  }

  @override
  PhoneError? validator(String value) {
    if (value.isEmpty || value.trim().isEmpty) return PhoneError.empty;
    if (!emailRegExp.hasMatch(value)) return PhoneError.format;
    return null;
  }
}
