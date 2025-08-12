import 'package:dartz/dartz.dart';
import 'package:visit_syria/Core/constants/urls_constants.dart';
import 'package:visit_syria/Core/errors/failures.dart';
import 'package:visit_syria/Core/network/dio_client.dart';
import 'package:visit_syria/Core/services/service_locator.dart';
import 'package:visit_syria/Core/utils/functions/handle_request.dart';
import 'package:visit_syria/Features/Events/data/Models/event_model/event_model.dart';
import 'package:visit_syria/Features/Events/data/Repos/events_repo.dart';

class EventsRepoImpl extends EventsRepo {
  @override
  Future<Either<Failure, List<EventModel>>> getAllEvents() async {
    return await handleRequest<List<EventModel>>(
      requestFn: () => getIt.get<DioClient>().get(kGetTripsCompanyUrl),
      parse:
          (events) =>
              (events as List).map((e) => EventModel.fromJson(e)).toList(),
    );
  }
}
