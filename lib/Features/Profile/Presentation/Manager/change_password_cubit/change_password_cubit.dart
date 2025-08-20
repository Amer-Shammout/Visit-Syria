import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/constants/common_constants.dart';
import 'package:visit_syria/Core/services/shared_preferences_singleton.dart';
import 'package:visit_syria/Features/Profile/Data/Models/change_password_model.dart';
import 'package:visit_syria/Features/Profile/Data/Repos/profile_repo.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit(this._profileRepo) : super(ChangePasswordInitial());
  final ProfileRepo _profileRepo;

  Future<void> changePassword(ChangePasswordModel changePasswordModel) async {
    emit(ChangePasswordLoading());
    final result = await _profileRepo.changePassword(changePasswordModel);
    result.fold(
      (failure) => emit(ChangePasswordFailure(errMessage: failure.errMessage)),
      (data) {
        Prefs.setString(kToken, data['token']);
        emit(ChangePasswordSuccess());
      },
    );
  }
}
