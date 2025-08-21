import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/widgets/custom_error_and_empty_state_body.dart';
import 'package:visit_syria/Core/widgets/custom_loading_indicator.dart';
import 'package:visit_syria/Features/Community/Presentation/Manager/get_all_approved_posts_by_tag_cubit/get_all_approved_posts_by_tag_cubit.dart';
import 'package:visit_syria/Features/Community/Presentation/Manager/get_all_approved_posts_by_tag_cubit/get_all_approved_posts_by_tag_state.dart';
import 'package:visit_syria/Features/Community/Presentation/Views/Widgets/posts_list_view.dart';

class PostsListViewBuilder extends StatelessWidget {
  const PostsListViewBuilder({super.key, required this.tag});
  final String tag;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      GetAllApprovedPostsByTagCubit,
      GetAllApprovedPostsByTagState
    >(
      builder: (context, state) {
        if (state is GetAllApprovedPostsByTagSuccess) {
          return PostsListView(posts: state.posts, displayStatus: false);
        } else if (state is GetAllApprovedPostsByTagFailure) {
          return SliverFillRemaining(
            child: CustomErrorAndEmptyStateBody(
              illustration: Assets.illustrationsFailure,
              text: state.message,
              buttonText: "إعادة المحاولة",
              onTap:
                  () => BlocProvider.of<GetAllApprovedPostsByTagCubit>(
                    context,
                  ).fetchPosts(tag),
            ),
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
