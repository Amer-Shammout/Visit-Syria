import 'package:equatable/equatable.dart';
import 'package:visit_syria/Features/Events/data/Models/event_model/event_model.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Data/Models/flight_model/flight_model.dart';
import 'package:visit_syria/Features/Trips/Data/Model/trip_model/trip_model.dart';

import 'booking_info.dart';

class MyBookingModel extends Equatable {
  final dynamic info;
  final BookingInfo? bookingInfo;
  String? category;
  MyBookingModel({this.info, this.bookingInfo});

  factory MyBookingModel.fromJson(Map<String, dynamic> json, String type) {
    return MyBookingModel(
      info:
          json['info'] == null
              ? null
              : type == 'event'
              ? EventModel.fromJson(json['info'] as Map<String, dynamic>)
              : type == 'trip'
              ? TripModel.fromJson(json['info'] as Map<String, dynamic>)
              : FlightModel.fromJson(json['info'] as Map<String, dynamic>),
      bookingInfo:
          json['booking_info'] == null
              ? null
              : BookingInfo.fromJson(
                json['booking_info'] as Map<String, dynamic>,
              ),
    );
  }

  @override
  List<Object?> get props => [info, bookingInfo];
}
