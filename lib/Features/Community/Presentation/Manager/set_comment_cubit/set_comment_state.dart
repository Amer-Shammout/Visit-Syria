part of 'set_comment_cubit.dart';

sealed class SetCommentState extends Equatable {
  const SetCommentState();

  @override
  List<Object> get props => [];
}

final class SetCommentInitial extends SetCommentState {}

final class SetCommentFailure extends SetCommentState {
  final String message;

  const SetCommentFailure({required this.message});
}

final class SetCommentSuccess extends SetCommentState {}

final class SetCommentLoading extends SetCommentState {}
