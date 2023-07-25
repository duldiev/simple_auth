import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:simple_auth/app/presentation/auth/core/models/auth_params.dart';
import 'package:simple_auth/app/presentation/auth/core/models/auth_reponse.dart';
import 'package:simple_auth/app/presentation/auth/core/service/auth_service.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required this.authService,
  }) : super(AuthState.initial()) {
    on<EmailChanged>(onEmailChanged);
    on<PasswordChanged>(onPasswordChanged);
    on<SignIn>(onSignIn);
    on<SignOut>(onSignOut);
    on<Reset>(onReset);
  }

  final AuthService authService;

  void onReset(
    Reset event,
    Emitter<AuthState> emit,
  ) =>
      emit(state.copyWith(
        authorized: false,
        authorizing: false,
        failed: false,
        message: '',
      ));

  void onEmailChanged(
    EmailChanged event,
    Emitter<AuthState> emit,
  ) =>
      emit(state.copyWith(email: event.value));

  void onPasswordChanged(
    PasswordChanged event,
    Emitter<AuthState> emit,
  ) =>
      emit(state.copyWith(password: event.value));

  Future<void> onSignIn(
    SignIn event,
    Emitter<AuthState> emit,
  ) async {
    emit(state.copyWith(
      authorizing: true,
      authorized: false,
      failed: false,
    ));

    final result = await authService.signIn(AuthParams(
      email: state.email,
      password: state.password,
    ));

    result.fold(
      (l) => emit(state.copyWith(
        authorizing: false,
        failed: true,
        message: l.exception.message ?? '',
      )),
      (r) => emit(state.copyWith(
        authorizing: false,
        authorized: true,
        data: r,
      )),
    );
  }

  Future<void> onSignOut(
    SignOut event,
    Emitter<AuthState> emit,
  ) async {
    await authService.signOut();

    emit(state.copyWith(authorized: false));
  }
}
