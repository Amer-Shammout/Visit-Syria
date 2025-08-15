import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/errors/failures.dart';
import 'package:visit_syria/Features/Events/data/Models/event_model/event_model.dart';
// ignore: unused_import
import 'package:visit_syria/Features/Home/Data/Models/weather_model.dart';
import 'package:visit_syria/Features/Home/Data/Repos/home_repo.dart';
import 'package:visit_syria/Features/Home/Presentation/Manager/home_cubit/home_state.dart';
import 'package:visit_syria/Features/Places/Data/Models/place_model/place_model.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo homeRepo;

  HomeCubit(this.homeRepo) : super(const HomeState());

  Future<void> fetchHomeData() async {
    emit(state.copyWith(isLoading: true, errorMessage: null));

    // try {
    final results = await Future.wait([
      homeRepo.getTopRatedPlaces(),
      // homeRepo.getWeatherToday(),
      homeRepo.getAllEvents(),
    ]);

    // كاست للأنواع الصحيحة
    final topRatedResult = results[0] as Either<Failure, List<PlaceModel>>;
    // final weatherResult  = results[1] as Either<Failure, List<WeatherModel>>;
    final eventsResult = results[1] as Either<Failure, List<EventModel>>;

    // جمع كل النتائج في لائحة
    final allResults = [
      topRatedResult,
      // weatherResult,
      eventsResult,
    ];

    // التحقق من وجود أي فشل
    for (final result in allResults) {
      if (result.isLeft()) {
        final failure = result.swap().getOrElse(
          () => ServerFailure(errMessage: 'حدث خطأ غير متوقع'),
        );
        emit(
          state.copyWith(isLoading: false, errorMessage: failure.errMessage),
        );
        return; // إيقاف التنفيذ عند أول خطأ
      }
    }

    // إذا نجحوا الكل
    emit(
      state.copyWith(
        isLoading: false,
        errorMessage: null,
        topRatedPlaces: topRatedResult.getOrElse(() => <PlaceModel>[]),
        // weathers: weatherResult.getOrElse(() => <WeatherModel>[]),
        events: eventsResult.getOrElse(() => <EventModel>[]),
      ),
    );
    // } catch (e) {
    //   emit(state.copyWith(isLoading: false, errorMessage: e.toString()));
    // }
  }
}
