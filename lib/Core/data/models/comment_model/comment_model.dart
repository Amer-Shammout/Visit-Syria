import 'package:equatable/equatable.dart';

import 'user.dart';

class CommentModel extends Equatable {
  final int? id;
  final String? body;
  final User? user;
  final dynamic userRating;
  final String? createdAt;

  const CommentModel({
    this.id,
    this.body,
    this.user,
    this.userRating,
    this.createdAt,
  });

  factory CommentModel.fromJson(Map<String, dynamic> json) => CommentModel(
    id: json['id'] as int?,
    body: json['body'] as String?,
    user:
        json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
    userRating: json['user_rating']['rating_value'] as dynamic,
    createdAt: json['created_at'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'body': body,
    'user': user?.toJson(),
    'user_rating': userRating,
    'created_at': createdAt,
  };

  @override
  List<Object?> get props => [id, body, user, userRating, createdAt];
}
