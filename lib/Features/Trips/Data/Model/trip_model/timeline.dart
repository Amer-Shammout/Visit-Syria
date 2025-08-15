import 'package:equatable/equatable.dart';

import 'section.dart';

class Timeline extends Equatable {
  final int? dayNumber;
  final List<Section>? sections;

  const Timeline({this.dayNumber, this.sections});

  factory Timeline.fromJson(Map<String, dynamic> json) {
    return Timeline(
      dayNumber: json['day_number'] as int?,
      sections:
          (json['sections'] as List<dynamic>?)
              ?.map((e) => Section.fromJson(e as Map<String, dynamic>))
              .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'day_number': dayNumber,
      'sections': sections?.map((e) => e.toJson()).toList(),
    };
  }

  @override
  List<Object?> get props => [dayNumber, sections];
}
