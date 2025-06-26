import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Features/Auth/Data/Repos/auth_repo.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final AuthRepo _authRepo;
  ForgetPasswordCubit(this._authRepo) : super(ForgetPasswordInitial());

  Future<void> forgetPassword(String email) async {
    emit(ForgetPasswordLoading());
    final result = await _authRepo.forgetPassword(email);
    result.fold(
      (failure) => emit(ForgetPasswordFailure(errMessage: failure.errMessage)),
      (msg) => emit(ForgetPasswordSuccess(email: email)),
    );
  }
}