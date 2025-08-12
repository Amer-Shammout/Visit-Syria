import 'package:dartz/dartz.dart';
import 'package:visit_syria/Core/errors/failures.dart';
import 'package:visit_syria/Features/Profile/Data/Models/update_profile_model.dart';
import 'package:visit_syria/Features/Profile/Data/Models/user_model/user_model.dart';

abstract class ProfileRepo {
  Future<Either<Failure, bool>> logout();
  Future<Either<Failure, UserModel>> getProfile();
  Future<Either<Failure, bool>> updateProfile(UpdateProfileModel updateModel);
}
