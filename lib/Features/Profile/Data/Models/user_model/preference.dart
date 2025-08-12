import 'package:equatable/equatable.dart';

class Preference extends Equatable {
  final int? id;
  final int? userId;
  final List<dynamic>? preferredSeason;
  final List<dynamic>? preferredActivities;
  final List<dynamic>? duration;
  final List<dynamic>? cities;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Preference({
    this.id,
    this.userId,
    this.preferredSeason,
    this.preferredActivities,
    this.duration,
    this.cities,
    this.createdAt,
    this.updatedAt,
  });

  factory Preference.fromJson(Map<String, dynamic> json) => Preference(
    id: json['id'] as int?,
    userId: json['user_id'] as int?,
    preferredSeason: json['preferred_season'] as List<dynamic>?,
    preferredActivities: json['preferred_activities'] as List<dynamic>?,
    duration: json['duration'] as List<dynamic>?,
    cities: json['cities'] as List<dynamic>?,
    createdAt:
        json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
    updatedAt:
        json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': userId,
    'preferred_season': preferredSeason,
    'preferred_activities': preferredActivities,
    'duration': duration,
    'cities': cities,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
  };

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      preferredSeason,
      preferredActivities,
      duration,
      cities,
      createdAt,
      updatedAt,
    ];
  }
}
