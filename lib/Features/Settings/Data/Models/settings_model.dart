import 'package:equatable/equatable.dart';

class SettingsModel extends Equatable {
  final int? id;
  final String? type;
  final String? title;
  final String? description;
  final String? category;
  final String? createdAt;
  final String? updatedAt;

  const SettingsModel({
    this.id,
    this.type,
    this.title,
    this.description,
    this.category,
    this.createdAt,
    this.updatedAt,
  });

  factory SettingsModel.fromJson(Map<String, dynamic> json) => SettingsModel(
    id: json['id'] as int?,
    type: json['type'] as String?,
    title: json['title'] as String?,
    description: json['description'] as String?,
    category: json['category'] as String?,
    createdAt: json['created_at'] as String?,
    updatedAt: json['updated_at'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'type': type,
    'title': title,
    'description': description,
    'category': category,
    'created_at': createdAt,
    'updated_at': updatedAt,
  };

  @override
  List<Object?> get props {
    return [id, type, title, description, category, createdAt, updatedAt];
  }
}
