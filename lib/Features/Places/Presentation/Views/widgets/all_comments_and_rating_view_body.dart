import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/constants/flight_type.dart';
import 'package:visit_syria/Core/manager/get_feedback_cubit/get_feedback_cubit.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/comments_list_view_builder.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/tags_list_view.dart';

class AllCommentsAndRatingViewBody extends StatefulWidget {
  const AllCommentsAndRatingViewBody({super.key, required this.id});

  final String id;

  @override
  State<AllCommentsAndRatingViewBody> createState() =>
      _AllCommentsAndRatingViewBodyState();
}

class _AllCommentsAndRatingViewBodyState
    extends State<AllCommentsAndRatingViewBody> {
  @override
  void initState() {
    BlocProvider.of<GetFeedbackCubit>(
      context,
    ).getFeedback(type: 'place', id: widget.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        PinnedHeaderSliver(
          child: Container(
            color: AppColors.whiteColor,
            child: TagsListView(
              data: [
                "كل التعليقات",
                "التعليقات الايجابية",
                "التعليقات السلبية",
                "⭐ 1 نجمة",
                "⭐ 2 نجمة",
                "⭐ 3 نجوم",
                "⭐ 4 نجوم",
                "⭐ 5 نجوم",
              ],
              onTagSelected: (value, index) {
                final classification = FeedbackClassification.values[index];
                context.read<GetFeedbackCubit>().filterComments(classification);
              },
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s12)),
        CommentsListViewBuilder(id: widget.id),
        SliverToBoxAdapter(child: SizedBox(height: 270)),
      ],
    );
  }
}
