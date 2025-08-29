class AiPrefferencesModel {
  List<String>? cities;
  List<String>? duration;
  List<String>? typeOfTrips;
  List<String>? typeOfPlaces;
  List<String>? travelWith;
  List<String>? averageActivity;
  List<String>? sleepingInHotel;

  AiPrefferencesModel({
    this.cities,
    this.duration,
    this.typeOfTrips,
    this.typeOfPlaces,
    this.travelWith,
    this.averageActivity,
    this.sleepingInHotel,
  });

  factory AiPrefferencesModel.fromJson(Map<String, dynamic> json) {
    return AiPrefferencesModel(
      cities: json['cities'] as List<String>?,
      duration: json['duration'] as List<String>?,
      typeOfTrips: json['type_of_trips'] as List<String>?,
      typeOfPlaces: json['type_of_places'] as List<String>?,
      travelWith: json['travel_with'] as List<String>?,
      averageActivity: json['average_activity'] as List<String>?,
      sleepingInHotel: json['sleeping_in_hotel'] as List<String>?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cities': cities,
      'duration': duration,
      'type_of_trips': typeOfTrips,
      'type_of_places': typeOfPlaces,
      'travel_with': travelWith,
      'average_activity': averageActivity,
      'sleeping_in_hotel': sleepingInHotel,
    };
  }
}
