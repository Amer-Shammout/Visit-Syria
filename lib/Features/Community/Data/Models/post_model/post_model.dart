import 'package:equatable/equatable.dart';

import 'comment.dart';
import 'user.dart';

class PostModel extends Equatable {
  final int? id;
  final User? user;
  final String? description;
  final String? image;
  final List<dynamic>? tags;
  final String? status;
  final int? likesCount;
  final int? commentsCount;
  final int? savesCount;
  final bool? isLiked;
  final bool? isSaved;
  final List<Comment>? comments;
  final String? createdAt;

  const PostModel({
    this.id,
    this.user,
    this.description,
    this.image,
    this.tags,
    this.status,
    this.likesCount,
    this.commentsCount,
    this.savesCount,
    this.isLiked,
    this.isSaved,
    this.comments,
    this.createdAt,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
    id: json['id'] as int?,
    user:
        json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
    description: json['description'] as String?,
    image: json['image'] as String?,
    tags: json['tags'] as List<dynamic>?,
    status: json['status'] as String?,
    likesCount: json['likes_count'] as int?,
    commentsCount: json['comments_count'] as int?,
    savesCount: json['saves_count'] as int?,
    isLiked: json['is_liked'] as bool?,
    isSaved: json['is_saved'] as bool?,
    comments:
        (json['comments'] as List<dynamic>?)
            ?.map((e) => Comment.fromJson(e as Map<String, dynamic>))
            .toList(),
    createdAt: json['created_at'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'user': user?.toJson(),
    'description': description,
    'image': image,
    'tags': tags,
    'status': status,
    'likes_count': likesCount,
    'comments_count': commentsCount,
    'saves_count': savesCount,
    'is_liked': isLiked,
    'is_saved': isSaved,
    'comments': comments?.map((e) => e.toJson()).toList(),
    'created_at': createdAt,
  };

  PostModel copyWith({
    int? id,
    User? user,
    String? description,
    String? image,
    List<dynamic>? tags,
    String? status,
    int? likesCount,
    int? commentsCount,
    int? savesCount,
    bool? isLiked,
    bool? isSaved,
    List<Comment>? comments,
    String? createdAt,
  }) {
    return PostModel(
      id: id ?? this.id,
      user: user ?? this.user,
      description: description ?? this.description,
      image: image ?? this.image,
      tags: tags ?? this.tags,
      status: status ?? this.status,
      likesCount: likesCount ?? this.likesCount,
      commentsCount: commentsCount ?? this.commentsCount,
      savesCount: savesCount ?? this.savesCount,
      isLiked: isLiked ?? this.isLiked,
      isSaved: isSaved ?? this.isSaved,
      comments: comments ?? this.comments,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props {
    return [
      id,
      user,
      description,
      image,
      tags,
      status,
      likesCount,
      commentsCount,
      savesCount,
      isLiked,
      isSaved,
      comments,
      createdAt,
    ];
  }
}
