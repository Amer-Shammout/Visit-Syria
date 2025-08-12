import 'package:equatable/equatable.dart';

class Timeline extends Equatable {
  final int? dayNumber;
  final List<dynamic>? sections;

  const Timeline({this.dayNumber, this.sections});

  factory Timeline.fromJson(Map<String, dynamic> json) {
    return Timeline(
      dayNumber: json['day_number'] as int?,
      sections: json['sections'] as List<dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'day_number': dayNumber, 'sections': sections};
  }

  @override
  List<Object?> get props => [dayNumber, sections];
}
