import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Features/Auth/Data/Repos/auth_repo.dart';

part 'resend_code_state.dart';

class ResendCodeCubit extends Cubit<ResendCodeState> {
  final AuthRepo _authRepo;
  ResendCodeCubit(this._authRepo) : super(ResendCodeInitial());

  Future<void> resendCode(String email) async {
    emit(ResendCodeLoading());
    final result = await _authRepo.resendCode(email);
    result.fold(
      (failure) => emit(ResendCodeFailure(errMessage: failure.errMessage)),
      (_) => emit(ResendCodeSuccess()),
    );
  }
}
