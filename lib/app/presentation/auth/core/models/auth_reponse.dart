import 'package:equatable/equatable.dart';

import 'package:simple_auth/app/presentation/auth/core/models/auth_token_response.dart';
import 'package:simple_auth/app/presentation/auth/core/models/user_model.dart';

class AuthResponse extends Equatable {
  final AuthTokenResponse tokens;
  final UserModel user;

  const AuthResponse({
    required this.tokens,
    required this.user,
  });

  factory AuthResponse.fromJson(
    Map<String, dynamic> json,
  ) =>
      AuthResponse(
        tokens: AuthTokenResponse.fromJson(json['tokens']),
        user: UserModel.fromJson(json['user']),
      );

  @override
  List<Object?> get props => [
        tokens,
        user,
      ];
}
