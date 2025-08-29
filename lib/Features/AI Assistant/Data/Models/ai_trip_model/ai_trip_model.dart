import 'package:equatable/equatable.dart';
import 'package:visit_syria/Features/Trips/Data/Model/trip_model/timeline.dart';

// ignore: must_be_immutable
class AiTripModel extends Equatable {
  final int? id;
  final String? title;
  final List<Timeline>? timelines;
  final String? createdAt;
  bool showButton = false;

  AiTripModel({this.id, this.title, this.timelines, this.createdAt});

  factory AiTripModel.fromJson(Map<String, dynamic> json) {
    return AiTripModel(
      id: json['id'] as int?,
      title: json['title'] as String?,
      timelines:
          (json['timelines'] as List<dynamic>?)
              ?.map((e) => Timeline.fromJson(e as Map<String, dynamic>))
              .toList(),
      createdAt: json['created_at'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'timelines': timelines?.map((e) => e.toJson()).toList(),
      'created_at': createdAt,
    };
  }

  @override
  List<Object?> get props => [id, title, timelines, createdAt];
}
