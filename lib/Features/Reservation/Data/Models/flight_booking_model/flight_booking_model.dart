import 'package:equatable/equatable.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/event_and_trips_booking_model/passenger.dart';

import 'flight_data.dart';

class FlightBookingModel extends Equatable {
  final FlightData? flightData;
  final int? numberOfAdults;
  final int? numberOfChildren;
  final int? numberOfInfants;
  final List<Passenger>? passengers;

  const FlightBookingModel({
    this.flightData,
    this.numberOfAdults,
    this.numberOfChildren,
    this.numberOfInfants,
    this.passengers,
  });

  factory FlightBookingModel.fromJson(Map<String, dynamic> json) {
    return FlightBookingModel(
      flightData:
          json['flight_data'] == null
              ? null
              : FlightData.fromJson(
                json['flight_data'] as Map<String, dynamic>,
              ),
      numberOfAdults: json['number_of_adults'] as int?,
      numberOfChildren: json['number_of_children'] as int?,
      numberOfInfants: json['number_of_infants'] as int?,
      passengers:
          (json['passengers'] as List<dynamic>?)
              ?.map((e) => Passenger.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'flight_data': flightData?.toJson(),
      'number_of_adults': numberOfAdults,
      'number_of_children': numberOfChildren,
      'number_of_infants': numberOfInfants,
      'passengers': passengers?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props {
    return [
      flightData,
      numberOfAdults,
      numberOfChildren,
      numberOfInfants,
      passengers,
    ];
  }
}
