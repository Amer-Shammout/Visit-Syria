import 'package:equatable/equatable.dart';
import 'package:visit_syria/Features/Profile/Data/Models/my_booking_model/my_booking_model.dart';

class GetMyBookingModel extends Equatable {
  final String? message;
  final List<MyBookingModel>? bookings;

  const GetMyBookingModel({this.message, this.bookings});

  factory GetMyBookingModel.fromJson(Map<String, dynamic> json, String type) {
    return GetMyBookingModel(
      message: json['message'] as String?,
      bookings:
          (json['bookings'] as List<dynamic>?)
              ?.map(
                (e) => MyBookingModel.fromJson(e as Map<String, dynamic>, type),
              )
              .toList(),
    );
  }

  @override
  List<Object?> get props => [message, bookings];
}
