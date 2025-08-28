import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/data/repos/common_repo.dart';
import 'package:visit_syria/Features/About%20Syria/Data/Models/article_model.dart';
import 'package:visit_syria/Features/Community/Data/Models/post_model/post_model.dart';
import 'package:visit_syria/Features/Events/data/Models/event_model/event_model.dart';
import 'package:visit_syria/Features/Places/Data/Models/place_model/place_model.dart';
import 'package:visit_syria/Features/Tourism%20Companies/Data/Models/company_model.dart';
import 'package:visit_syria/Features/Trips/Data/Model/trip_model/trip_model.dart';

part 'set_save_state.dart';

class SetSaveCubit extends Cubit<SetSaveState> {
  final CommonRepo _commonRepo;
  SetSaveCubit(this._commonRepo) : super(SetSaveInitial());
  Future<void> setSave({
    required String id,
    required String type,
    required dynamic model,
  }) async {
    emit(SetSaveLoading());
    final result = await _commonRepo.setSave(id: id, type: type);
    result.fold((l) => emit(SetSaveFailure(errMessage: l.errMessage)), (_) {
      if (model is PlaceModel ||
          model is TripModel ||
          model is CompanyModel ||
          model is EventModel ||
          model is ArticleModel ||
          model is PostModel) {
        model.isSaved = true;
      }
      emit(SetSaveSuccess());
    });
  }
}
