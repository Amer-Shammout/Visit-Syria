import 'package:equatable/equatable.dart';
import 'package:visit_syria/Core/data/models/comment_model/comment_model.dart';

abstract class GetFeedbackState extends Equatable {
  const GetFeedbackState();

  @override
  List<Object?> get props => [];
}

class GetFeedbackInitial extends GetFeedbackState {}

class GetFeedbackLoading extends GetFeedbackState {}

class GetFeedbackEmpty extends GetFeedbackState {}

class GetFeedbackFailure extends GetFeedbackState {
  final String errMessage;
  const GetFeedbackFailure({required this.errMessage});

  @override
  List<Object?> get props => [errMessage];
}

class GetFeedbackSuccess extends GetFeedbackState {
  final List<CommentModel> comments;
  const GetFeedbackSuccess(this.comments);

  @override
  List<Object?> get props => [comments];
}
