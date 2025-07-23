import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:visit_syria/Features/Home/Data/Models/weather_model.dart';
import 'package:visit_syria/Features/Home/Data/Repos/home_repo.dart';

part 'get_weather_today_state.dart';

class GetWeatherTodayCubit extends Cubit<GetWeatherTodayState> {
  GetWeatherTodayCubit(this._homeRepo) : super(GetWeatherTodayInitial());

  final HomeRepo _homeRepo;

  Future<void> getWeatherToday() async {
    emit(GetWeatherTodayLoading());
    var result = await _homeRepo.getWeatherToday();

    result.fold(
      (failure) {
        emit(GetWeatherTodayFailure(errMessage: failure.errMessage));
      },
      (weatherCities) {
        emit(GetWeatherTodaySuccess(weatherCities: weatherCities));
      },
    );
  }
}
