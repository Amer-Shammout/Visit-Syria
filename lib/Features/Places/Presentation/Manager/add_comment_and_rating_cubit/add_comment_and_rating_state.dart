part of 'add_comment_and_rating_cubit.dart';

sealed class AddCommentAndRatingState extends Equatable {
  const AddCommentAndRatingState();

  @override
  List<Object> get props => [];
}

final class AddCommentAndRatingInitial extends AddCommentAndRatingState {}

final class AddCommentAndRatingLoading extends AddCommentAndRatingState {}

final class AddCommentAndRatingSuccess extends AddCommentAndRatingState {}

final class AddCommentAndRatingFailure extends AddCommentAndRatingState {
  final String errorMessage;

  const AddCommentAndRatingFailure({required this.errorMessage});
}
