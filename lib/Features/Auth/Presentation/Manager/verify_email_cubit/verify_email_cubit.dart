import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/constants/common_constants.dart';
import 'package:visit_syria/Core/services/shared_preferences_singleton.dart';
import 'package:visit_syria/Features/Auth/Data/Models/auth_response_model.dart';
import 'package:visit_syria/Features/Auth/Data/Models/verification_model.dart';
import 'package:visit_syria/Features/Auth/Data/Repos/auth_repo.dart';

part 'verify_email_state.dart';

class VerifyEmailCubit extends Cubit<VerifyEmailState> {
  final AuthRepo _authRepo;
  VerifyEmailCubit(this._authRepo) : super(VerifyEmailInitial());

  Future<void> verifyEmail(VerificationModel model) async {
    emit(VerifyEmailLoading());
    final result = await _authRepo.verifyEmail(model);
    result.fold(
      (failure) => emit(VerifyEmailFailure(errMessage: failure.errMessage)),
      (data) {
        Prefs.setString(kToken, data.token!);
        Prefs.setString(kLoginMethod, kEmailMethod);
        emit(VerifyEmailSuccess(authResponse: data));
      },
    );
  }
}
