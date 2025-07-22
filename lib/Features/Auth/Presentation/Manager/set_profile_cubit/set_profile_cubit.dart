import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Features/Auth/Data/Models/profile_model.dart';
import 'package:visit_syria/Features/Auth/Data/Repos/auth_repo.dart';

part 'set_profile_state.dart';

class SetProfileCubit extends Cubit<SetProfileState> {
  SetProfileCubit(this._authRepo) : super(SetProfileInitial());

  final AuthRepo _authRepo;

  Future<void> setProfile(ProfileModel profileModel) async {
    emit(SetProfileLoading());
    final result = await _authRepo.setProfile(profileModel);
    result.fold(
      (failure) => emit(SetProfileFailure(errMessage: failure.errMessage)),
      (data) {
        log("$data ");
        emit(SetProfileSuccess(profileModel: data));
      },
    );
  }
}
