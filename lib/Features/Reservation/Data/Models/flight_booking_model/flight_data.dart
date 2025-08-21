import 'package:equatable/equatable.dart';

import 'segment.dart';

class FlightData extends Equatable {
  final String? airline;
  final String? originAirportCode;
  final String? originAirportName;
  final String? destinationAirportCode;
  final String? destinationAirportName;
  final String? departureDate;
  final String? departureTime;
  final String? arrivalDate;
  final String? arrivalTime;
  final int? durationHours;
  final int? stops;
  final String? travelClass;
  final int? priceTotal;
  final String? currency;
  final int? travelerCount;
  final int? pricePerPassenger;
  final int? seatsRemaining;
  final List<Segment>? segments;

  const FlightData({
    this.airline,
    this.originAirportCode,
    this.originAirportName,
    this.destinationAirportCode,
    this.destinationAirportName,
    this.departureDate,
    this.departureTime,
    this.arrivalDate,
    this.arrivalTime,
    this.durationHours,
    this.stops,
    this.travelClass,
    this.priceTotal,
    this.currency,
    this.travelerCount,
    this.pricePerPassenger,
    this.seatsRemaining,
    this.segments,
  });

  factory FlightData.fromJson(Map<String, dynamic> json) {
    return FlightData(
      airline: json['airline'] as String?,
      originAirportCode: json['origin_airport_code'] as String?,
      originAirportName: json['origin_airport_name'] as String?,
      destinationAirportCode: json['destination_airport_code'] as String?,
      destinationAirportName: json['destination_airport_name'] as String?,
      departureDate: json['departure_date'] as String?,
      departureTime: json['departure_time'] as String?,
      arrivalDate: json['arrival_date'] as String?,
      arrivalTime: json['arrival_time'] as String?,
      durationHours: json['duration_hours'] as int?,
      stops: json['stops'] as int?,
      travelClass: json['travel_class'] as String?,
      priceTotal: json['price_total'] as int?,
      currency: json['currency'] as String?,
      travelerCount: json['traveler_count'] as int?,
      pricePerPassenger: json['price_per_passenger'] as int?,
      seatsRemaining: json['seats_remaining'] as int?,
      segments:
          (json['segments'] as List<dynamic>?)
              ?.map((e) => Segment.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'airline': airline,
      'origin_airport_code': originAirportCode,
      'origin_airport_name': originAirportName,
      'destination_airport_code': destinationAirportCode,
      'destination_airport_name': destinationAirportName,
      'departure_date': departureDate,
      'departure_time': departureTime,
      'arrival_date': arrivalDate,
      'arrival_time': arrivalTime,
      'duration_hours': durationHours,
      'stops': stops,
      'travel_class': travelClass,
      'price_total': priceTotal,
      'currency': currency,
      'traveler_count': travelerCount,
      'price_per_passenger': pricePerPassenger,
      'seats_remaining': seatsRemaining,
      'segments': segments?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props {
    return [
      airline,
      originAirportCode,
      originAirportName,
      destinationAirportCode,
      destinationAirportName,
      departureDate,
      departureTime,
      arrivalDate,
      arrivalTime,
      durationHours,
      stops,
      travelClass,
      priceTotal,
      currency,
      travelerCount,
      pricePerPassenger,
      seatsRemaining,
      segments,
    ];
  }
}
