import 'package:equatable/equatable.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Data/Models/flight_model/one_way.dart';

class FlightModel extends Equatable {
  final String? id;
  final String? travelClass;
  final bool? isRoundTrip;
  final num? priceTotal;
  final String? currency;
  final int? travelerCount;
  final num? pricePerPassenger;
  final int? seatsRemaining;
  final OneWay? departureModel;
  final OneWay? returnModel;

  const FlightModel({
    this.id,
    this.isRoundTrip,
    this.priceTotal,
    this.currency,
    this.travelerCount,
    this.pricePerPassenger,
    this.seatsRemaining,
    this.departureModel,
    this.returnModel,
    this.travelClass,
  });

  factory FlightModel.fromJson(Map<String, dynamic> json) => FlightModel(
    id: json['id'] as String?,
    travelClass: json['travel_class'] as String?,
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
    returnModel:
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
    'return': returnModel?.toJson(),
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
      returnModel,
    ];
  }
}
