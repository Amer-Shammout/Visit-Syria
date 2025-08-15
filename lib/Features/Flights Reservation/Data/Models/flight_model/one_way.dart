import 'package:equatable/equatable.dart';

import 'segment.dart';

class OneWay extends Equatable {
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
  final List<Segment>? segments;
  final String? airline;

  const OneWay({
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
    this.segments,
    this.airline,
  });

  factory OneWay.fromJson(Map<String, dynamic> json) => OneWay(
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
    segments:
        (json['segments'] as List<dynamic>?)
            ?.map((e) => Segment.fromJson(e as Map<String, dynamic>))
            .toList(),
    airline: json['airline'] as String?,
  );

  Map<String, dynamic> toJson() => {
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
    'segments': segments?.map((e) => e.toJson()).toList(),
    'airline': airline,
  };

  @override
  List<Object?> get props {
    return [
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
      segments,
      airline,
    ];
  }
}
