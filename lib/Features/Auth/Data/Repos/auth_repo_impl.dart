import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:visit_syria/Core/constants/common_constants.dart';
import 'package:visit_syria/Core/constants/urls_constants.dart';
import 'package:visit_syria/Core/errors/failures.dart';
import 'package:visit_syria/Core/network/dio_client.dart';
import 'package:visit_syria/Core/services/service_locator.dart';
import 'package:visit_syria/Core/services/shared_preferences_singleton.dart';
import 'package:visit_syria/Core/utils/app_strings.dart';
import 'package:visit_syria/Features/Auth/Data/Models/auth_request_model.dart';
import 'package:visit_syria/Features/Auth/Data/Models/verification_model.dart';
import 'package:visit_syria/Features/Auth/Data/Models/auth_response_model.dart';
import 'package:visit_syria/Features/Auth/Data/Repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  Future<Either<Failure, String>> register(
    AuthRequestModel authRequestModel,
  ) async {
    try {
      Response response = await getIt.get<DioClient>().post(
        kRegisterUrl,
        data: FormData.fromMap(authRequestModel.toJson()),
      );
      return right(response.data['message']);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      log(e.toString());
      return left(ServerFailure(errMessage: AppStrings.strInternalServerError));
    }
  }

  @override
  Future<Either<Failure, AuthResponseModel>> login(
    AuthRequestModel authRequestModel,
  ) async {
    try {
      Response response = await getIt.get<DioClient>().post(
        kLoginUrl,
        data: FormData.fromMap(authRequestModel.toJson()),
      );

      dynamic jsonData = response.data;
      AuthResponseModel data = AuthResponseModel.fromJson(jsonData);
      Prefs.setString(kToken, data.token!);
      log("$data");
      return right(data);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      log(e.toString());
      return left(ServerFailure(errMessage: AppStrings.strInternalServerError));
    }
  }

  @override
  Future<Either<Failure, bool>> resendCode(
    AuthRequestModel resendOtpModel,
  ) async {
    try {
      await getIt.get<DioClient>().post(
        kResendCodeUrl,
        data: FormData.fromMap(resendOtpModel.toJson()),
      );
      return right(true);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      log(e.toString());
      return left(ServerFailure(errMessage: AppStrings.strInternalServerError));
    }
  }

  @override
  Future<Either<Failure, AuthResponseModel>> verify(
    VerificationModel verificationModel,
  ) async {
    try {
      Response response = await getIt.get<DioClient>().post(
        kVerifyEmailUrl,
        data: FormData.fromMap(verificationModel.toJson()),
      );
      dynamic jsonData = response.data;
      AuthResponseModel data = AuthResponseModel.fromJson(jsonData);
      Prefs.setString(kToken, data.token!);
      log("$data");

      return right(data);
    } on DioException catch (e) {
      return left(ServerFailure.fromDioError(e));
    } on Exception catch (e) {
      log(e.toString());
      return left(ServerFailure(errMessage: AppStrings.strInternalServerError));
    }
  }
}
