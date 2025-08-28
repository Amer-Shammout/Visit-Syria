import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/manager/get_feedback_cubit/get_feedback_cubit.dart';
import 'package:visit_syria/Core/manager/get_feedback_cubit/get_feedback_state.dart';
import 'package:visit_syria/Core/utils/styles/shadows.dart';
import 'package:visit_syria/Core/widgets/custom_app_bar_2.dart';
import 'package:visit_syria/Features/Places/Data/Models/place_model/place_model.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/all_comments_and_rating_view_body.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/rating_form.dart';

class AllCommentsAndRatingView extends StatelessWidget {
  const AllCommentsAndRatingView({super.key, required this.placeModel});

  final PlaceModel placeModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar2(title: "التقييمات و التعليقات"),
      body: AllCommentsAndRatingViewBody(id: placeModel.id!.toString()),
      bottomSheet: BlocBuilder<GetFeedbackCubit, GetFeedbackState>(
        builder: (context, state) {
          if (state is GetFeedbackSuccess) {
            return Wrap(
              children: [
                RatingForm(
                  padding: 0,
                  boxShadow: Shadows.aiBootContainerShadow,
                  hasBottomRadius: false,
                  userComment: placeModel.userComment,
                  userRate: placeModel.userRating,
                  id: placeModel.id.toString(),
                  recentComments: placeModel.recentComments,
                  comments: state.comments,
                  placeModel: placeModel,
                ),
              ],
            );
          } else {
            return SizedBox.shrink();
          }
        },
      ),
    );
  }
}
