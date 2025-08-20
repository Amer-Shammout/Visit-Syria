import 'package:equatable/equatable.dart';

// ignore: must_be_immutable
class ReservationInfoModel extends Equatable {
  String? firstName;
  String? lastName;
  String? gender;
  String? birthDate;
  String? nationality;
  String? email;
  String? phone;
  String? countryCode;
  String? countryISOCode;
  String? isoCode;
  String? passportNumber;
  String? passportExpiryDate;

  ReservationInfoModel({
    this.firstName,
    this.lastName,
    this.gender,
    this.birthDate,
    this.nationality,
    this.email,
    this.phone,
    this.countryCode,
    this.countryISOCode,
    this.isoCode,
    this.passportNumber,
    this.passportExpiryDate,
  });

  factory ReservationInfoModel.fromJson(Map<String, dynamic> json) {
    return ReservationInfoModel(
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      gender: json['gender'] as String?,
      birthDate: json['birth_date'] as String?,
      nationality: json['nationality'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      countryCode: json['country_code'] as String?,
      passportNumber: json['passport_number'] as String?,
      passportExpiryDate: json['passport_expiry_date'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'gender': gender,
      'birth_date': birthDate,
      'nationality': nationality,
      'email': email,
      'phone': phone,
      'country_code': countryCode,
      'passport_number': passportNumber,
      'passport_expiry_date': passportExpiryDate,
    };
  }

  @override
  List<Object?> get props {
    return [
      firstName,
      lastName,
      gender,
      birthDate,
      nationality,
      email,
      phone,
      countryCode,
      countryISOCode,
      isoCode,
      passportNumber,
      passportExpiryDate,
    ];
  }

  ReservationInfoModel copyWith({
    String? firstName,
    String? lastName,
    String? gender,
    String? birthDate,
    String? nationality,
    String? email,
    String? phone,
    String? countryCode,
    String? countryISOCode,
    String? isoCode,
    String? passportNumber,
    String? passportExpiryDate,
  }) {
    return ReservationInfoModel(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      gender: gender ?? this.gender,
      birthDate: birthDate ?? this.birthDate,
      nationality: nationality ?? this.nationality,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      countryCode: countryCode ?? this.countryCode,
      countryISOCode: countryISOCode ?? this.countryISOCode,
      isoCode: isoCode ?? this.isoCode,
      passportNumber: passportNumber ?? this.passportNumber,
      passportExpiryDate: passportExpiryDate ?? this.passportExpiryDate,
    );
  }
}
