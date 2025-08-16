import 'package:dartz/dartz.dart';
import 'package:visit_syria/Core/data/models/comment_model/comment_model.dart';
import 'package:visit_syria/Core/errors/failures.dart';

abstract class CommonRepo {
  Future<Either<Failure,List<CommentModel>>> getFeedback({required String id,required String type});
}