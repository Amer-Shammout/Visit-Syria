import 'package:dartz/dartz.dart';
import 'package:visit_syria/Core/errors/failures.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/booking_model/booking_model.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/event_and_trips_booking_model/event_and_trips_booking_model.dart';

abstract class ReservationRepo {
  Future<Either<Failure, BookingModel>> bookEventOrTrip(
    EventAndTripsBookingModel reserve,
  );
}
