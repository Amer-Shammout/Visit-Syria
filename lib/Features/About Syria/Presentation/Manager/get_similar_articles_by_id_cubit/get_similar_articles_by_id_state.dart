import 'package:equatable/equatable.dart';
import 'package:visit_syria/Features/About%20Syria/Data/Models/article_model.dart';

abstract class GetSimilarArticlesByIdState extends Equatable {
  const GetSimilarArticlesByIdState();

  @override
  List<Object?> get props => [];
}

class GetSimilarArticlesByIdInitial extends GetSimilarArticlesByIdState {}

class GetSimilarArticlesByIdLoading extends GetSimilarArticlesByIdState {}

class GetSimilarArticlesByIdSuccess extends GetSimilarArticlesByIdState {
  final List<ArticleModel> articles;
  const GetSimilarArticlesByIdSuccess(this.articles);

  @override
  List<Object?> get props => [articles];
}

class GetSimilarArticlesByIdFailure extends GetSimilarArticlesByIdState {
  final String message;
  const GetSimilarArticlesByIdFailure(this.message);

  @override
  List<Object?> get props => [message];
}
