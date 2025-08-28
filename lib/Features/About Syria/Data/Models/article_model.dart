import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ArticleModel extends Equatable {
  final int? id;
  final String? title;
  final String? body;
  final String? imageUrl;
  final List<dynamic>? tags;
  final String? createdAt;
  final String? updatedAt;
  bool? isSaved;

  ArticleModel({
    this.id,
    this.title,
    this.body,
    this.imageUrl,
    this.tags,
    this.createdAt,
    this.updatedAt,
    this.isSaved,
  });

  factory ArticleModel.fromJson(Map<String, dynamic> json) => ArticleModel(
    id: json['id'] as int?,
    title: json['title'] as String?,
    body: json['body'] as String?,
    imageUrl: json['image_url'] as String?,
    tags: json['tags'] as dynamic,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
    isSaved: json['is_saved'] as bool?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'body': body,
    'image_url': imageUrl,
    'tags': tags,
    'created_at': createdAt,
    'updated_at': updatedAt,
    'is_saved': isSaved,
  };

  @override
  List<Object?> get props {
    return [id, title, body, imageUrl, tags, createdAt, updatedAt, isSaved];
  }
}
