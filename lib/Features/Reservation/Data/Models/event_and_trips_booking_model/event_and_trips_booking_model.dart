import 'package:equatable/equatable.dart';
import 'package:visit_syria/Features/Reservation/Data/Models/passenger.dart';

class EventAndTripsBookingModel extends Equatable {
  final String? type;
  final int? id;
  final int? numberOfTickets;
  final List<Passenger>? passengers;

  const EventAndTripsBookingModel({
    this.type,
    this.id,
    this.numberOfTickets,
    this.passengers,
  });

  factory EventAndTripsBookingModel.fromJson(Map<String, dynamic> json) {
    return EventAndTripsBookingModel(
      type: json['type'] as String?,
      id: json['id'] as int?,
      numberOfTickets: json['number_of_tickets'] as int?,
      passengers:
          (json['passengers'] as List<dynamic>?)
              ?.map((e) => Passenger.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'id': id,
      'number_of_tickets': numberOfTickets,
      'passengers': passengers?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [type, id, numberOfTickets, passengers];
}
