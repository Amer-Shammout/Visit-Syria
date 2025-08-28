import 'package:equatable/equatable.dart';
import 'package:visit_syria/Features/Trips/Data/Model/trip_model/timeline.dart';
import 'package:visit_syria/Features/Trips/Data/Model/trip_model/trip_path.dart';

import 'company.dart';

// ignore: must_be_immutable
class TripModel extends Equatable {
  final int? id;
  final String? name;
  final String? description;
  final String? season;
  final String? startDate;
  final String? days;
  final int? tickets;
  final int? remainingTickets;
  final String? price;
  final String? discount;
  final String? newPrice;
  final List<dynamic>? improvements;
  final String? status;
  final List<dynamic>? tags;
  final List<dynamic>? images;
  final TripPath? tripPath;
  final List<Timeline>? timelines;
  final Company? company;
   bool? isSaved;

   TripModel({
    this.id,
    this.name,
    this.description,
    this.season,
    this.startDate,
    this.days,
    this.tickets,
    this.remainingTickets,
    this.price,
    this.discount,
    this.newPrice,
    this.improvements,
    this.status,
    this.tags,
    this.images,
    this.tripPath,
    this.timelines,
    this.company,
    this.isSaved,
  });

  factory TripModel.fromJson(Map<String, dynamic> json) {
    return TripModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      season: json['season'] as String?,
      startDate: json['start_date'] as String?,
      days: json['days'] as String?,
      tickets: json['tickets'] as int?,
      remainingTickets: json['remaining_tickets'] as int?,
      price: json['price'] as String?,
      discount: json['discount'] as String?,
      newPrice: json['new_price'] as String?,
      improvements: json['improvements'] as List<dynamic>?,
      status: json['status'] as String?,
      tags: json['tags'] as List<dynamic>?,
      images: json['images'] as List<dynamic>?,
      tripPath:
          json['trip_path'] == null
              ? null
              : TripPath.fromJson(json['trip_path'] as Map<String, dynamic>),
      timelines:
          (json['timelines'] as List<dynamic>)
              .map((e) => Timeline.fromJson(e as Map<String, dynamic>))
              .toList(),
      company:
          json['company'] == null
              ? null
              : Company.fromJson(json['company'] as Map<String, dynamic>),
      isSaved: json['is_saved'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'season': season,
      'start_date': startDate,
      'days': days,
      'tickets': tickets,
      'remaining_tickets': remainingTickets,
      'price': price,
      'discount': discount,
      'new_price': newPrice,
      'improvements': improvements,
      'status': status,
      'tags': tags,
      'images': images,
      'trip_path': tripPath,
      'timelines': timelines?.map((e) => e.toJson()).toList(),
      'company': company?.toJson(),
      'is_saved': isSaved,
    };
  }

  @override
  List<Object?> get props {
    return [
      id,
      name,
      description,
      season,
      startDate,
      days,
      tickets,
      remainingTickets,
      price,
      discount,
      newPrice,
      improvements,
      status,
      tags,
      images,
      tripPath,
      timelines,
      company,
      isSaved,
    ];
  }
}
