import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Features/Places/Data/Repos/places_repo.dart';
import 'package:visit_syria/Features/Places/Presentation/Manager/get_resturants_by_city_cubit/get_restruants_by_city_state.dart';

class GetRestaurantsByCityCubit extends Cubit<GetRestaurantsByCityState> {
  final PlacesRepo placesRepo;
  GetRestaurantsByCityCubit(this.placesRepo) : super(GetRestaurantsByCityInitial());

  Future<void> fetchRestaurants(String city) async {
    emit(GetRestaurantsByCityLoading());
    final result = await placesRepo.getRestaurantsByCity(city: city);
    result.fold(
      (failure) => emit(GetRestaurantsByCityFailure(failure.errMessage)),
      (places) => emit(GetRestaurantsByCitySuccess(places)),
    );
  }
}
