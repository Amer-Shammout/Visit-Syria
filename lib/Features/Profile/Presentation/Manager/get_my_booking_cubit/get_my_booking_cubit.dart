import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:visit_syria/Features/Profile/Data/Models/my_booking_model/get_my_booking_model.dart';
import 'package:visit_syria/Features/Profile/Data/Repos/my_reservation_repo.dart';

part 'get_my_booking_state.dart';

class GetMyBookingCubit extends Cubit<GetMyBookingState> {
  GetMyBookingCubit(this._myReservationRepo) : super(GetMyBookingInitial());
  final MyReservationRepo _myReservationRepo;
  Future<void> getMyBooking(String type, String category) async {
    emit(GetMyBookingLoading());
    var result = await _myReservationRepo.getMyBooking(type, category);
    result.fold(
      (failure) => emit(GetMyBookingFailure(errMessage: failure.errMessage)),
      (getMyBookingModel) {
        getMyBookingModel.bookings == null
            ? emit(GetMyBookingEmpty())
            : emit(GetMyBookingSuccess(getMyBookingModel: getMyBookingModel));
      },
    );
  }
}
