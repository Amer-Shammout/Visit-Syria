import 'package:equatable/equatable.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/passenger.dart';

class BookingInfo extends Equatable {
  final int? id;
  final int? numberOfTickets;
  final bool? isPaid;
  final String? price;
  final String? paymentStatus;
  final List<Passenger>? passengers;

  const BookingInfo({
    this.id,
    this.numberOfTickets,
    this.isPaid,
    this.price,
    this.paymentStatus,
    this.passengers,
  });

  factory BookingInfo.fromJson(Map<String, dynamic> json) {
    return BookingInfo(
      id: json['id'] as int?,
      numberOfTickets: json['number_of_tickets'] as int?,
      isPaid: json['is_paid'] as bool?,
      price: json['price'] as String?,
      paymentStatus: json['payment_status'] as String?,
      passengers:
          (json['passengers'] as List<dynamic>?)
              ?.map((e) => Passenger.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'number_of_tickets': numberOfTickets,
      'is_paid': isPaid,
      'price': price,
      'payment_status': paymentStatus,
      'passengers': passengers?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props {
    return [id, numberOfTickets, isPaid, price, paymentStatus, passengers];
  }
}
