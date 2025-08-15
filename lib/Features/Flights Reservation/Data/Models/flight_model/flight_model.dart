import 'package:equatable/equatable.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Data/Models/flight_model/one_way.dart';

class FlightModel extends Equatable {
  final String? id;
  final bool? isRoundTrip;
  final num? priceTotal;
  final String? currency;
  final int? travelerCount;
  final num? pricePerPassenger;
  final int? seatsRemaining;
  final OneWay? departureModel;
  final OneWay? flightModelReturn;

  const FlightModel({
    this.id,
    this.isRoundTrip,
    this.priceTotal,
    this.currency,
    this.travelerCount,
    this.pricePerPassenger,
    this.seatsRemaining,
    this.departureModel,
    this.flightModelReturn,
  });

  factory FlightModel.fromJson(Map<String, dynamic> json) => FlightModel(
    id: json['id'] as String?,
    isRoundTrip: json['is_round_trip'] as bool?,
    priceTotal: json['price_total'] as num?,
    currency: json['currency'] as String?,
    travelerCount: json['traveler_count'] as int?,
    pricePerPassenger: json['price_per_passenger'] as num?,
    seatsRemaining: json['seats_remaining'] as int?,
    departureModel:
        json['departure'] == null
            ? null
            : OneWay.fromJson(json['departure'] as Map<String, dynamic>),
    flightModelReturn:
        json['return'] == null
            ? null
            : OneWay.fromJson(json['return'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'is_round_trip': isRoundTrip,
    'price_total': priceTotal,
    'currency': currency,
    'traveler_count': travelerCount,
    'price_per_passenger': pricePerPassenger,
    'seats_remaining': seatsRemaining,
    'departure': departureModel?.toJson(),
    'return': flightModelReturn?.toJson(),
  };

  @override
  List<Object?> get props {
    return [
      id,
      isRoundTrip,
      priceTotal,
      currency,
      travelerCount,
      pricePerPassenger,
      seatsRemaining,
      departureModel,
      flightModelReturn,
    ];
  }
}
