import 'package:equatable/equatable.dart';
import 'package:visit_syria/Features/Auth/Data/Models/profile_model.dart';

import 'preference.dart';
import 'user.dart';

class Me extends Equatable {
  final User? user;
  final ProfileModel? profile;
  final Preference? preference;

  const Me({this.user, this.profile, this.preference});

  factory Me.fromJson(Map<String, dynamic> json) => Me(
    user:
        json['user'] == null
            ? null
            : User.fromJson(json['user'] as Map<String, dynamic>),
    profile:
        json['profile'] == null
            ? null
            : ProfileModel.fromJson(json['profile'] as Map<String, dynamic>),
    preference:
        json['preference'] == null
            ? null
            : Preference.fromJson(json['preference'] as Map<String, dynamic>),
  );

  Map<String, dynamic> toJson() => {
    'user': user?.toJson(),
    'profile': profile?.toJson(),
    'preference': preference?.toJson(),
  };

  @override
  List<Object?> get props => [user, profile, preference];
}
