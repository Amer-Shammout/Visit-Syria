import 'package:equatable/equatable.dart';

import 'user.dart';

class Comment extends Equatable {
  final int? id;
  final User? user;
  final String? comment;
  final String? createdAt;

  const Comment({this.id, this.user, this.comment, this.createdAt});

  factory Comment.fromJson(Map<String, dynamic> json) => Comment(
    id: json['id'] as int?,
    user:
        json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
    comment: json['comment'] as String?,
    createdAt: json['created_at'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'user': user?.toJson(),
    'comment': comment,
    'created_at': createdAt,
  };

  @override
  List<Object?> get props => [id, user, comment, createdAt];
}
