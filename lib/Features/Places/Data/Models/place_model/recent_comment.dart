import 'package:equatable/equatable.dart';

class RecentComment extends Equatable {
  final int? id;
  final int? userId;
  final String? userName;
  final String? body;
  final String? createdAt;
  final int? ratingValue;

  const RecentComment({
    this.id,
    this.userId,
    this.userName,
    this.body,
    this.createdAt,
    this.ratingValue,
  });

  factory RecentComment.fromJson(Map<String, dynamic> json) => RecentComment(
    id: json['id'] as int?,
    userId: json['user_id'] as int?,
    userName: json['user_name'] as String?,
    body: json['body'] as String?,
    createdAt: json['created_at'] as String?,
    ratingValue: json['rating_value'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': userId,
    'user_name': userName,
    'body': body,
    'created_at': createdAt,
    'rating_value': ratingValue,
  };

  @override
  List<Object?> get props {
    return [id, userId, userName, body, createdAt, ratingValue];
  }
}
