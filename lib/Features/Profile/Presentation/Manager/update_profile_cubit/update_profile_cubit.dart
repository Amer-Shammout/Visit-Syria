import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Features/Profile/Data/Models/update_profile_model.dart';
import 'package:visit_syria/Features/Profile/Data/Repos/profile_repo.dart';
import 'package:visit_syria/Features/Profile/Data/Repos/profile_repo_impl.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit(this._profileRepo) : super(UpdateProfileInitial());

  final ProfileRepo _profileRepo;

  Future<void> updateProfile(UpdateProfileModel newProfile) async {
    emit(UpdateProfileLoading());

    final result = await _profileRepo.updateProfile(newProfile);

    result.fold(
      (failure) => emit(UpdateProfileFailure(errMessage: failure.errMessage)),
      (_) {
        emit(UpdateProfileSuccess());
      },
    );
  }
}
