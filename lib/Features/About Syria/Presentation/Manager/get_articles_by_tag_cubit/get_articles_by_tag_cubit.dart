import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Features/About%20Syria/Data/Repos/about_syria_repo.dart';
import 'package:visit_syria/Features/About%20Syria/Presentation/Manager/get_articles_by_tag_cubit/get_articles_by_tag_state.dart';

class GetArticlesByTagCubit extends Cubit<GetArticlesByTagState> {
  final AboutSyriaRepo _aboutSyriaRepo;
  GetArticlesByTagCubit(this._aboutSyriaRepo)
    : super(GetArticlesByTagInitial());

  Future<void> fetchArticles(String tag) async {
    emit(GetArticlesByTagLoading());
    final result = await _aboutSyriaRepo.getArticlesByTag(tag: tag);
    result.fold(
      (failure) => emit(GetArticlesByTagFailure(failure.errMessage)),
      (articles) => emit(GetArticlesByTagSuccess(articles)),
    );
  }
}
