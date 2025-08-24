import 'package:dartz/dartz.dart';
import 'package:visit_syria/Core/errors/failures.dart';

abstract class SearchRepo {
  Future<Either<Failure, List<dynamic>>> search({
    required String type,
    required String sub,
  });
}
