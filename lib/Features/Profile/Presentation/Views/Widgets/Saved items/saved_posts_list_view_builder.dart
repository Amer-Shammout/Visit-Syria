import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/constants/flight_type.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/widgets/custom_error_and_empty_state_body.dart';
import 'package:visit_syria/Core/widgets/custom_loading_indicator.dart';
import 'package:visit_syria/Features/Community/Presentation/Views/Widgets/posts_list_view.dart';
import 'package:visit_syria/Features/Profile/Presentation/Manager/get_saves_cubit/get_saves_cubit.dart';
import 'package:visit_syria/Features/Profile/Presentation/Manager/get_saves_cubit/get_saves_state.dart';

class SavedPostsListViewBuilder extends StatelessWidget {
  const SavedPostsListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
   return BlocBuilder<GetSavesCubit, GetSavesState>(
      builder: (context, state) {
        if (state is GetSavesFailure) {
          return SliverFillRemaining(
            child: CustomErrorAndEmptyStateBody(
              illustration: Assets.illustrationsFailure,
              text: state.errMessage,
              buttonText: "إعادة المحاولة",
              onTap:
                  () => BlocProvider.of<GetSavesCubit>(
                    context,
                  ).getSaves(type: SearchTypes.post),
            ),
          );
        } else if (state is GetSavesEmpty) {
          return SliverFillRemaining(
            child: CustomErrorAndEmptyStateBody(
              illustration: Assets.illustrationsEmptyPosts,
              text: "لا يوجد منشورات محفوظة!",
            ),
          );
        } else if (state is GetSavesSuccess) {
          return PostsListView(posts: state.items,displayStatus: false,);
        } else {
          return SliverFillRemaining(
            child: Center(child: CustomLoadingIndicator()),
          );
        }
      },
    );
  }
}