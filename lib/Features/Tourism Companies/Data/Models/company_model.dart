import 'package:equatable/equatable.dart';

class CompanyModel extends Equatable {
  final int? id;
  final String? nameOfCompany;
  final int? yearsOfExperience;
  final dynamic image;
  final String? description;
  final int? numberOfTrips;
  final String? rating;

  const CompanyModel({
    this.id,
    this.nameOfCompany,
    this.yearsOfExperience,
    this.image,
    this.description,
    this.numberOfTrips,
    this.rating,
  });

  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
    id: json['id'] as int?,
    nameOfCompany: json['name_of_company'] as String?,
    yearsOfExperience: json['years_of_experience'] as int?,
    image: json['image'] as dynamic,
    description: json['description'] as String?,
    numberOfTrips: json['number_of_trips'] as int?,
    rating: json['rating'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name_of_company': nameOfCompany,
    'years_of_experience': yearsOfExperience,
    'image': image,
    'description': description,
    'number_of_trips': numberOfTrips,
    'rating': rating,
  };

  @override
  List<Object?> get props {
    return [
      id,
      nameOfCompany,
      yearsOfExperience,
      image,
      description,
      numberOfTrips,
      rating,
    ];
  }
}
