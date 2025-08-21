import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Features/Settings/Data/Repos/settings_repo.dart';

part 'create_support_note_state.dart';

class CreateSupportNoteCubit extends Cubit<CreateSupportNoteState> {
  final SettingsRepo _settingsRepo;

  CreateSupportNoteCubit(this._settingsRepo)
    : super(CreateSupportNoteInitial());

  Future<void> createSupportNote({
    required String rating,
    required String note,
  }) async {
    emit(CreateSupportNoteLoading());
    final result = await _settingsRepo.createSupportNote(
      note: note,
      rating: rating,
    );
    result.fold(
      (l) => emit(CreateSupportNoteFailure(errMessage: l.errMessage)),
      (r) => emit(CreateSupportNoteSuccess()),
    );
  }
}
