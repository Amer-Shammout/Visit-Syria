import 'package:equatable/equatable.dart';

class WeatherModel extends Equatable {
  final String? location;
  final String? date;
  final String? dayName;
  final double? tempC;
  final String? conditionType;

  const WeatherModel({
    this.location,
    this.date,
    this.dayName,
    this.tempC,
    this.conditionType,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
      location: json['location'] as String?,
      date: json['date'] as String?,
      dayName: json['day_name'] as String?,
      tempC: (json['temp_c'] as num?)?.toDouble(),
      conditionType: json['condition_type'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'location': location,
      'date': date,
      'day_name': dayName,
      'temp_c': tempC,
      'condition_type': conditionType,
    };
  }

  @override
  List<Object?> get props {
    return [location, date, dayName, tempC, conditionType];
  }
}
