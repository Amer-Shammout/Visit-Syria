import 'package:visit_syria/Features/Events/data/Models/event_model/event_model.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Data/Models/flight_model/flight_model.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/reservation_info_model.dart';
import 'package:visit_syria/Features/Trips/Data/Model/trip_model/trip_model.dart';

class ReservationModel {
  final TripModel? tripModel;
  final EventModel? eventModel;
  final FlightModel? flightModel;
  final int? tickets;
  final List<ReservationInfoModel>? info;
  final int? numberOfAdults;
  final int? numberOfChildren;
  final int? numberOfInfants;
  ReservationModel({
     this.tripModel,
     this.eventModel,
     this.flightModel,
     this.tickets,
     this.info,
     this.numberOfAdults,
     this.numberOfChildren,
     this.numberOfInfants,
  });

  ReservationModel copyWith({
    TripModel? tripModel,
    EventModel? eventModel,
    FlightModel? flightModel,
    int? tickets,
    List<ReservationInfoModel>? info,
    int? numberOfAdults,
    int? numberOfChildren,
    int? numberOfInfants,
  }) {
    return ReservationModel(
      tripModel: tripModel ?? this.tripModel,
      eventModel: eventModel ?? this.eventModel,
      flightModel: flightModel ?? this.flightModel,
      tickets: tickets ?? this.tickets,
      info: info ?? this.info,
      numberOfAdults: numberOfAdults ?? this.numberOfAdults,
      numberOfChildren: numberOfChildren ?? this.numberOfChildren,
      numberOfInfants: numberOfInfants ?? numberOfInfants,
    );
  }
}
