import 'package:dartz/dartz.dart';
import 'package:visit_syria/Core/constants/flight_type.dart';
import 'package:visit_syria/Core/errors/failures.dart';

abstract class MySavesRepo {
  Future<Either<Failure, List<dynamic>>> getSaves({required SearchTypes type});
}
