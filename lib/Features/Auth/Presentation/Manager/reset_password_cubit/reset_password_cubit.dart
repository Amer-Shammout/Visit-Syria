import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Features/Auth/Data/Models/auth_response_model.dart';
import 'package:visit_syria/Features/Auth/Data/Models/reset_password_model.dart';
import 'package:visit_syria/Features/Auth/Data/Repos/auth_repo.dart';

part 'reset_password_state.dart';

class ResetPasswordCubit extends Cubit<ResetPasswordState> {
  final AuthRepo _authRepo;
  ResetPasswordCubit(this._authRepo) : super(ResetPasswordInitial());

  Future<void> resetPassword(ResetPasswordModel model) async {
    emit(ResetPasswordLoading());
    final result = await _authRepo.resetPassword(model);
    result.fold(
      (failure) => emit(ResetPasswordFailure(errMessage: failure.errMessage)),
      (data) => emit(ResetPasswordSuccess(authResponse: data)),
    );
  }
}