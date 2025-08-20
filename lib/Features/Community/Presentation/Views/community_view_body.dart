import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Community/Presentation/Manager/get_all_approved_posts_by_tag_cubit/get_all_approved_posts_by_tag_cubit.dart';
import 'package:visit_syria/Features/Community/Presentation/Views/Widgets/community_view_header.dart';
import 'package:visit_syria/Features/Community/Presentation/Views/Widgets/posts_list_view_builder.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/tags_list_view.dart';

class CommunityViewBody extends StatelessWidget {
  const CommunityViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    String currentTag = 'الكل';
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(child: CommunityViewHeader()),
        SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s24)),
        PinnedHeaderSliver(
          child: TagsListView(
            data: [
              'الكل',
              "دمشق",
              "حمص",
              "أماكن أثرية",
              "ساحل",
              "طبيعة",
              'طرطوس',
            ],
            onTagSelected: (value, index) {
              currentTag = value;
              BlocProvider.of<GetAllApprovedPostsByTagCubit>(
                context,
              ).fetchPosts(value);
            },
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s12)),
        PostsListViewBuilder(tag: currentTag),
      ],
    );
  }
}

