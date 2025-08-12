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
import 'package:visit_syria/Features/Profile/Data/Models/update_profile_model.dart';
import 'package:visit_syria/Features/Profile/Data/Models/user_model/user_model.dart';
import 'package:visit_syria/Features/Profile/Data/Repos/profile_repo.dart';

class ProfileRepoImpl extends ProfileRepo {
  @override
  Future<Either<Failure, bool>> logout() async {
    return await handleRequest<bool>(
      requestFn:
          () => getIt.get<DioClient>().post(
            kLogoutUrl,
            options: Options(
              headers: {"Authorization": "Bearer ${Prefs.getString(kToken)}"},
            ),
          ),
      parse: (_) => true,
    );
  }

  @override
  Future<Either<Failure, UserModel>> getProfile() async {
    return await handleRequest<UserModel>(
      requestFn:
          () => getIt.get<DioClient>().get(
            kGetProfileURL,
            options: Options(
              headers: {"Authorization": "Bearer ${Prefs.getString(kToken)}"},
            ),
          ),
      parse: (user) => UserModel.fromJson(user),
    );
  }

  @override
  Future<Either<Failure, bool>> updateProfile(
    UpdateProfileModel updateModel,
  ) async {
    final formData = FormData();

    // --- الحقول النصية العادية ---
    void addField(String key, dynamic value) {
      if (value != null) {
        formData.fields.add(MapEntry(key, value.toString()));
      }
    }

    addField('first_name', updateModel.firstName);
    addField('last_name', updateModel.lastName);
    addField('country', updateModel.country);
    addField('gender', updateModel.gender);
    addField('date_of_birth', updateModel.dateOfBirth);
    addField('phone', updateModel.phone);
    addField('country_code', updateModel.countryCode);

    // --- الحقول اللي عبارة عن Lists (مكررة) ---
    void addList(String key, List<dynamic>? list) {
      if (list != null && list.isNotEmpty) {
        for (var i = 0; i < list.length; i++) {
          formData.fields.add(MapEntry('$key[$i]', list[i].toString()));
        }
      }
    }

    addList('preferred_season', updateModel.preferredSeason);
    addList('duration', updateModel.duration);
    addList('cities', updateModel.cities);
    addList('preferred_activities', updateModel.preferredActivities);

    if (updateModel.uploadPhoto != null) {
      formData.files.add(MapEntry('photo', updateModel.uploadPhoto!));
    }

    return await handleRequest<bool>(
      requestFn: () {
        return getIt.get<DioClient>().post(
          kUpdateProfileURL,
          data: formData,
          options: Options(
            headers: {
              "Authorization": "Bearer ${Prefs.getString(kToken)}",
              "Content-Type": "multipart/form-data",
              "Accept": "*/*",
            },
            // followRedirects: false,
            // validateStatus: (status) => status != null && status < 500,
          ),
        );
      },
      parse: (_) => true,
    );
  }
}
