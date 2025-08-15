import 'package:equatable/equatable.dart';
import 'package:visit_syria/Features/About%20Syria/Data/Models/article_model.dart';

abstract class GetArticlesByTagState extends Equatable {
  const GetArticlesByTagState();

  @override
  List<Object?> get props => [];
}

class GetArticlesByTagInitial extends GetArticlesByTagState {}

class GetArticlesByTagLoading extends GetArticlesByTagState {}

class GetArticlesByTagSuccess extends GetArticlesByTagState {
  final List<ArticleModel> articles;
  const GetArticlesByTagSuccess(this.articles);

  @override
  List<Object?> get props => [articles];
}

class GetArticlesByTagFailure extends GetArticlesByTagState {
  final String message;
  const GetArticlesByTagFailure(this.message);

  @override
  List<Object?> get props => [message];
}
