import 'package:equatable/equatable.dart';

class Company extends Equatable {
  final int? id;
  final String? name;
  final dynamic image;
  final String? rating;

  const Company({this.id, this.name, this.image, this.rating});

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'] as int?,
      name: json['name'] as String?,
      image: json['image'] as dynamic,
      rating: json['rating'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name, 'image': image, 'rating': rating};
  }

  @override
  List<Object?> get props => [id, name, image, rating];
}
