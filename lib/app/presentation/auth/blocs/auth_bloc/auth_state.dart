part of 'auth_bloc.dart';

@freezed
class AuthState with _$AuthState {
  factory AuthState({
    required bool authorizing,
    required bool failed,
    required bool authorized,
  }) = _AuthState;

  const AuthState._();

  factory AuthState.initial() => AuthState(
        authorizing: false,
        failed: false,
        authorized: false,
      );
}
