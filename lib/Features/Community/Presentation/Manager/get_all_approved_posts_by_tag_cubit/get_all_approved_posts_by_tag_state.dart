import 'package:equatable/equatable.dart';
import 'package:visit_syria/Features/Community/Data/Models/post_model/post_model.dart';

abstract class GetAllApprovedPostsByTagState extends Equatable {
  const GetAllApprovedPostsByTagState();

  @override
  List<Object?> get props => [];
}

class GetAllApprovedPostsByTagInitial extends GetAllApprovedPostsByTagState {}

class GetAllApprovedPostsByTagLoading extends GetAllApprovedPostsByTagState {}

class GetAllApprovedPostsByTagSuccess extends GetAllApprovedPostsByTagState {
  final List<PostModel> posts;
  const GetAllApprovedPostsByTagSuccess(this.posts);

  @override
  List<Object?> get props => [posts];
}

class GetAllApprovedPostsByTagFailure extends GetAllApprovedPostsByTagState {
  final String message;
  const GetAllApprovedPostsByTagFailure(this.message);

  @override
  List<Object?> get props => [message];
}
