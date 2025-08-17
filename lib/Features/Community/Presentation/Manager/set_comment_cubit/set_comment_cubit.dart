import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Features/Community/Data/Repos/community_repo.dart';

part 'set_comment_state.dart';

class SetCommentCubit extends Cubit<SetCommentState> {
  SetCommentCubit(this._communityRepo) : super(SetCommentInitial());

  final CommunityRepo _communityRepo;

  Future<void> setComment(String comment, String id) async {
    emit(SetCommentLoading());
    final result = await _communityRepo.setComment(comment, id);
    result.fold(
      (l) => emit(SetCommentFailure(message: l.errMessage)),
      (r) => emit(SetCommentSuccess()),
    );
  }
}
