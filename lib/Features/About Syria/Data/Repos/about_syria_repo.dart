import 'package:dartz/dartz.dart';
import 'package:visit_syria/Core/errors/failures.dart';
import 'package:visit_syria/Features/About%20Syria/Data/Models/article_model.dart';

abstract class AboutSyriaRepo {
  Future<Either<Failure, List<ArticleModel>>> getArticlesByTag({
    required String tag,
  });
  Future<Either<Failure, List<ArticleModel>>> getSimilarArticlesById({
    required String id,
  });
}
