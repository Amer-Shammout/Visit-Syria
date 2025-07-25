import 'package:equatable/equatable.dart';

import 'media.dart';

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
  final String? price;
  final String? eventType;
  final String? priceType;
  final int? preBooking;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<Media>? media;

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
    price: json['price'] as String?,
    eventType: json['event_type'] as String?,
    priceType: json['price_type'] as String?,
    preBooking: json['pre_booking'] as int?,
    createdAt:
        json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
    updatedAt:
        json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
    media:
        (json['media'] as List<dynamic>?)
            ?.map((e) => Media.fromJson(e as Map<String, dynamic>))
            .toList(),
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
