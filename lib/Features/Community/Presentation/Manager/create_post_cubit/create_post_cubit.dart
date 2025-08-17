import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Features/Community/Data/Models/create_post_model.dart';
import 'package:visit_syria/Features/Community/Data/Repos/community_repo.dart';
import 'package:visit_syria/Features/Community/Presentation/Manager/create_post_cubit/create_post_state.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  final CommunityRepo _communityRepo;
  CreatePostCubit(this._communityRepo) : super(CreatePostInitial());

  Future<void> create(CreatePostModel model) async {
    emit(CreatePostLoading());
    final result = await _communityRepo.createPost(model);
    result.fold(
      (failure) => emit(CreatePostFailure(failure.errMessage)),
      (_) => emit(CreatePostSuccess()),
    );
  }
}
