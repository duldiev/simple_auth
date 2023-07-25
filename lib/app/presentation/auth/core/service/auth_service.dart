import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:simple_auth/app/presentation/auth/core/models/auth_reponse.dart';
import 'package:simple_auth/app/presentation/auth/core/models/auth_params.dart';
import 'package:simple_auth/core/exceptions/failure.dart';
import 'package:simple_auth/core/services/base_client.dart';

@injectable
class AuthService extends BaseClient {
  Future<Either<Failure, AuthResponse>> signIn(
    AuthParams params,
  ) async {
    final request = await call(
      RestMethod.post,
      '/api/v1/auth/login',
      body: params.toJson(),
    );
    return request.fold(
      (failure) => Left(failure),
      (response) => Right(AuthResponse.fromJson(response)),
    );
  }

  Future<void> signOut() async {
    return;
  }
}
