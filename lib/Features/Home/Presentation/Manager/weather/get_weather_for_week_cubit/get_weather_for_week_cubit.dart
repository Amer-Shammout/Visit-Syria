import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:visit_syria/Features/Home/Data/Models/weather_model.dart';
import 'package:visit_syria/Features/Home/Data/Repos/home_repo.dart';

part 'get_weather_for_week_state.dart';

class GetWeatherForWeekCubit extends Cubit<GetWeatherForWeekState> {
  GetWeatherForWeekCubit(this._homeRepo) : super(GetWeatherForWeekInitial());

  final HomeRepo _homeRepo;
  Future<void> getWeatherForWeek(String cityName) async {
    emit(GetWeatherForWeekLoading());
    var result = await _homeRepo.getWeatherForWeek(cityName);

    result.fold(
      (failure) {
        emit(GetWeatherForWeekFailure(errMessage: failure.errMessage));
      },
      (weatherForWeek) {
        emit(GetWeatherForWeekSuccess(weatherForWeek: weatherForWeek));
      },
    );
  }
}
