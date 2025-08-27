import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/booking_model/booking_model.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/event_and_trips_booking_model/event_and_trips_booking_model.dart';
import 'package:visit_syria/Features/Reservation/Data/Repos/reservation_repo.dart';

part 'event_and_trips_booking_state.dart';

class EventAndTripsBookingCubit extends Cubit<EventAndTripsBookingState> {
  EventAndTripsBookingCubit(this._reservationRepo)
    : super(EventAndTripsBookingInitial());
  final ReservationRepo _reservationRepo;

  Future<void> bookEventOrTrip(EventAndTripsBookingModel reserve) async {
    emit(EventAndTripsBookingLoading());
    var result = await _reservationRepo.bookEventOrTrip(reserve);
    result.fold(
      (failure) {
        emit(EventAndTripsBookingFailure(errMessage: failure.errMessage));
      },
      (booking) {
        emit(EventAndTripsBookingSuccess(bookingModel: booking));
      },
    );
  }
}
