import 'package:equatable/equatable.dart';

import 'me.dart';

class UserModel extends Equatable {
  final String? message;
  final Me? me;

  const UserModel({this.message, this.me});

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    message: json['message'] as String?,
    me:
        json['me'] == null
            ? null
            : Me.fromJson(json['me'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {'message': message, 'me': me?.toJson()};

  @override
  List<Object?> get props => [message, me];
}
