import 'package:equatable/equatable.dart';

class Booking extends Equatable {
  final int? id;
  final bool? isPaid;
  final double? price;

  const Booking({this.id, this.isPaid, this.price});

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(
      id: json['id'] as int?,
      isPaid: json['is_paid'] as bool?,
      price: (json['price'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'is_paid': isPaid, 'price': price};
  }

  @override
  List<Object?> get props => [id, isPaid, price];
}
