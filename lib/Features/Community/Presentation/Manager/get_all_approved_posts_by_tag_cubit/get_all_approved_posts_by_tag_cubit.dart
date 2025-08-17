import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Features/Community/Data/Repos/community_repo.dart';
import 'package:visit_syria/Features/Community/Presentation/Manager/get_all_approved_posts_by_tag_cubit/get_all_approved_posts_by_tag_state.dart';

class GetAllApprovedPostsByTagCubit
    extends Cubit<GetAllApprovedPostsByTagState> {
  final CommunityRepo _communityRepo;
  GetAllApprovedPostsByTagCubit(this._communityRepo)
    : super(GetAllApprovedPostsByTagInitial());

  Future<void> fetchPosts(String tag) async {
    emit(GetAllApprovedPostsByTagLoading());
    final result = await _communityRepo.getAllApprovedPostsByTag(tag);
    result.fold(
      (failure) => emit(GetAllApprovedPostsByTagFailure(failure.errMessage)),
      (posts) => emit(GetAllApprovedPostsByTagSuccess(posts)),
    );
  }

  Future<void> toggleLikeForPost(String postId) async {
    if (state is GetAllApprovedPostsByTagSuccess) {
      final currentState = state as GetAllApprovedPostsByTagSuccess;
      final result = await _communityRepo.toggleLike(postId);

      result.fold((l) => null, (r) {
        bool liked = r['liked'];
        int likesCount = r['likes_count'];

        final updatedPosts =
            currentState.posts.map((post) {
              if (post.id.toString() == postId) {
                return post.copyWith(isLiked: liked, likesCount: likesCount);
              }
              return post;
            }).toList();

        emit(GetAllApprovedPostsByTagSuccess(updatedPosts));
      });
    }
  }
}
