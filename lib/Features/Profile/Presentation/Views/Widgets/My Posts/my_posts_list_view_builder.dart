import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/widgets/custom_error_and_empty_state_body.dart';
import 'package:visit_syria/Core/widgets/custom_loading_indicator.dart';
import 'package:visit_syria/Features/Community/Presentation/Manager/get_my_posts_cubit/get_my_posts_cubit.dart';
import 'package:visit_syria/Features/Community/Presentation/Manager/get_my_posts_cubit/get_my_posts_state.dart';
import 'package:visit_syria/Features/Community/Presentation/Views/Widgets/posts_list_view.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/places_card.dart';

class MyPostsListViewBuilder extends StatelessWidget {
  const MyPostsListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetMyPostsCubit, GetMyPostsState>(
      builder: (context, state) {
        if (state is GetMyPostsSuccess) {
          return CustomSaveMultiBlocListener(
            child: PostsListView(
              posts: state.posts,
              displayStatus: true,
              isMyPost: true,
            ),
          );
        } else if (state is GetMyPostsFailure) {
          return SliverFillRemaining(
            child: CustomErrorAndEmptyStateBody(
              illustration: Assets.illustrationsFailure,
              text: state.message,
              buttonText: "إعادة المحاولة",
              onTap:
                  () =>
                      BlocProvider.of<GetMyPostsCubit>(context).fetchMyPosts(),
            ),
          );
        } else if (state is GetMyPostsEmpty) {
          return SliverFillRemaining(
            child: CustomErrorAndEmptyStateBody(
              illustration: Assets.illustrationsEmptyPosts,
              text: "شارك أول منشوراتك!",
              buttonText: "شارك الآن",
              onTap:
                  () =>
                      GoRouter.of(context).pushNamed(AppRouter.kCreatePostName),
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
