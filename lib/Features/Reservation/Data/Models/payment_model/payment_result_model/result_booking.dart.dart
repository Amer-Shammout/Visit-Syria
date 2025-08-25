import 'package:equatable/equatable.dart';
import 'package:visit_syria/Features/Events/data/Models/event_model/event_model.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Data/Models/flight_model/flight_model.dart';
import 'package:visit_syria/Features/Trips/Data/Model/trip_model/trip_model.dart';

class ResultBooking extends Equatable {
  final int? id;
  final int? userId;
  final int? tripId;
  final dynamic eventId;
  final dynamic flightData;
  final dynamic flightOrderId;
  final int? numberOfTickets;
  final int? numberOfAdults;
  final int? numberOfChildren;
  final int? numberOfInfants;
  final String? price;
  final String? stripePaymentId;
  final String? paymentStatus;
  final dynamic qrCode;
  final bool? isPaid;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const ResultBooking({
    this.id,
    this.userId,
    this.tripId,
    this.eventId,
    this.flightData,
    this.flightOrderId,
    this.numberOfTickets,
    this.numberOfAdults,
    this.numberOfChildren,
    this.numberOfInfants,
    this.price,
    this.stripePaymentId,
    this.paymentStatus,
    this.qrCode,
    this.isPaid,
    this.createdAt,
    this.updatedAt,
  });

  factory ResultBooking.formJson(Map<String, dynamic> json) {
    return ResultBooking(
      id: json['id'] as int?,
      userId: json['user_id'] as int?,
      tripId: json['trip_id'] as int?,
      eventId: json['event_id'] as dynamic,
      flightData: json['flight_data'] as dynamic,
      flightOrderId: json['flightOrderId'] as dynamic,
      numberOfTickets: json['number_of_tickets'] as int?,
      numberOfAdults: json['number_of_adults'] as int?,
      numberOfChildren: json['number_of_children'] as int?,
      numberOfInfants: json['number_of_infants'] as int?,
      price: json['price'] as String?,
      stripePaymentId: json['stripe_payment_id'] as String?,
      paymentStatus: json['payment_status'] as String?,
      qrCode: json['qr_code'] as dynamic,
      isPaid: json['is_paid'] as bool?,
      createdAt:
          json['created_at'] == null
              ? null
              : DateTime.parse(json['created_at'] as String),
      updatedAt:
          json['updated_at'] == null
              ? null
              : DateTime.parse(json['updated_at'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'trip_id': tripId,
      'event_id': eventId,
      'flight_data': flightData,
      'flightOrderId': flightOrderId,
      'number_of_tickets': numberOfTickets,
      'number_of_adults': numberOfAdults,
      'number_of_children': numberOfChildren,
      'number_of_infants': numberOfInfants,
      'price': price,
      'stripe_payment_id': stripePaymentId,
      'payment_status': paymentStatus,
      'qr_code': qrCode,
      'is_paid': isPaid,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }

  @override
  List<Object?> get props {
    return [
      id,
      userId,
      tripId,
      eventId,
      flightData,
      flightOrderId,
      numberOfTickets,
      numberOfAdults,
      numberOfChildren,
      numberOfInfants,
      price,
      stripePaymentId,
      paymentStatus,
      qrCode,
      isPaid,
      createdAt,
      updatedAt,
    ];
  }
}
