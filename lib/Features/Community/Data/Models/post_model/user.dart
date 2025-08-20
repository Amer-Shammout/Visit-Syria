import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int? id;
  final String? name;
  final String? profilePhoto;

  const User({this.id, this.name, this.profilePhoto});

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'] as int?,
    name: json['name'] as String?,
    profilePhoto: json['profile_photo'] as String?,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'profile_photo': profilePhoto,
  };

  @override
  List<Object?> get props => [id, name, profilePhoto];
}
