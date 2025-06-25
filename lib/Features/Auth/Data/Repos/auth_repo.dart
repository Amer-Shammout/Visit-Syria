import 'package:dartz/dartz.dart';
import 'package:visit_syria/Core/errors/failures.dart';
import 'package:visit_syria/Features/Auth/Data/Models/auth_request_model.dart';
import 'package:visit_syria/Features/Auth/Data/Models/verification_model.dart';
import 'package:visit_syria/Features/Auth/Data/Models/auth_response_model.dart';

abstract class AuthRepo {
  Future<Either<Failure, String>> register(AuthRequestModel authRequestModel);
  Future<Either<Failure, AuthResponseModel>> login(AuthRequestModel authRequestModel);
  Future<Either<Failure, AuthResponseModel>> verify(
    VerificationModel verificationModel,
  );
  Future<Either<Failure, bool>> resendCode(AuthRequestModel resendOtpModel);
}
