import 'package:equatable/equatable.dart';

class PaymentModel extends Equatable {
  final int? bookingId;
  final String? stripeToken;

  const PaymentModel({this.bookingId, this.stripeToken});

  factory PaymentModel.fromJson(Map<String, dynamic> json) {
    return PaymentModel(
      bookingId: json['booking_id'] as int?,
      stripeToken: json['stripeToken'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
    'booking_id': bookingId,
    'stripeToken': stripeToken,
  };

  @override
  List<Object?> get props => [bookingId, stripeToken];
}
