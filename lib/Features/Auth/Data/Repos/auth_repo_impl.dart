import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:visit_syria/Core/constants/common_constants.dart';
import 'package:visit_syria/Core/constants/urls_constants.dart';
import 'package:visit_syria/Core/errors/failures.dart';
import 'package:visit_syria/Core/network/dio_client.dart';
import 'package:visit_syria/Core/services/service_locator.dart';
import 'package:visit_syria/Core/services/shared_preferences_singleton.dart';
import 'package:visit_syria/Core/utils/functions/handle_request.dart';
import 'package:visit_syria/Features/Auth/Data/Models/auth_request_model.dart';
import 'package:visit_syria/Features/Auth/Data/Models/preferences_model.dart';
import 'package:visit_syria/Features/Auth/Data/Models/profile_model.dart';
import 'package:visit_syria/Features/Auth/Data/Models/reset_password_model.dart';
import 'package:visit_syria/Features/Auth/Data/Models/verification_model.dart';
import 'package:visit_syria/Features/Auth/Data/Models/auth_response_model.dart';
import 'package:visit_syria/Features/Auth/Data/Repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either<Failure, String>> register(
    AuthRequestModel authRequestModel,
  ) async {
    return await handleRequest<String>(
      requestFn:
          () => getIt.get<DioClient>().post(
            kRegisterUrl,
            data: authRequestModel.toJsonRegister(),
          ),
      parse: (data) => data['message'],
    );
  }

  @override
  Future<Either<Failure, AuthResponseModel>> login(
    AuthRequestModel authRequestModel,
  ) async {
    return await handleRequest<AuthResponseModel>(
      requestFn:
          () => getIt.get<DioClient>().post(
            kLoginUrl,
            data: authRequestModel.toJsonLogin(),
          ),
      parse: (data) {
        final model = AuthResponseModel.fromJson(data);
        return model;
      },
    );
  }

  @override
  Future<Either<Failure, bool>> resendCode(String email) async {
    return await handleRequest<bool>(
      requestFn:
          () => getIt.get<DioClient>().post(
            kResendCodeUrl,
            data: {'email': email},
          ),
      parse: (_) => true,
    );
  }

  @override
  Future<Either<Failure, AuthResponseModel>> verifyEmail(
    VerificationModel verificationModel,
  ) async {
    return await handleRequest<AuthResponseModel>(
      requestFn:
          () => getIt.get<DioClient>().post(
            kVerifyEmailUrl,
            data: verificationModel.toJson(),
          ),
      parse: (data) {
        final model = AuthResponseModel.fromJson(data);
        return model;
      },
    );
  }

  @override
  Future<Either<Failure, String>> forgetPassword(String email) async {
    return await handleRequest<String>(
      requestFn:
          () => getIt.get<DioClient>().post(
            kForgetPasswordUrl,
            data: {'email': email},
          ),
      parse: (data) => data['message'],
    );
  }

  @override
  Future<Either<Failure, AuthResponseModel>> resetPassword(
    ResetPasswordModel resetPasswordModel,
  ) async {
    return await handleRequest<AuthResponseModel>(
      requestFn:
          () => getIt.get<DioClient>().post(
            kResetPasswordUrl,
            data: resetPasswordModel.toJson(),
          ),
      parse: (data) => AuthResponseModel.fromJson(data),
    );
  }

  @override
  Future<Either<Failure, AuthResponseModel>> verifyCode(
    VerificationModel verificationModel,
  ) async {
    return await handleRequest<AuthResponseModel>(
      requestFn:
          () => getIt.get<DioClient>().post(
            kVerifyCodeUrl,
            data: verificationModel.toJson(),
          ),
      parse: (data) => AuthResponseModel.fromJson(data),
    );
  }

  @override
  Future<Either<Failure, ProfileModel>> setProfile(ProfileModel profile) async {
    return await handleRequest<ProfileModel>(
      requestFn: () {
        log("${Prefs.getString(kToken)}");
        return getIt.get<DioClient>().post(
          kSetProfile,
          data: FormData.fromMap({
            'first_name': profile.firstName,
            'last_name': profile.lastName,
            'country': profile.country,
            // 'country_code': profile.countryCode,
            'photo': profile.uploadPhoto,
          }),

          options: Options(
            headers: {
              "Authorization": "Bearer ${Prefs.getString(kToken)}",
              "Content-Type":
                  "multipart/form-data; boundary=<calculated when request is sent>",
            },
          ),
        );
      },
      parse: (data) => ProfileModel.fromJson(data),
    );
  }

  @override
  Future<Either<Failure, String>> setPreferences(
    PreferencesModel preferences,
  ) async {
    return await handleRequest<String>(
      requestFn: () {
        log("${Prefs.getString(kToken)}");
        return getIt.get<DioClient>().post(
          kSetPreference,
          data: preferences.toJson(),

          options: Options(
            headers: {"Authorization": "Bearer ${Prefs.getString(kToken)}"},
          ),
        );
      },
      parse: (data) => data['message'],
    );
  }
}
