import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:visit_syria/Core/constants/common_constants.dart';
import 'package:visit_syria/Core/constants/urls_constants.dart';
import 'package:visit_syria/Core/errors/failures.dart';
import 'package:visit_syria/Core/network/dio_client.dart';
import 'package:visit_syria/Core/services/service_locator.dart';
import 'package:visit_syria/Core/services/shared_preferences_singleton.dart';
import 'package:visit_syria/Core/utils/functions/handle_request.dart';
import 'package:visit_syria/Features/Profile/Data/Models/my_booking_model/get_my_booking_model.dart';
import 'package:visit_syria/Features/Profile/Data/Models/refund_model/refund_model.dart';
import 'package:visit_syria/Features/Profile/Data/Repos/my_reservation_repo.dart';

class MyReservationRepoImpl extends MyReservationRepo {
  @override
  Future<Either<Failure, RefundModel>> cancelReservation(int id) async {
    String url = '$kCancelReservationURL$id';
    return await handleRequest(
      requestFn:
          () => getIt.get<DioClient>().post(
            url,
            options: Options(
              headers: {"Authorization": "Bearer ${Prefs.getString(kToken)}"},
            ),
          ),
      parse: (data) {
        return RefundModel.fromJson(data);
      },
    );
  }

  @override
  Future<Either<Failure, GetMyBookingModel>> getMyBooking(
    String type,
    String category,
  ) async {
    String url = '$kGetMyBookingURl?type=$type&category=$category';
    return await handleRequest(
      requestFn:
          () => getIt.get<DioClient>().get(
            url,
            options: Options(
              headers: {"Authorization": "Bearer ${Prefs.getString(kToken)}"},
            ),
          ),
      parse: (data) {
        return GetMyBookingModel.fromJson(data, type);
      },
    );
  }
}
