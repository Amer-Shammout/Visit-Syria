import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:visit_syria/Features/Profile/Data/Models/refund_model/refund_model.dart';
import 'package:visit_syria/Features/Profile/Data/Repos/my_reservation_repo.dart';

part 'cancel_reservation_state.dart';

class CancelReservationCubit extends Cubit<CancelReservationState> {
  CancelReservationCubit(this._myReservationRepo)
    : super(CancelReservationInitial());
  final MyReservationRepo _myReservationRepo;
  Future<void> cancelReservation(int id) async {
    emit(CancelReservationLoading());
    var result = await _myReservationRepo.cancelReservation(id);
    result.fold(
      (failure) =>
          emit(CancelReservationFailure(errMessage: failure.errMessage)),
      (refund) {
        refund.booking == null
            ? emit(CancelReservationNotPermission(message: refund.message!))
            : emit(CancelReservationSuccess(refundModel: refund));
      },
    );
  }
}
