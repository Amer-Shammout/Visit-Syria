import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:visit_syria/Core/constants/common_constants.dart';
import 'package:visit_syria/Core/constants/urls_constants.dart';
import 'package:visit_syria/Core/errors/failures.dart';
import 'package:visit_syria/Core/network/dio_client.dart';
import 'package:visit_syria/Core/services/service_locator.dart';
import 'package:visit_syria/Core/services/shared_preferences_singleton.dart';
import 'package:visit_syria/Core/utils/functions/handle_request.dart';
import 'package:visit_syria/Features/About%20Syria/Data/Models/article_model.dart';
import 'package:visit_syria/Features/Community/Data/Models/post_model/post_model.dart';
import 'package:visit_syria/Features/Events/data/Models/event_model/event_model.dart';
import 'package:visit_syria/Features/Places/Data/Models/place_model/place_model.dart';
import 'package:visit_syria/Features/Search/Data/Repos/search_repo.dart';
import 'package:visit_syria/Features/Tourism%20Companies/Data/Models/company_model.dart';
import 'package:visit_syria/Features/Trips/Data/Model/trip_model/trip_model.dart';

class SearchRepoImpl extends SearchRepo {
  @override
  Future<Either<Failure, List<dynamic>>> search({
    required String type,
    required String sub,
  }) {
    return handleRequest(
      requestFn:
          () => getIt.get<DioClient>().get(
            kSearchURL,
            queryParameters: {"type": type, "sub": sub},
            options: Options(
              headers: {"Authorization": "Bearer ${Prefs.getString(kToken)}"},
            ),
          ),
      parse: (data) {
        final List<dynamic> results = [];

        for (var item in data['results']) {
          switch (type) {
            case "company":
              results.add(CompanyModel.fromJson(item));
              break;
            case "event":
              results.add(EventModel.fromJson(item));
              break;
            case "trip":
              results.add(TripModel.fromJson(item));
              break;
            case "tourist" || "hotel" || "restaurant":
              results.add(PlaceModel.fromJson(item));
              break;
            case "post":
              results.add(PostModel.fromJson(item));
              break;
            case "article":
              results.add(ArticleModel.fromJson(item));
              break;
            default:
              break;
          }
        }

        return results;
      },
    );
  }
}
