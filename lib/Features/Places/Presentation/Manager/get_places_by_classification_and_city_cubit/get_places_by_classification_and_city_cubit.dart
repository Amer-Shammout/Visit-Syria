import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Features/Places/Data/Repos/places_repo.dart';
import 'get_places_by_classification_and_city_state.dart';

class GetPlacesByClassificationAndCityCubit
    extends Cubit<GetPlacesByClassificationAndCityState> {
  final PlacesRepo placesRepo;
  GetPlacesByClassificationAndCityCubit(this.placesRepo)
    : super(GetPlacesByClassificationAndCityInitial());

  Future<void> fetchPlaces(String classification, String city) async {
    emit(GetPlacesByClassificationAndCityLoading());
    final result = await placesRepo.getPlacesByClassificationAndCity(
      classification: classification,
      city: city,
    );
    result.fold(
      (failure) =>
          emit(GetPlacesByClassificationAndCityFailure(failure.errMessage)),
      (places) {
        if (places.isEmpty) {
          emit(GetPlacesByClassificationAndCityEmpty());
        } else {
          emit(GetPlacesByClassificationAndCitySuccess(places));
        }
      },
    );
  }
}
