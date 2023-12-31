part of 'auth_bloc.dart';

@freezed
class AuthEvent with _$AuthEvent {
  const factory AuthEvent.emailChanged(
    String value,
  ) = EmailChanged;

  const factory AuthEvent.passwordChanged(
    String value,
  ) = PasswordChanged;

  const factory AuthEvent.signIn() = SignIn;

  const factory AuthEvent.signOut() = SignOut;

  const factory AuthEvent.reset() = Reset;
}
