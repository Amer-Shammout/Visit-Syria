import 'package:flutter/material.dart';
import 'package:visit_syria/Core/data/Enums/enum.dart';
import 'package:visit_syria/Features/Events/data/Models/event_model/event_model.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Data/Models/flight_model/flight_model.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Data/Models/passenger_count_model.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/reservation_info_model.dart';
import 'package:visit_syria/Features/Trips/Data/Model/trip_model/trip_model.dart';

class ReservationModel {
  TripModel? tripModel;
  EventModel? eventModel;
  FlightModel? flightModel;
  int? tickets;
  List<ReservationInfoModel>? info;
  int? numberOfAdults;
  int? numberOfChildren;
  int? numberOfInfants;
  bool? deletePeople;
  int? difference;
  PassengerCountModel? passengers;
  List<AgeStateEnum>? ageState;
  List<bool>? hasError;
  List<GlobalKey<FormState>>? formKeys;
  List<AutovalidateMode>? isAutoValidate;
  List<bool>? strokeError;
  ReservationModel({
    this.tripModel,
    this.eventModel,
    this.flightModel,
    this.tickets,
    this.info,
    this.numberOfAdults,
    this.numberOfChildren,
    this.numberOfInfants,
    this.deletePeople,
    this.difference,
    this.passengers,
    this.ageState,
    this.hasError,
    this.formKeys,
    this.isAutoValidate,
    this.strokeError,
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
    bool? deletePeople,
    int? difference,
    PassengerCountModel? passengers,
    List<AgeStateEnum>? ageState,
    List<bool>? hasError,
    List<GlobalKey<FormState>>? formKeys,
    List<AutovalidateMode>? isAutoValidate,
    List<bool>? strokeError,
  }) {
    return ReservationModel(
      tripModel: tripModel ?? this.tripModel,
      eventModel: eventModel ?? this.eventModel,
      flightModel: flightModel ?? this.flightModel,
      tickets: tickets ?? this.tickets,
      info: info ?? this.info,
      numberOfAdults: numberOfAdults ?? this.numberOfAdults,
      numberOfChildren: numberOfChildren ?? this.numberOfChildren,
      numberOfInfants: numberOfInfants ?? this.numberOfInfants,
      deletePeople: deletePeople ?? this.deletePeople,
      difference: difference ?? this.difference,
      passengers: passengers ?? this.passengers,
      ageState: ageState ?? ageState,
      hasError: hasError ?? this.hasError,
      formKeys: formKeys ?? this.formKeys,
      isAutoValidate: isAutoValidate ?? this.isAutoValidate,
      strokeError: strokeError ?? this.strokeError,
    );
  }
}
