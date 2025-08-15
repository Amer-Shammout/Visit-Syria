import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Features/About%20Syria/Data/Models/article_model.dart';
import 'package:visit_syria/Features/About%20Syria/Data/Repos/about_syria_repo.dart';
import 'package:visit_syria/Features/About%20Syria/Presentation/Manager/get_similar_articles_by_id_cubit/get_similar_articles_by_id_state.dart';

class GetSimilarArticlesByIdCubit extends Cubit<GetSimilarArticlesByIdState> {
  final AboutSyriaRepo _aboutSyriaRepo;

  static List<ArticleModel> similarArticles = [];
  GetSimilarArticlesByIdCubit(this._aboutSyriaRepo)
    : super(GetSimilarArticlesByIdInitial());

  Future<void> fetchSimilarArticles(String id) async {
    emit(GetSimilarArticlesByIdLoading());
    final result = await _aboutSyriaRepo.getSimilarArticlesById(id: id);
    result.fold(
      (failure) => emit(GetSimilarArticlesByIdFailure(failure.errMessage)),
      (articles) {
        similarArticles = articles;
        emit(GetSimilarArticlesByIdSuccess(articles));
      },
    );
  }
}
