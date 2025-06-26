import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Features/Auth/Data/Models/auth_request_model.dart';
import 'package:visit_syria/Features/Auth/Data/Models/auth_response_model.dart';
import 'package:visit_syria/Features/Auth/Data/Repos/auth_repo.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepo _authRepo;
  LoginCubit(this._authRepo) : super(LoginInitial());

  Future<void> login(AuthRequestModel loginModel) async {
    emit(LoginLoading());
    final result = await _authRepo.login(loginModel);
    result.fold(
      (failure) => emit(LoginFailure(errMessage: failure.errMessage)),
      (data) => emit(LoginSuccess(authResponse: data)),
    );
  }
}
