import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:gestion_inventario/features/auth/presentation/providers/providers.dart';
import 'package:gestion_inventario/features/shared/infrastructure/inputs/inputs.dart';

//Provider

final registerFormProvider =
    StateNotifierProvider.autoDispose<RegisterFormNotifier, RegisterFormState>(
        (ref) {
  final registerUserCallBack = ref.watch(authProvider.notifier).registerUser;
  return RegisterFormNotifier(registerUserCallBack);
});

//Notifier

class RegisterFormNotifier extends StateNotifier<RegisterFormState> {
  final Future<void> Function(String, String) registerUserCallBack;
  RegisterFormNotifier(this.registerUserCallBack) : super(RegisterFormState());

  onEmailChanged(String value) {
    final newEmail = Email.dirty(value: value);
    state = state.copyWith(
      email: newEmail,
      isValid: Formz.validate([newEmail, state.password]),
    );
  }

  onPasswordChanged(String value) {
    final newPassword = Password.dirty(value: value);
    state = state.copyWith(
      password: newPassword,
      isValid: Formz.validate([newPassword, state.email]),
    );
  }

  onFormSubmit() async {
    _touchEveryField();
    if (!state.isValid) return;
    state = state.copyWith(
      isPosting: true,
    );
    await registerUserCallBack(state.email.value, state.password.value);
    state = state.copyWith(
      isPosting: false,
    );
  }

  _touchEveryField() {
    final email = Email.dirty(value: state.email.value);
    final password = Password.dirty(value: state.password.value);
    state = state.copyWith(
      isFormPosted: true,
      email: email,
      password: password,
      isValid: Formz.validate([email, password]),
    );
  }
}

//State

class RegisterFormState {
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final Email email;
  final Password password;
  final Phone phone;
  final Username userName;

  RegisterFormState({
    this.phone = const Phone.pure(),
    this.userName = const Username.pure(),
    this.isPosting = false,
    this.isFormPosted = false,
    this.isValid = false,
    this.email = const Email.pure(),
    this.password = const Password.pure(),
  });

  RegisterFormState copyWith({
    final bool? isPosting,
    final bool? isFormPosted,
    final bool? isValid,
    final Email? email,
    final Password? password,
  }) =>
      RegisterFormState(
        isPosting: isPosting ?? this.isPosting,
        isFormPosted: isFormPosted ?? this.isFormPosted,
        isValid: isValid ?? this.isValid,
        email: email ?? this.email,
        password: password ?? this.password,
      );
  @override
  String toString() {
    return '''
    isPosting:$isPosting,
    isformPosted:$isFormPosted,
    isValid:$isValid,
    emailt:$email,
    password:$password
''';
  }
}
