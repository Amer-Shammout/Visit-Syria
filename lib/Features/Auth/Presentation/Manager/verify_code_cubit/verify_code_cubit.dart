import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Features/Auth/Data/Models/auth_response_model.dart';
import 'package:visit_syria/Features/Auth/Data/Models/verification_model.dart';
import 'package:visit_syria/Features/Auth/Data/Repos/auth_repo.dart';

part 'verify_code_state.dart';

class VerifyCodeCubit extends Cubit<VerifyCodeState> {
  final AuthRepo _authRepo;
  VerifyCodeCubit(this._authRepo) : super(VerifyCodeInitial());

  Future<void> verifyCode(VerificationModel model) async {
    emit(VerifyCodeLoading());
    final result = await _authRepo.verifyCode(model);
    result.fold(
      (failure) => emit(VerifyCodeFailure(errMessage: failure.errMessage)),
      (data) => emit(VerifyCodeSuccess(authResponse: data)),
    );
  }
}