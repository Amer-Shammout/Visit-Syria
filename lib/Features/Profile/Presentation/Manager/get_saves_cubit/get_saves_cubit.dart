import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/constants/flight_type.dart';
import 'package:visit_syria/Features/Profile/Data/Repos/saves_repo.dart';
import 'package:visit_syria/Features/Profile/Presentation/Manager/get_saves_cubit/get_saves_state.dart';


class GetSavesCubit extends Cubit<GetSavesState> {
  GetSavesCubit(this._mySavesRepo) : super(GetSavesInitial());

  final MySavesRepo _mySavesRepo;

  Future<void> getSaves({required SearchTypes type}) async {
    emit(GetSavesLoading());
    final result = await _mySavesRepo.getSaves(type: type);

    result.fold(
      (failure) => emit(GetSavesFailure(errMessage: failure.errMessage)),
      (items) {
        if (items.isEmpty) {
          emit(GetSavesEmpty());
        } else {
          emit(GetSavesSuccess(items));
        }
      },
    );
  }
}

