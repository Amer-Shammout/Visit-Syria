import 'package:equatable/equatable.dart';

import 'booking.dart';

class BookingModel extends Equatable {
  final String? message;
  final Booking? booking;

  const BookingModel({this.message, this.booking});

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
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
