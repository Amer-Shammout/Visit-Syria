import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/constants/common_constants.dart';
import 'package:visit_syria/Core/services/shared_preferences_singleton.dart';
import 'package:visit_syria/Features/Auth/Data/Models/auth_response_model.dart';
import 'package:visit_syria/Features/Auth/Data/Repos/auth_repo.dart';

part 'google_sign_in_state.dart';

class GoogleSignInCubit extends Cubit<GoogleSignInState> {
  final AuthRepo _authRepo;

  GoogleSignInCubit(this._authRepo) : super(GoogleSignInInitial());

  Future<void> signInWithGoogle() async {
    emit(GoogleSignInLoading());
    final result = await _authRepo.signInWithGoogle();
    result.fold(
      (failure) => emit(GoogleSignInFailure(errMessage: failure.errMessage)),
      (data) {
        log("Google Sign-In Success: ${data.message} \n ${data.token}");
        Prefs.setString(kToken, data.token!);
        Prefs.setString(kLoginMethod, kGoogleMethod);
        emit(GoogleSignInSuccess(authResponse: data));
      },
    );
  }
}
