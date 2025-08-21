import 'package:equatable/equatable.dart';

class Passenger extends Equatable {
  final String? firstName;
  final String? lastName;
  final String? gender;
  final String? birthDate;
  final String? nationality;
  final String? email;
  final String? phone;
  final String? countryCode;
  final String? passportNumber;
  final String? passportExpiryDate;

  const Passenger({
    this.firstName,
    this.lastName,
    this.gender,
    this.birthDate,
    this.nationality,
    this.email,
    this.phone,
    this.countryCode,
    this.passportNumber,
    this.passportExpiryDate,
  });

  factory Passenger.fromFlightDataAirlineRoyalJordanianOriginAirportCodeDamOriginAirportNameDestinationAirportCodeLhrDestinationAirportNameDepartureDate20250901DepartureTime0840ArrivalDate20250901ArrivalTime1525DurationHours9Stops1TravelClassEconomyPriceTotal2160CurrencyUsdTravelerCount3PricePerPassenger720SeatsRemaining5SegmentsSegmentNumber1OriginAirportCodeDamOriginAirportNameDestinationAirportCodeAmmDestinationAirportNameDepartureTime202509010840ArrivalTime202509010930DurationHours1AirlineRoyalJordanianLayoverHours2SegmentNumber2OriginAirportCodeAmmOriginAirportNameDestinationAirportCodeLhrDestinationAirportNameDepartureTime202509011135ArrivalTime202509011525DurationHours6AirlineRoyalJordanianNumberOfAdults3NumberOfChildren0NumberOfInfants0PassengersFirstNameAliLastNameAhmadGenderMaleBirthDate19900101NationalitySyrianEmailAliExampleComPhone0999999999CountryCode963PassportNumber7465839PassportExpiryDate20261205FirstNameSaraLastNameMohamedGenderFemaleBirthDate19950520NationalityEgyptianPassportNumber7460839PassportExpiryDate20261205FirstNameSaraLastNameMohamedGenderFemaleBirthDate19950520NationalityEgyptianPassportNumber7465809PassportExpiryDate2026125(
    Map<String, dynamic> json,
  ) {
    return Passenger(
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

  Map<String, dynamic>
  toFlightDataAirlineRoyalJordanianOriginAirportCodeDamOriginAirportNameDestinationAirportCodeLhrDestinationAirportNameDepartureDate20250901DepartureTime0840ArrivalDate20250901ArrivalTime1525DurationHours9Stops1TravelClassEconomyPriceTotal2160CurrencyUsdTravelerCount3PricePerPassenger720SeatsRemaining5SegmentsSegmentNumber1OriginAirportCodeDamOriginAirportNameDestinationAirportCodeAmmDestinationAirportNameDepartureTime202509010840ArrivalTime202509010930DurationHours1AirlineRoyalJordanianLayoverHours2SegmentNumber2OriginAirportCodeAmmOriginAirportNameDestinationAirportCodeLhrDestinationAirportNameDepartureTime202509011135ArrivalTime202509011525DurationHours6AirlineRoyalJordanianNumberOfAdults3NumberOfChildren0NumberOfInfants0PassengersFirstNameAliLastNameAhmadGenderMaleBirthDate19900101NationalitySyrianEmailAliExampleComPhone0999999999CountryCode963PassportNumber7465839PassportExpiryDate20261205FirstNameSaraLastNameMohamedGenderFemaleBirthDate19950520NationalityEgyptianPassportNumber7460839PassportExpiryDate20261205FirstNameSaraLastNameMohamedGenderFemaleBirthDate19950520NationalityEgyptianPassportNumber7465809PassportExpiryDate2026125() {
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
      passportNumber,
      passportExpiryDate,
    ];
  }
}
