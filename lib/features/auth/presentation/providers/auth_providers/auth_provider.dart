import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gestion_inventario/features/auth/domain/domain.dart';
import 'package:gestion_inventario/features/auth/infrastructure/infrastructure.dart';

final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final authRepository =
      AuthRepositoryImpl(dataSource: AuthDatasourceFirebase());

  return AuthNotifier(
    authRepository: authRepository,
  );
});

class AuthNotifier extends StateNotifier<AuthState> {
  final AuthRepository authRepository;

  AuthNotifier({
    required this.authRepository,
  }) : super(AuthState()) {
    checkAuthStatus();
  }

  Future<void> loginUser(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      final user = await authRepository.login(email: email, password: password);
      _setLoggedUser(user);
    } on FirebaseAuthException catch (e) {
      logout(e.toString());
    } catch (e) {
      logout('Credenciales incorrectas');
    }
  }

  Future<void> registerUser({
    required String email,
    required String password,
    required String username,
    required String phone,
    required String businessname,
  }) async {
    await Future.delayed(const Duration(milliseconds: 500));
    try {
      final user = await authRepository.register(
        businessname: businessname,
        email: email,
        password: password,
        username: username,
        phone: phone,
      );
      state = state.copyWith(
        user: user,
        errorMessage: '',
        authStatus: AuthStatus.notAuthenticated,
      );
    } on FirebaseAuthException catch (e) {
      logout(e.toString());
    } catch (e) {
      logout('Error al crear el usuario');
    }
  }

  void checkAuthStatus() async {
    // if (token == null) return logout();

    // try {
    //   final user = await authRepository.chekAuthStatus(token);
    //   _setLoggedUser(user);
    // } catch (e) {
    //   logout();
    // }
  }

  _setLoggedUser(UserEntity user) async {
    state = state.copyWith(
      user: user,
      authStatus: AuthStatus.authenticated,
      errorMessage: '',
    );
  }

  Future<void> logout([String? errorMessage]) async {
    state = state.copyWith(
      authStatus: AuthStatus.notAuthenticated,
      user: null,
      errorMessage: errorMessage,
    );
  }
}

enum AuthStatus { checking, authenticated, notAuthenticated }

class AuthState {
  final AuthStatus authStatus;
  final UserEntity? user;
  final String errorMessage;

  AuthState({
    this.authStatus = AuthStatus.checking,
    this.user,
    this.errorMessage = '',
  });

  AuthState copyWith({
    AuthStatus? authStatus,
    final UserEntity? user,
    String? errorMessage,
  }) =>
      AuthState(
        authStatus: authStatus ?? this.authStatus,
        user: user ?? this.user,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
