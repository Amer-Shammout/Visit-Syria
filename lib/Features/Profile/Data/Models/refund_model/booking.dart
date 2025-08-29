import 'package:equatable/equatable.dart';

class Booking extends Equatable {
  final int? id;

  const Booking({this.id});

  factory Booking.fromJson(Map<String, dynamic> json) {
    return Booking(id: json['id'] as int?);
  }

  Map<String, dynamic> toJson() {
    return {'id': id};
  }

  @override
  List<Object?> get props {
    return [id];
  }
}
