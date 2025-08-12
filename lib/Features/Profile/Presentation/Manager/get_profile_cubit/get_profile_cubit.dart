import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Features/Profile/Data/Models/user_model/user_model.dart';
import 'package:visit_syria/Features/Profile/Data/Repos/profile_repo_impl.dart';

part 'get_profile_state.dart';

class GetProfileCubit extends Cubit<GetProfileState> {
  final ProfileRepoImpl _profileRepo;
  static UserModel? userModel;

  GetProfileCubit(this._profileRepo) : super(GetProfileInitial());

  Future<void> getProfile() async {
    emit(GetProfileLoading());

    final result = await _profileRepo.getProfile();

    result.fold(
      (failure) => emit(GetProfileFailure(errMessage: failure.errMessage)),
      (user) async {
        userModel = user;
        emit(GetProfileSuccess());
      },
    );
  }
}
