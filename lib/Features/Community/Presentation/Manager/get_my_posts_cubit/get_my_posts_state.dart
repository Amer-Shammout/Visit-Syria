import 'package:equatable/equatable.dart';
import 'package:visit_syria/Features/Community/Data/Models/post_model/post_model.dart';

abstract class GetMyPostsState extends Equatable {
  const GetMyPostsState();

  @override
  List<Object?> get props => [];
}

class GetMyPostsInitial extends GetMyPostsState {}
class GetMyPostsLoading extends GetMyPostsState {}
class GetMyPostsEmpty extends GetMyPostsState {}
class GetMyPostsSuccess extends GetMyPostsState {
  final List<PostModel> posts;
  const GetMyPostsSuccess(this.posts);

  @override
  List<Object?> get props => [posts];
}
class GetMyPostsFailure extends GetMyPostsState {
  final String message;
  const GetMyPostsFailure(this.message);

  @override
  List<Object?> get props => [message];
}