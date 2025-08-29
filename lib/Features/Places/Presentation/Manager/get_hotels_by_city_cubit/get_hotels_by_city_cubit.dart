import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Features/Places/Data/Repos/places_repo.dart';
import 'get_hotels_by_city_state.dart';

class GetHotelsByCityCubit extends Cubit<GetHotelsByCityState> {
  final PlacesRepo placesRepo;
  GetHotelsByCityCubit(this.placesRepo) : super(GetHotelsByCityInitial());

  Future<void> fetchHotels(String city) async {
    emit(GetHotelsByCityLoading());
    final result = await placesRepo.getHotelsByCity(city: city);
    result.fold(
      (failure) => emit(GetHotelsByCityFailure(failure.errMessage)),
      (places) => emit(GetHotelsByCitySuccess(places)),
    );
  }
}
