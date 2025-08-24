import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/event_and_trips_booking_model/event_and_trips_booking_model.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/event_and_trips_booking_model/passenger.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/reservation_model.dart';
import 'package:visit_syria/Features/Reservation/Presentation/Manager/event_and_trip_booking_cubit/event_and_trips_booking_cubit.dart';

Future<void> bookEventOrTrip(
  BuildContext context,
  ReservationModel reservationModel,
) async {
  String type = '';
  int id = 0;
  if (reservationModel.tripModel != null) {
    type = 'trip';
    id = reservationModel.tripModel!.id!;
  }
  if (reservationModel.eventModel != null) {
    type = 'event';
    id = reservationModel.eventModel!.id!;
  }
  int tickets = reservationModel.tickets!;
  List<Passenger> passengers = [];
  for (var i = 0; i < tickets; i++) {
    Passenger passenger = Passenger(
      firstName: reservationModel.info![i].firstName,
      lastName: reservationModel.info![i].lastName,
      birthDate: reservationModel.info![i].birthDate,
      email: reservationModel.info![i].email,
      gender: reservationModel.info![i].gender,
      nationality: reservationModel.info![i].nationality,
      phone: reservationModel.info![i].phone,
      countryCode: reservationModel.info![i].countryCode,
    );
    passengers.add(passenger);
  }
  EventAndTripsBookingModel reserve = EventAndTripsBookingModel(
    type: type,
    id: id,
    numberOfTickets: tickets,
    passengers: passengers,
  );
  await BlocProvider.of<EventAndTripsBookingCubit>(
    context,
  ).bookEventOrTrip(reserve);
  log(reserve.toString());
}
