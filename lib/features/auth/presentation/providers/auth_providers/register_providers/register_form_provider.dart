import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:formz/formz.dart';
import 'package:gestion_inventario/features/auth/presentation/providers/providers.dart';
import 'package:gestion_inventario/features/shared/infrastructure/inputs/inputs.dart';

final registerFormProvider =
    StateNotifierProvider.autoDispose<RegisterFormNotifier, RegsiterFormState>(
        (ref) {
  final registerUserCallBack = ref.watch(authProvider.notifier).registerUser;
  return RegisterFormNotifier(registerUserCallBack);
});

//Notifier

class RegisterFormNotifier extends StateNotifier<RegsiterFormState> {
  final Future<void> Function({
    required String businessname,
    required String email,
    required String password,
    required String phone,
    required String username,
  }) registerUserCallBack;
  RegisterFormNotifier(this.registerUserCallBack) : super(RegsiterFormState());

  onEmailChanged(String value) {
    final newEmail = Email.dirty(value: value);
    state = state.copyWith(
      email: newEmail,
      isValid: Formz.validate([
        newEmail,
        state.password,
        state.username,
        state.phone,
        state.businessname
      ]),
    );
  }

  onPhoneChanged(String value) {
    final newPhone = Phone.dirty(value: value);
    state = state.copyWith(
      phone: newPhone,
      isValid: Formz.validate([
        newPhone,
        state.password,
        state.username,
        state.email,
        state.businessname
      ]),
    );
  }

  onUsernameChanged(String value) {
    final newUsername = Username.dirty(value: value);
    state = state.copyWith(
      username: newUsername,
      isValid: Formz.validate([
        newUsername,
        state.password,
        state.email,
        state.phone,
        state.businessname
      ]),
    );
  }

  onBusinessNameChanged(String value) {
    final newBusinessname = Businessname.dirty(value: value);
    state = state.copyWith(
      businessname: newBusinessname,
      isValid: Formz.validate([
        newBusinessname,
        state.username,
        state.password,
        state.email,
        state.phone,
        state.businessname
      ]),
    );
  }

  onPasswordChanged(String value) {
    final newPassword = Password.dirty(value: value);
    state = state.copyWith(
      password: newPassword,
      isValid: Formz.validate([
        newPassword,
        state.email,
        state.username,
        state.phone,
        state.businessname
      ]),
    );
  }

  void rePasswordChanged(String rePassword) {
    final newPassword = state.password.value;
    if (newPassword == rePassword) {
      state = state.copyWith(passwordIsMatch: true);
    } else {
      state = state.copyWith(passwordIsMatch: false);
    }
  }

  Future<void> onFormSubmit() async {
    _touchEveryField();

    if (!state.isValid || !state.passwordIsMatch) return;
    state = state.copyWith(
      isPosting: true,
    );

    await registerUserCallBack(
      email: state.email.value,
      password: state.password.value,
      phone: state.phone.value,
      username: state.username.value,
      businessname: state.businessname.value,
    );
    await Future.delayed(const Duration(milliseconds: 500));

    state = state.copyWith(
      isPosting: false,
    );
  }

  _touchEveryField() {
    final email = Email.dirty(value: state.email.value);
    final password = Password.dirty(value: state.password.value);
    final username = Username.dirty(value: state.username.value);
    final phone = Phone.dirty(value: state.phone.value);
    state = state.copyWith(
      isFormPosted: true,
      email: email,
      password: password,
      passwordIsMatch: state.passwordIsMatch,
      phone: phone,
      username: username,
      isValid: Formz.validate(
        [
          email,
          password,
          username,
          phone,
        ],
      ),
    );
  }
}

//State

class RegsiterFormState {
  final bool isPosting;
  final bool isFormPosted;
  final bool isValid;
  final Email email;
  final Phone phone;
  final Username username;
  final Businessname businessname;
  final Password password;
  final bool passwordIsMatch;

  RegsiterFormState({
    this.businessname = const Businessname.pure(),
    this.passwordIsMatch = true,
    this.isPosting = false,
    this.isFormPosted = false,
    this.isValid = false,
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.phone = const Phone.pure(),
    this.username = const Username.pure(),
  });

  RegsiterFormState copyWith({
    final bool? isPosting,
    final bool? isFormPosted,
    final bool? isValid,
    final Email? email,
    final Password? password,
    final bool? passwordIsMatch,
    final Phone? phone,
    final Username? username,
    final Businessname? businessname,
  }) =>
      RegsiterFormState(
        isPosting: isPosting ?? this.isPosting,
        isFormPosted: isFormPosted ?? this.isFormPosted,
        isValid: isValid ?? this.isValid,
        email: email ?? this.email,
        password: password ?? this.password,
        passwordIsMatch: passwordIsMatch ?? this.passwordIsMatch,
        phone: phone ?? this.phone,
        username: username ?? this.username,
        businessname: businessname ?? this.businessname,
      );
  @override
  String toString() {
    return '''
    isPosting:$isPosting,
    isformPosted:$isFormPosted,
    isValid:$isValid,
    emailt:$email,
    password:$password
    isPasswordMatch:$passwordIsMatch
    phone:$phone
    username:$username
    
''';
  }
}
