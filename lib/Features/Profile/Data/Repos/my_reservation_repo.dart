import 'package:dartz/dartz.dart';
import 'package:visit_syria/Core/errors/failures.dart';
import 'package:visit_syria/Features/Profile/Data/Models/my_booking_model/get_my_booking_model.dart';
import 'package:visit_syria/Features/Profile/Data/Models/refund_model/refund_model.dart';

abstract class MyReservationRepo {
  Future<Either<Failure, GetMyBookingModel>> getMyBooking(
    String type,
    String category,
  );
  Future<Either<Failure, RefundModel>> cancelReservation(int id);
}
