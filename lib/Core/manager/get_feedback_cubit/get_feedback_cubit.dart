import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/constants/flight_type.dart';
import 'package:visit_syria/Core/data/models/comment_model/comment_model.dart';
import 'package:visit_syria/Core/data/repos/common_repo.dart';
import 'package:visit_syria/Core/manager/get_feedback_cubit/get_feedback_state.dart';

class GetFeedbackCubit extends Cubit<GetFeedbackState> {
  GetFeedbackCubit(this._commonRepo) : super(GetFeedbackInitial());

  final CommonRepo _commonRepo;
  List<CommentModel> allComments = [];

  Future<void> getFeedback({required String type, required String id}) async {
    emit(GetFeedbackLoading());
    final result = await _commonRepo.getFeedback(id: id, type: type);
    result.fold(
      (failure) => emit(GetFeedbackFailure(errMessage: failure.errMessage)),
      (comments) {
        if (comments.isEmpty) {
          emit(GetFeedbackEmpty());
        } else {
          allComments = comments;
          emit(GetFeedbackSuccess(comments)); 
        }
      },
    );
  }

  void filterComments(FeedbackClassification classification) {
    List<CommentModel> filtered;
    if (classification == FeedbackClassification.all) {
      filtered = allComments;
    } else if (classification == FeedbackClassification.positive) {
      filtered = allComments.where((c) => (c.userRating ?? 0) >= 3).toList();
    } else if (classification == FeedbackClassification.negative) {
      filtered = allComments.where((c) => (c.userRating ?? 0) < 3).toList();
    } else {
      final stars = classification.index - 2; 
      filtered = allComments.where((c) => (c.userRating ?? 0) == stars).toList();
    }

    if (filtered.isEmpty) {
      emit(GetFeedbackEmpty());
    } else {
      emit(GetFeedbackSuccess(filtered)); 
    }
  }
}
