import 'package:dartz/dartz.dart';
import 'package:visit_syria/Core/errors/failures.dart';
import 'package:visit_syria/Features/Events/data/Models/event_model/event_model.dart';

abstract class EventsRepo {
  Future<Either<Failure, List<EventModel>>> getAllEvents();
}
