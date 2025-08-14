import 'package:equatable/equatable.dart';

class Section extends Equatable {
  final String? time;
  final String? title;
  final List<dynamic>? description;

  const Section({this.time, this.title, this.description});

  factory Section.fromJson(Map<String, dynamic> json) {
    return Section(
      time: json['time'] as String?,
      title: json['title'] as String?,
      description: json['description'] as List<dynamic>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {'time': time, 'title': title, 'description': description};
  }

  @override
  List<Object?> get props => [time, title, description];
}
