import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:visit_syria/Core/constants/common_constants.dart';
import 'package:visit_syria/Core/constants/flight_type.dart';
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
import 'package:visit_syria/Features/Profile/Data/Repos/saves_repo.dart';
import 'package:visit_syria/Features/Trips/Data/Model/trip_model/trip_model.dart';

class MySavesRepoImpl extends MySavesRepo {
  @override
  Future<Either<Failure, List<dynamic>>> getSaves({
    required SearchTypes type,
  }) {
    final url = "$kGetSaveUrl?type=${type.asQueryParam}";
    return handleRequest(
      requestFn: () => getIt.get<DioClient>().get(
            url,
            options: Options(
              headers: {"Authorization": "Bearer ${Prefs.getString(kToken)}"},
            ),
          ),
      parse: (data) {
        final List<dynamic> items = [];

        switch (type) {
          case SearchTypes.tourist:
          case SearchTypes.restaurant:
          case SearchTypes.hotel:
            for (var item in data['saves']) {
              items.add(PlaceModel.fromJson(item));
            }
            break;

          case SearchTypes.post:
            for (var item in data['saves']) {
              items.add(PostModel.fromJson(item));
            }
            break;

          case SearchTypes.event:
            for (var item in data['saves']) {
              items.add(EventModel.fromJson(item));
            }
            break;

          case SearchTypes.trip:
            for (var item in data['saves']) {
              items.add(TripModel.fromJson(item));
            }
            break;

          case SearchTypes.article:
            for (var item in data['saves']) {
              items.add(ArticleModel.fromJson(item));
            }
            break;

          default:
            break;
        }

        return items;
      },
    );
  }
}
