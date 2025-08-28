import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/data/models/comment_model/comment_model.dart';
import 'package:visit_syria/Core/data/models/comment_model/user.dart';
import 'package:visit_syria/Features/Places/Data/Models/place_model/place_model.dart';
import 'package:visit_syria/Features/Places/Data/Models/place_model/recent_comment.dart';
import 'package:visit_syria/Features/Places/Data/Repos/places_repo.dart';
import 'package:visit_syria/Features/Profile/Presentation/Manager/get_profile_cubit/get_profile_cubit.dart';

part 'add_comment_and_rating_state.dart';

class AddCommentAndRatingCubit extends Cubit<AddCommentAndRatingState> {
  AddCommentAndRatingCubit(this._placesRepo)
    : super(AddCommentAndRatingInitial());
  final PlacesRepo _placesRepo;

  Future<void> addCommentAndRating({
    required String placeId,
    required String comment,
    required String rating,
    required List<RecentComment> recentComments,
    List<CommentModel>? comments,
    PlaceModel? placeModel,
  }) async {
    emit(AddCommentAndRatingLoading());
    final result = await _placesRepo.addCommentAndRating(
      placeId: placeId,
      comment: comment,
      rating: rating,
    );
    result.fold(
      (failure) =>
          emit(AddCommentAndRatingFailure(errorMessage: failure.errMessage)),
      (data) {
        placeModel!.userComment = comment;
        placeModel.userRating = rating;
        final userRecentComment = RecentComment(
          body: data['comment']?['comment'],
          createdAt: data['comment']?['created_at'],
          id: data['comment']?['id'],
          ratingValue: data['rating']['rating_value'],
          userAvatar: GetProfileCubit.userModel?.me?.profile?.photo,
          userName:
              "${GetProfileCubit.userModel?.me?.profile?.firstName} ${GetProfileCubit.userModel?.me?.profile?.lastName}",
        );
        final existsRecent = recentComments.any(
          (c) => c.id == userRecentComment.id,
        );
        if (!existsRecent) {
          log("AA");
          recentComments.insert(0, userRecentComment);
        } else {
          log("BBB");
          final index = recentComments.indexWhere(
            (c) => c.id == userRecentComment.id,
          );
          if (index != -1) {
            recentComments[index] = userRecentComment;
          }
        }

        if (comments != null) {
          final userComment = CommentModel(
            id: data['comment']?['id'],
            body: data['comment']?['comment'],
            createdAt: data['comment']?['created_at'],
            userRating: data['rating']['rating_value'],
            user: User(
              name:
                  "${GetProfileCubit.userModel?.me?.profile?.firstName} ${GetProfileCubit.userModel?.me?.profile?.lastName}",
              profilePhoto: GetProfileCubit.userModel?.me?.profile?.photo,
            ),
          );
          final existsComment = comments.any((c) => c.id == userComment.id);
          if (!existsComment) {
            comments.insert(0, userComment);
          } else {
            final index = comments.indexWhere((c) => c.id == userComment.id);
            if (index != -1) {
              comments[index] = userComment;
            }
          }
        }

        emit(AddCommentAndRatingSuccess());
      },
    );
  }
}
