import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/booking_model/booking_model.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/flight_booking_model/flight_booking_model.dart';
import 'package:visit_syria/Features/Reservation/Data/Repos/reservation_repo.dart';

part 'flight_booking_state.dart';

class FlightBookingCubit extends Cubit<FlightBookingState> {
  FlightBookingCubit(this._reservationRepo) : super(FlightBookingInitial());
  final ReservationRepo _reservationRepo;
  Future<void> bookFlight(FlightBookingModel reserve) async {
    emit(FlightBookingLoading());
    var result = await _reservationRepo.bookFlight(reserve);
    result.fold(
      (failure) {
        emit(FlightBookingFailure(errMessage: failure.errMessage));
      },
      (booking) {
        emit(FlightBookingSuccess(bookingModel: booking));
      },
    );
  }
}
