part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  factory AuthState({
    required AuthResponse? data,
    required String email,
    required String password,
    required bool authorizing,
    required bool failed,
    required bool authorized,
    required String message,
  }) = _AuthState;

  const AuthState._();

  factory AuthState.initial() => AuthState(
        data: null,
        email: 'maripbekoff@gmail.com',
        password: 'adminadmin',
        authorizing: false,
        failed: false,
        authorized: false,
        message: '',
      );
}
