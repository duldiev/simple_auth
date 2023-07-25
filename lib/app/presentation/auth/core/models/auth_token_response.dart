import 'package:equatable/equatable.dart';

class AuthTokenResponse extends Equatable {
  final String accessToken;
  final String refreshToken;

  const AuthTokenResponse({
    required this.accessToken,
    required this.refreshToken,
  });

  factory AuthTokenResponse.fromJson(Map<String, dynamic> json) =>
      AuthTokenResponse(
        accessToken: json['accessToken'] as String,
        refreshToken: json['refreshToken'] as String,
      );

  @override
  List<Object?> get props => [
        accessToken,
        refreshToken,
      ];
}
