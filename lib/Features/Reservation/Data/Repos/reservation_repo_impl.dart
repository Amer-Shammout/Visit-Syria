import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:visit_syria/Core/constants/common_constants.dart';
import 'package:visit_syria/Core/constants/urls_constants.dart';
import 'package:visit_syria/Core/errors/failures.dart';
import 'package:visit_syria/Core/network/dio_client.dart';
import 'package:visit_syria/Core/services/service_locator.dart';
import 'package:visit_syria/Core/services/shared_preferences_singleton.dart';
import 'package:visit_syria/Core/utils/functions/handle_request.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/booking_model/booking_model.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/event_and_trips_booking_model/event_and_trips_booking_model.dart';
import 'package:visit_syria/Features/Reservation/Data/Repos/reservation_repo.dart';

class ReservationRepoImpl extends ReservationRepo {
  @override
  Future<Either<Failure, BookingModel>> bookEventOrTrip(
    EventAndTripsBookingModel reserve,
  ) async {
    return await handleRequest<BookingModel>(
      requestFn:
          () => getIt.get<DioClient>().post(
            kBookEventOrTripURL,
            options: Options(
              headers: {"Authorization": "Bearer ${Prefs.getString(kToken)}"},
            ),
            data: reserve.toJson(),
          ),
      parse: (data) => BookingModel.fromJson(data),
    );
  }
}
