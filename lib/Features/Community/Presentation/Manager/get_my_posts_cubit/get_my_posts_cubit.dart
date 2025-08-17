import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/constants/flight_type.dart';
import 'package:visit_syria/Features/Community/Data/Models/post_model/post_model.dart';
import 'package:visit_syria/Features/Community/Data/Repos/community_repo.dart';
import 'package:visit_syria/Features/Community/Presentation/Manager/get_my_posts_cubit/get_my_posts_state.dart';

class GetMyPostsCubit extends Cubit<GetMyPostsState> {
  final CommunityRepo _communityRepo;
  List<PostModel> allMyPosts = [];

  GetMyPostsCubit(this._communityRepo) : super(GetMyPostsInitial());

  Future<void> fetchMyPosts() async {
    emit(GetMyPostsLoading());
    final result = await _communityRepo.getMyPosts();
    result.fold((failure) => emit(GetMyPostsFailure(failure.errMessage)), (
      posts,
    ) {
      if (posts.isEmpty) {
        emit(GetMyPostsEmpty());
      } else {
        allMyPosts = posts;
        emit(GetMyPostsSuccess(posts));
      }
    });
  }

  void filterMyPosts(PostsFilter filter) {
    List<PostModel> filtered;

    // تحويل حالة الـ status لكل المنشورات إلى lowercase
    String statusToString(PostStatus status) =>
        status.toString().split('.').last.toLowerCase();

    switch (filter) {
      case PostsFilter.all:
        filtered = allMyPosts;
        break;
      case PostsFilter.approved:
        filtered =
            allMyPosts
                .where(
                  (p) =>
                      (p.status ?? '').toLowerCase() ==
                      statusToString(PostStatus.approved),
                )
                .toList();
        break;
      case PostsFilter.pending:
        filtered =
            allMyPosts
                .where(
                  (p) =>
                      (p.status ?? '').toLowerCase() ==
                      statusToString(PostStatus.pending),
                )
                .toList();
        break;
      case PostsFilter.rejected:
        filtered =
            allMyPosts
                .where(
                  (p) =>
                      (p.status ?? '').toLowerCase() ==
                      statusToString(PostStatus.rejected),
                )
                .toList();
        break;
    }

    if (filtered.isEmpty) {
      emit(GetMyPostsEmpty());
    } else {
      emit(GetMyPostsSuccess(filtered));
    }
  }

  Future<void> toggleLikeForPost(String postId) async {
    if (state is GetMyPostsSuccess) {
      final currentState = state as GetMyPostsSuccess;
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

        emit(GetMyPostsSuccess(updatedPosts));
      });
    }
  }
}
