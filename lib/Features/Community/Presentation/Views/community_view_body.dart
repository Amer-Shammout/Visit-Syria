import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Community/Presentation/Views/Widgets/community_view_header.dart';
import 'package:visit_syria/Features/Community/Presentation/Views/Widgets/post_card.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/tags_list_view.dart';

class CommunityViewBody extends StatelessWidget {
  const CommunityViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(child: CommunityViewHeader()),
        SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s24)),
        PinnedHeaderSliver(
          child: Container(
            height: MediaQuery.sizeOf(context).height * 0.046 + 16,
            color: AppColors.whiteColor,
            child: TagsListView(
              data: ['الكل', "دمشق", "حمص", "أماكن أثرية", "ساحل", "طبيعة"],
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s12)),
        SliverPadding(
          padding: EdgeInsets.only(left: 16, right: 16, bottom: 32),
          sliver: SliverList.separated(
            itemBuilder:
                (context, index) =>
                    PostCard(hasImage: index.isEven ? false : true),
            separatorBuilder:
                (context, index) => SizedBox(height: AppSpacing.s16),
            itemCount: 6,
          ),
        ),
      ],
    );
  }
}
