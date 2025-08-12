import 'package:equatable/equatable.dart';
import 'package:visit_syria/Features/Events/data/Models/event_model/event_model.dart';
import 'package:visit_syria/Features/Home/Data/Models/weather_model.dart';
import 'package:visit_syria/Features/Places/Data/Models/place_model/place_model.dart';

class HomeState extends Equatable {
  final bool isLoading;
  final String? errorMessage;
  final List<PlaceModel> topRatedPlaces;
  final List<WeatherModel> weathers;
  final List<EventModel> events;

  const HomeState({
    this.isLoading = false,
    this.errorMessage,
    this.topRatedPlaces = const [],
    this.weathers = const [],
    this.events = const [],
  });

  HomeState copyWith({
    bool? isLoading,
    String? errorMessage,
    List<PlaceModel>? topRatedPlaces,
    List<WeatherModel>? weathers,
    List<EventModel>? events,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      topRatedPlaces: topRatedPlaces ?? this.topRatedPlaces,
      events: events ?? this.events,
      weathers: weathers ?? this.weathers,
    );
  }

  @override
  List<Object?> get props => [
    isLoading,
    errorMessage,
    topRatedPlaces,
    events,
    weathers,
  ];
}
