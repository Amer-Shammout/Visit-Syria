import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:visit_syria/Core/constants/common_constants.dart';
import 'package:visit_syria/Core/services/shared_preferences_singleton.dart';
import 'package:visit_syria/Features/Profile/Data/Repos/profile_repo_impl.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  final ProfileRepoImpl _profileRepo;

  LogoutCubit(this._profileRepo) : super(LogoutInitial());

  Future<void> logout() async {
    emit(LogoutLoading());

    final result = await _profileRepo.logout();

    result.fold(
      (failure) => emit(LogoutFailure(errMessage: failure.errMessage)),
      (_) async {
        await Prefs.removePref(kToken);

        final loginMethod = Prefs.getString(kLoginMethod);
        if (loginMethod == kGoogleMethod) {
          await GoogleSignIn().signOut();
        }
        await Prefs.removePref(kLoginMethod);

        emit(LogoutSuccess());
      },
    );
  }
}
