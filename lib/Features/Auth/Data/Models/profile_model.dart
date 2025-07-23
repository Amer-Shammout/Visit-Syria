import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class ProfileModel extends Equatable {
  final int? id;
  final int? userId;
  final String? firstName;
  final String? lastName;
  final dynamic dateOfBirth;
  final String? gender;
  final String? country;
  final dynamic phone;
  final dynamic countryCode;
  final String? photo;
  final MultipartFile? uploadPhoto;
  final String? lang;
  final String? themeMode;
  final int? allowNotification;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const ProfileModel({
    this.id,
    this.userId,
    this.uploadPhoto,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.gender,
    this.country,
    this.phone,
    this.countryCode,
    this.photo,
    this.lang,
    this.themeMode,
    this.allowNotification,
    this.createdAt,
    this.updatedAt,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    id: json['id'] as int?,
    userId: json['user_id'] as int?,
    firstName: json['first_name'] as String?,
    lastName: json['last_name'] as String?,
    dateOfBirth: json['date_of_birth'] as dynamic,
    gender: json['gender'] as String?,
    country: json['country'] as String?,
    phone: json['phone'] as dynamic,
    countryCode: json['country_code'] as dynamic,
    photo: json['photo'] as String?,
    lang: json['lang'] as String?,
    themeMode: json['theme_mode'] as String?,
    allowNotification: json['allow_notification'] as int?,
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
    'first_name': firstName,
    'last_name': lastName,
    // 'date_of_birth': dateOfBirth,
    // 'gender': gender,
    'country': country,
    // 'phone': phone,
    'country_code': countryCode,
    // 'photo': uploadPhoto,
    // 'lang': lang,
    // 'theme_mode': themeMode,
    // 'allow_notification': allowNotification,
    // 'created_at': createdAt?.toIso8601String(),
    // 'updated_at': updatedAt?.toIso8601String(),
  };

  Future<FormData> toFormData() async {
    final map = {
      'first_name': firstName,
      'last_name': lastName,
      'country': country,
      // 'country_code': countryCode,
      'photo': uploadPhoto,
    };

    return FormData.fromMap(map);
  }

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      firstName,
      lastName,
      dateOfBirth,
      gender,
      country,
      phone,
      countryCode,
      photo,
      lang,
      themeMode,
      allowNotification,
      createdAt,
      updatedAt,
    ];
  }
}
