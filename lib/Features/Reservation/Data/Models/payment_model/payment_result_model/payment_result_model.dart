import 'package:equatable/equatable.dart';

import 'result_booking.dart.dart';

class PaymentResultModel extends Equatable {
  final String? message;
  final ResultBooking? booking;

  const PaymentResultModel({this.message, this.booking});

  factory PaymentResultModel.fromJson(Map<String, dynamic> json) {
    return PaymentResultModel(
      message: json['message'] as String?,
      booking:
          json['booking'] == null
              ? null
              : ResultBooking.formJson(json['booking'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {'message': message, 'booking': booking?.toJson()};
  }

  @override
  List<Object?> get props => [message, booking];
}
