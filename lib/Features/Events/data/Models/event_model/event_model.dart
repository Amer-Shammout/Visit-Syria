import 'package:equatable/equatable.dart';

class EventModel extends Equatable {
  final int? id;
  final String? name;
  final String? description;
  final String? longitude;
  final String? latitude;
  final String? place;
  final String? date;
  final int? durationDays;
  final int? durationHours;
  final int? tickets;
  final int? reservedTickets;
  final int? remainingTickets;
  final String? price;
  final String? eventType;
  final String? priceType;
  final bool? preBooking;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<dynamic>? media;
  final dynamic isSaved;
  final String? status;

  const EventModel({
    this.id,
    this.name,
    this.description,
    this.longitude,
    this.latitude,
    this.place,
    this.date,
    this.durationDays,
    this.durationHours,
    this.tickets,
    this.price,
    this.eventType,
    this.priceType,
    this.preBooking,
    this.createdAt,
    this.updatedAt,
    this.media,
    this.isSaved,
    this.status,
    this.reservedTickets,
    this.remainingTickets,
  });

  factory EventModel.fromJson(Map<String, dynamic> json) => EventModel(
    id: json['id'] as int?,
    name: json['name'] as String?,
    description: json['description'] as String?,
    longitude: json['longitude'] as String?,
    latitude: json['latitude'] as String?,
    place: json['place'] as String?,
    date: json['date'] as String?,
    durationDays: json['duration_days'] as int?,
    durationHours: json['duration_hours'] as int?,
    tickets: json['tickets'] as int?,
    reservedTickets: json['reserved_tickets'] as int?,
    remainingTickets: json['tickets_remaining'] as int?,
    price: json['price'] as String?,
    eventType: json['event_type'] as String?,
    priceType: json['price_type'] as String?,
    status: json['status'] as String?,
    isSaved: json['is_saved'] as dynamic,
    preBooking: json['pre_booking'] as bool?,
    createdAt:
        json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
    updatedAt:
        json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
    media: (json['media'] as List<dynamic>?),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'description': description,
    'longitude': longitude,
    'latitude': latitude,
    'place': place,
    'date': date,
    'duration_days': durationDays,
    'duration_hours': durationHours,
    'tickets': tickets,
    'price': price,
    'event_type': eventType,
    'price_type': priceType,
    'pre_booking': preBooking,
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
    'media': media?.map((e) => e.toJson()).toList(),
    'tickets_remaining': remainingTickets,
    'reserved_tickets': reservedTickets,
  };

  @override
  List<Object?> get props {
    return [
      id,
      name,
      description,
      longitude,
      latitude,
      place,
      date,
      durationDays,
      durationHours,
      tickets,
      reservedTickets,
      remainingTickets,
      price,
      eventType,
      priceType,
      preBooking,
      createdAt,
      updatedAt,
      media,
    ];
  }
}
