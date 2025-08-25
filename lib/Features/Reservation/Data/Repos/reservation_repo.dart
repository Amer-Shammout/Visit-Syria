import 'package:dartz/dartz.dart';
import 'package:visit_syria/Core/errors/failures.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/booking_model/booking_model.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/event_and_trips_booking_model/event_and_trips_booking_model.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/flight_booking_model/flight_booking_model.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/payment_model/payment_model.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/payment_model/payment_result_model/payment_result_model.dart';

abstract class ReservationRepo {
  Future<Either<Failure, BookingModel>> bookEventOrTrip(
    EventAndTripsBookingModel reserve,
  );
  Future<Either<Failure, BookingModel>> bookFlight(FlightBookingModel reserve);
  Future<Either<Failure, PaymentResultModel>> payment(
    PaymentModel paymentModel,
  );
}
