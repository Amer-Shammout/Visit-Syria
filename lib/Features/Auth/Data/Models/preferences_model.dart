import 'package:equatable/equatable.dart';

class PreferencesModel extends Equatable {
  final List<String>? preferredSeason;
  final List<String>? preferredActivities;
  final List<String>? duration;
  final List<String>? cities;

  const PreferencesModel({
    this.preferredSeason,
    this.preferredActivities,
    this.duration,
    this.cities,
  });

  factory PreferencesModel.fromJson(Map<String, dynamic> json) {
    return PreferencesModel(
      preferredSeason: json['preferred_season'] as List<String>?,
      preferredActivities: json['preferred_activities'] as List<String>?,
      duration: json['duration'] as List<String>?,
      cities: json['cities'] as List<String>?,
    );
  }

  Map<String, dynamic> toJson() => {
    'preferred_season': preferredSeason,
    'preferred_activities': preferredActivities,
    'duration': duration,
    'cities': cities,
  };

  @override
  List<Object?> get props {
    return [preferredSeason, preferredActivities, duration, cities];
  }
}
