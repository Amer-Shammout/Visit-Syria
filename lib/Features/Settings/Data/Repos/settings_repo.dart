import 'package:dartz/dartz.dart';
import 'package:visit_syria/Core/errors/failures.dart';
import 'package:visit_syria/Features/Settings/Data/Models/settings_model.dart';

abstract class SettingsRepo {
  Future<Either<Failure, List<SettingsModel>>> getSettingsByType({
    required String type,
    required String category,
  });
}
