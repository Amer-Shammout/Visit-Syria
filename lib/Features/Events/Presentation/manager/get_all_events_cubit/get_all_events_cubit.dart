import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Features/Events/data/Models/event_model/event_model.dart';
import 'package:visit_syria/Features/Events/data/Repos/events_repo.dart';

part 'get_all_events_state.dart';

class GetAllEventsCubit extends Cubit<GetAllEventsState> {
  GetAllEventsCubit(this._eventsRepo) : super(GetAllEventsInitial());

  final EventsRepo _eventsRepo;

  Future<void> getAllEvents() async {
    emit(GetAllEventsLoading());
    var result = await _eventsRepo.getAllEvents();

    result.fold(
      (failure) {
        emit(GetAllEventsFailure(errMessage: failure.errMessage));
      },
      (events) {
        emit(GetAllEventsSuccess(events: events));
      },
    );
  }
}
