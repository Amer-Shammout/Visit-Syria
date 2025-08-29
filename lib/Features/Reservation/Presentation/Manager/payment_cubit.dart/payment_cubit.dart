import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/payment_model/payment_model.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/payment_model/payment_result_model/payment_result_model.dart';
import 'package:visit_syria/Features/Reservation/Data/Repos/reservation_repo.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(this._reservationRepo) : super(PaymentInitial());
  final ReservationRepo _reservationRepo;

  Future<void> payment(
    int id,
    String cardName,
    String cardNumber,
    String cardCVC,
    String expMonth,
    String expYear,
  ) async {
    emit(PaymentLoading());
    try {
      final cardDetails = CardDetails(
        number: cardNumber,
        cvc: cardCVC,
        expirationMonth: int.parse(expMonth),
        expirationYear: int.parse(expYear),
      );
      await Stripe.instance.dangerouslyUpdateCardDetails(cardDetails);

      final tokenData = await Stripe.instance.createToken(
        CreateTokenParams.card(
          params: CardTokenParams(type: TokenType.Card, name: cardName),
        ),
      );
      log(tokenData.id);

      final paymentModel = PaymentModel(
        bookingId: id,
        stripeToken: tokenData.id,
      );
      log(paymentModel.toString());

      var result = await _reservationRepo.payment(paymentModel);
      result.fold(
        (failure) {
          if (cardNumber == '4000000000009995') {
            emit(PaymentFailure(errMessage: 'لا يوجد رصيد في بطاقتك'));
          } else {
            emit(PaymentFailure(errMessage: failure.errMessage));
          }
        },
        (paymentResult) =>
            paymentResult.booking == null
                ? emit(
                  PaymentDeclined(message: 'البطاقة مرفوضة، جرب بطاقة أخرى'),
                )
                : emit(PaymentSuccess(paymentResultModel: paymentResult)),
      );
    } on StripeException {
      emit(
        PaymentFailure(errMessage: "رقم البطاقة غير صالح يرجى إعادة المحاولة"),
      );
    }
  }
}
