import 'package:equatable/equatable.dart';

class Profile extends Equatable {
  final int? id;
  final String? firstName;
  final String? lastName;
  final dynamic dateOfBirth;
  final String? gender;
  final dynamic photo;
  final String? country;
  final dynamic phone;
  final String? countryCode;
  final String? lang;
  final String? themeMode;
  final int? allowNotification;

  const Profile({
    this.id,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.gender,
    this.photo,
    this.country,
    this.phone,
    this.countryCode,
    this.lang,
    this.themeMode,
    this.allowNotification,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
    id: json['id'] as int?,
    firstName: json['first_name'] as String?,
    lastName: json['last_name'] as String?,
    dateOfBirth: json['date_of_birth'] as dynamic,
    gender: json['gender'] as String?,
    photo: json['photo'] as dynamic,
    country: json['country'] as String?,
    phone: json['phone'] as dynamic,
    countryCode: json['country_code'] as String?,
    lang: json['lang'] as String?,
    themeMode: json['theme_mode'] as String?,
    allowNotification: json['allow_notification'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'first_name': firstName,
    'last_name': lastName,
    'date_of_birth': dateOfBirth,
    'gender': gender,
    'photo': photo,
    'country': country,
    'phone': phone,
    'country_code': countryCode,
    'lang': lang,
    'theme_mode': themeMode,
    'allow_notification': allowNotification,
  };

  @override
  List<Object?> get props {
    return [
      id,
      firstName,
      lastName,
      dateOfBirth,
      gender,
      photo,
      country,
      phone,
      countryCode,
      lang,
      themeMode,
      allowNotification,
    ];
  }
}
