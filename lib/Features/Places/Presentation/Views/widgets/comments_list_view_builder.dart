import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/manager/get_feedback_cubit/get_feedback_cubit.dart';
import 'package:visit_syria/Core/manager/get_feedback_cubit/get_feedback_state.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/widgets/custom_error_and_empty_state_body.dart';
import 'package:visit_syria/Core/widgets/custom_loading_indicator.dart';
import 'package:visit_syria/Features/Places/Presentation/Manager/add_comment_and_rating_cubit/add_comment_and_rating_cubit.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/comments_list_view.dart';

class CommentsListViewBuilder extends StatelessWidget {
  const CommentsListViewBuilder({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFeedbackCubit, GetFeedbackState>(
      builder: (context, state) {
        if (state is GetFeedbackEmpty) {
          return SliverFillRemaining(
            child: CustomErrorAndEmptyStateBody(
              illustration: Assets.illustrationsEmptyComments,
              text: "لا يوجد تعليقات في هذا التصنيف!",
            ),
          );
        } else if (state is GetFeedbackFailure) {
          return SliverFillRemaining(
            child: CustomErrorAndEmptyStateBody(
              illustration: Assets.illustrationsFailure,
              text: state.errMessage,
              buttonText: "إعادة المحاولة",
              onTap:
                  () => BlocProvider.of<GetFeedbackCubit>(
                    context,
                  ).getFeedback(type: 'place', id: id),
            ),
          );
        } else if (state is GetFeedbackSuccess) {
          return BlocBuilder<
            AddCommentAndRatingCubit,
            AddCommentAndRatingState
          >(
            builder: (context, _) {
              return CommentsListView(
                comments: state.comments,
                shrinkWrap: false,
              );
            },
          );
        } else {
          return SliverFillRemaining(
            child: Center(child: CustomLoadingIndicator()),
          );
        }
      },
    );
  }
}
