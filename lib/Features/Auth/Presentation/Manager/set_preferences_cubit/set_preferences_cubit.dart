import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Features/Auth/Data/Models/preferences_model.dart';
import 'package:visit_syria/Features/Auth/Data/Repos/auth_repo.dart';

part 'set_preferences_state.dart';

class SetPreferencesCubit extends Cubit<SetPreferencesState> {
  SetPreferencesCubit(this._authRepo) : super(SetPreferencesInitial());
  final AuthRepo _authRepo;

  Future<void> setPreferences(PreferencesModel preferences) async {
    emit(SetPreferencesLoading());
    final result = await _authRepo.setPreferences(preferences);
    result.fold(
      (failure) => emit(SetPreferencesFailure(errMessage: failure.errMessage)),
      (data) {
        log("$data ");
        emit(SetPreferencesSuccess());
      },
    );
  }
}
