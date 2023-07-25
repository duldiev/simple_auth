import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int id;
  final String email;
  final String nickname;

  const UserModel({
    required this.id,
    required this.email,
    required this.nickname,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] as int,
        email: json['email'] as String,
        nickname: json['nickname'] as String,
      );

  @override
  List<Object?> get props => [
        id,
        email,
        nickname,
      ];
}
