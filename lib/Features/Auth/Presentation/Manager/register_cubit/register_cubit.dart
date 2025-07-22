import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Features/Auth/Data/Models/auth_request_model.dart';
import 'package:visit_syria/Features/Auth/Data/Repos/auth_repo.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit(this._authRepo) : super(RegisterInitial());

  final AuthRepo _authRepo;

  Future<void> register(AuthRequestModel authRequestModel) async {
    emit(RegisterLoading());
    var result = await _authRepo.register(authRequestModel);

    result.fold(
      (failure) {
        emit(RegisterFailure(errMessage: failure.errMessage));
      },
      (flag) {
        emit(RegisterSuccess(authRequestModel: authRequestModel));
      },
    );
  }
}
