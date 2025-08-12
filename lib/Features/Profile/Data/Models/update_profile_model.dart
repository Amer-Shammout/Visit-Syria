import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class UpdateProfileModel extends Equatable {
  final String? firstName;
  final String? lastName;
  final String? country;
  final String? gender;
  final String? dateOfBirth;
  final String? phone;
  final String? countryCode;
  final dynamic lang;
  final dynamic themeMode;
  final dynamic allawNotification;
  final List<dynamic>? preferredSeason;
  final List<dynamic>? duration;
  final List<dynamic>? cities;
  final List<dynamic>? preferredActivities;
  final MultipartFile? uploadPhoto;

  const UpdateProfileModel({
    this.uploadPhoto,
    this.firstName,
    this.lastName,
    this.country,
    this.gender,
    this.dateOfBirth,
    this.phone,
    this.countryCode,
    this.lang,
    this.themeMode,
    this.allawNotification,
    this.preferredSeason,
    this.duration,
    this.cities,
    this.preferredActivities,
  });

  factory UpdateProfileModel.fromJson(Map<String, dynamic> json) {
    return UpdateProfileModel(
      firstName: json['first_name'] as dynamic,
      lastName: json['last_name'] as dynamic,
      country: json['country'] as dynamic,
      gender: json['gender'] as String?,
      dateOfBirth: json['date_of_birth'] as dynamic,
      phone: json['phone'] as dynamic,
      countryCode: json['country_code'] as String?,
      lang: json['lang'] as dynamic,
      themeMode: json['theme_mode'] as dynamic,
      allawNotification: json['allaw_notification'] as dynamic,
      preferredSeason: json['preferred_season'] as List<String>?,
      duration: json['duration'] as List<String>?,
      cities: json['cities'] as List<String>?,
      preferredActivities: json['preferred_activities'] as List<String>?,
    );
  }

  Map<String, dynamic> toJson() => {
    'first_name': firstName,
    'last_name': lastName,
    'country': country,
    'gender': gender,
    'date_of_birth': dateOfBirth,
    'phone': phone,
    'country_code': countryCode,
    'lang': lang,
    'theme_mode': themeMode,
    'allaw_notification': allawNotification,
    'preferred_season': preferredSeason,
    'duration': duration,
    'cities': cities,
    'preferred_activities': preferredActivities,
  };

  @override
  List<Object?> get props {
    return [
      firstName,
      lastName,
      country,
      gender,
      dateOfBirth,
      phone,
      countryCode,
      lang,
      themeMode,
      allawNotification,
      preferredSeason,
      duration,
      cities,
      preferredActivities,
    ];
  }
}
