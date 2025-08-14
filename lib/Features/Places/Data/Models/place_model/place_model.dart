import 'package:equatable/equatable.dart';

import 'recent_comment.dart';

class PlaceModel extends Equatable {
  final String? id;
  final int? cityId;
  final String? type;
  final String? name;
  final String? description;
  final int? numberOfBranches;
  final dynamic phone;
  final dynamic countryCode;
  final String? place;
  final String? longitude;
  final String? latitude;
  final double? rating;
  final String? classification;
  final List<dynamic>? images;
  final int? rank;
  final dynamic userRating;
  final dynamic userComment;
  final List<RecentComment>? recentComments;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final bool? isSaved;

  const PlaceModel({
    this.id,
    this.cityId,
    this.type,
    this.name,
    this.description,
    this.numberOfBranches,
    this.phone,
    this.countryCode,
    this.place,
    this.longitude,
    this.latitude,
    this.rating,
    this.classification,
    this.images,
    this.rank,
    this.userRating,
    this.userComment,
    this.recentComments,
    this.createdAt,
    this.updatedAt,
    this.isSaved,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) => PlaceModel(
    id: json['id'] as String?,
    cityId: json['city_id'] as int?,
    type: json['type'] as String?,
    name: json['name'] as String?,
    description: json['description'] as String?,
    numberOfBranches: json['number_of_branches'] as int?,
    phone: json['phone'] as dynamic,
    countryCode: json['country_code'] as dynamic,
    place: json['place'] as String?,
    longitude: json['longitude'] as String?,
    latitude: json['latitude'] as String?,
    rating: (json['rating'] as num?)?.toDouble(),
    classification: json['classification'] as String?,
    images: json['images'] as List<dynamic>?,
    rank: json['rank'] as int?,
    userRating: json['user_rating'] as dynamic,
    userComment: json['user_comment'] as dynamic,
    isSaved: json['is_saved'] as bool,
    recentComments:
        (json['recent_comments'] as List<dynamic>?)
            ?.map((e) => RecentComment.fromJson(e as Map<String, dynamic>))
            .toList(),
    createdAt:
        json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
    updatedAt:
        json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'city_id': cityId,
    'type': type,
    'name': name,
    'description': description,
    'number_of_branches': numberOfBranches,
    'phone': phone,
    'country_code': countryCode,
    'place': place,
    'longitude': longitude,
    'latitude': latitude,
    'rating': rating,
    'classification': classification,
    'images': images,
    'rank': rank,
    'user_rating': userRating,
    'user_comment': userComment,
    'recent_comments': recentComments?.map((e) => e.toJson()).toList(),
    'created_at': createdAt?.toIso8601String(),
    'updated_at': updatedAt?.toIso8601String(),
  };

  @override
  List<Object?> get props {
    return [
      id,
      cityId,
      type,
      name,
      description,
      numberOfBranches,
      phone,
      countryCode,
      place,
      longitude,
      latitude,
      rating,
      classification,
      images,
      rank,
      userRating,
      userComment,
      recentComments,
      createdAt,
      updatedAt,
    ];
  }
}
