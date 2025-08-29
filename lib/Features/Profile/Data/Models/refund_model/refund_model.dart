import 'package:equatable/equatable.dart';

import 'booking.dart';

class RefundModel extends Equatable {
  final String? message;
  final Booking? booking;

  const RefundModel({this.message, this.booking});

  factory RefundModel.fromJson(Map<String, dynamic> json) {
    return RefundModel(
      message: json['message'] as String?,
      booking:
          json['booking'] == null
              ? null
              : Booking.fromJson(json['booking'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {'message': message, 'booking': booking?.toJson()};
  }

  @override
  List<Object?> get props => [message, booking];
}
