import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/payment_model/payment_model.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/payment_model/payment_result_model/payment_result_model.dart';
import 'package:visit_syria/Features/Reservation/Data/Repos/reservation_repo.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this._reservationRepo) : super(PaymentInitial());
  final ReservationRepo _reservationRepo;

  Future<void> payment(PaymentModel paymentModel) async {
    emit(PaymentLoading());
    var result = await _reservationRepo.payment(paymentModel);
    result.fold(
      (failure) => emit(PaymentFailure(errMessage: failure.errMessage)),
      (paymentResult) =>
          paymentResult.booking == null
              ? emit(PaymentDeclined(message: paymentResult.message!))
              : emit(PaymentSuccess(paymentResultModel: paymentResult)),
    );
  }
}
