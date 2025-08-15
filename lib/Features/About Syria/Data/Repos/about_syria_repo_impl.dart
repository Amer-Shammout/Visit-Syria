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
import 'package:visit_syria/Features/About%20Syria/Data/Repos/about_syria_repo.dart';

class AboutSyriaRepoImpl extends AboutSyriaRepo {
  @override
  Future<Either<Failure, List<ArticleModel>>> getArticlesByTag({
    required String tag,
  }) async {
    final encodedTag = Uri.encodeComponent(tag);
    final url = "$kGetArticlesByTagUrl$encodedTag";

    return await handleRequest<List<ArticleModel>>(
      requestFn:
          () => getIt.get<DioClient>().get(
            url,
            options: Options(
              headers: {"Authorization": "Bearer ${Prefs.getString(kToken)}"},
            ),
          ),
      parse: (data) {
        final List<ArticleModel> articles = [];
        for (var item in data['data']) {
          articles.add(ArticleModel.fromJson(item));
        }
        return articles;
      },
    );
  }

  @override
  Future<Either<Failure, List<ArticleModel>>> getSimilarArticlesById({
    required String id,
  }) async {
    final url = "$kGetSimialarArticlesByIDUrl$id/$kGetSimialarArticlesByIDUrl2";

    return await handleRequest<List<ArticleModel>>(
      requestFn:
          () => getIt.get<DioClient>().get(
            url,
            options: Options(
              headers: {"Authorization": "Bearer ${Prefs.getString(kToken)}"},
            ),
          ),
      parse: (data) {
        final List<ArticleModel> articles = [];
        for (var item in data['data']) {
          articles.add(ArticleModel.fromJson(item));
        }
        return articles;
      },
    );
  }
}
