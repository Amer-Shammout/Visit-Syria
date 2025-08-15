import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:visit_syria/Core/constants/common_constants.dart';
import 'package:visit_syria/Core/constants/urls_constants.dart';
import 'package:visit_syria/Core/errors/failures.dart';
import 'package:visit_syria/Core/network/dio_client.dart';
import 'package:visit_syria/Core/services/service_locator.dart';
import 'package:visit_syria/Core/services/shared_preferences_singleton.dart';
import 'package:visit_syria/Core/utils/functions/handle_request.dart';
import 'package:visit_syria/Features/Settings/Data/Models/settings_model.dart';
import 'package:visit_syria/Features/Settings/Data/Repos/settings_repo.dart';

class SettingsRepoImpl extends SettingsRepo {
  @override
  Future<Either<Failure, List<SettingsModel>>> getSettingsByType({
    required String type,
    required String category,
  }) async {
    final encodedType = Uri.encodeComponent(type);
    final encodedCategory = Uri.encodeComponent(category);
    final url = "$kGetSettingsByTypeUrl$encodedType?category=$encodedCategory";

    return await handleRequest<List<SettingsModel>>(
      requestFn:
          () => getIt.get<DioClient>().get(
            url,
            options: Options(
              headers: {"Authorization": "Bearer ${Prefs.getString(kToken)}"},
            ),
          ),
      parse: (data) {
        final List<SettingsModel> settings = [];
        for (var item in data['data']) {
          settings.add(SettingsModel.fromJson(item));
        }
        return settings;
      },
    );
  }
}
