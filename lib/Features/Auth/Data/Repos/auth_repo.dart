import 'package:dartz/dartz.dart';
import 'package:visit_syria/Core/errors/failures.dart';
import 'package:visit_syria/Features/Auth/Data/Models/auth_request_model.dart';
import 'package:visit_syria/Features/Auth/Data/Models/preferences_model.dart';
import 'package:visit_syria/Features/Auth/Data/Models/profile_model.dart';
import 'package:visit_syria/Features/Auth/Data/Models/reset_password_model.dart';
import 'package:visit_syria/Features/Auth/Data/Models/verification_model.dart';
import 'package:visit_syria/Features/Auth/Data/Models/auth_response_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, String>> register(AuthRequestModel authRequestModel);
  Future<Either<Failure, AuthResponseModel>> login(
    AuthRequestModel authRequestModel,
  );
  Future<Either<Failure, String>> forgetPassword(String email);
  Future<Either<Failure, AuthResponseModel>> verifyEmail(
    VerificationModel verificationModel,
  );
  Future<Either<Failure, AuthResponseModel>> verifyCode(
    VerificationModel verificationModel,
  );
  Future<Either<Failure, AuthResponseModel>> resetPassword(
    ResetPasswordModel resetPasswordModel,
  );
  Future<Either<Failure, bool>> resendCode(String email);
  Future<Either<Failure, ProfileModel>> setProfile(ProfileModel profile);
  Future<Either<Failure, String>> setPreferences(PreferencesModel profile);
}
