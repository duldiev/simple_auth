import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthState.initial()) {
    on<SignIn>(onSignIn);
    on<SignOut>(onSignOut);
  }

  Future<void> onSignIn(
    SignIn event,
    Emitter<AuthState> emit,
  ) async {}

  Future<void> onSignOut(
    SignOut event,
    Emitter<AuthState> emit,
  ) async {}
}
