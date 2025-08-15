import 'package:equatable/equatable.dart';

class Segment extends Equatable {
  final int? segmentNumber;
  final String? originAirportCode;
  final String? originAirportName;
  final String? destinationAirportCode;
  final String? destinationAirportName;
  final String? departureTime;
  final String? arrivalTime;
  final int? durationHours;
  final String? airline;
  final int? layoverHours;

  const Segment({
    this.segmentNumber,
    this.originAirportCode,
    this.originAirportName,
    this.destinationAirportCode,
    this.destinationAirportName,
    this.departureTime,
    this.arrivalTime,
    this.durationHours,
    this.airline,
    this.layoverHours,
  });

  factory Segment.fromJson(Map<String, dynamic> json) => Segment(
    segmentNumber: json['segment_number'] as int?,
    originAirportCode: json['origin_airport_code'] as String?,
    originAirportName: json['origin_airport_name'] as String?,
    destinationAirportCode: json['destination_airport_code'] as String?,
    destinationAirportName: json['destination_airport_name'] as String?,
    departureTime: json['departure_time'] as String?,
    arrivalTime: json['arrival_time'] as String?,
    durationHours: json['duration_hours'] as int?,
    airline: json['airline'] as String?,
    layoverHours: json['layover_hours'] as int?,
  );

  Map<String, dynamic> toJson() => {
    'segment_number': segmentNumber,
    'origin_airport_code': originAirportCode,
    'origin_airport_name': originAirportName,
    'destination_airport_code': destinationAirportCode,
    'destination_airport_name': destinationAirportName,
    'departure_time': departureTime,
    'arrival_time': arrivalTime,
    'duration_hours': durationHours,
    'airline': airline,
    'layover_hours': layoverHours,
  };

  @override
  List<Object?> get props {
    return [
      segmentNumber,
      originAirportCode,
      originAirportName,
      destinationAirportCode,
      destinationAirportName,
      departureTime,
      arrivalTime,
      durationHours,
      airline,
      layoverHours,
    ];
  }
}
