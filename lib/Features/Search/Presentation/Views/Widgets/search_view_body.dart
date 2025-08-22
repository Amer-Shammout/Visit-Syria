import 'package:flutter/widgets.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Search/Presentation/Views/Widgets/common_search_view_body.dart';
import 'package:visit_syria/Features/Search/Presentation/Views/Widgets/search_view_body_builder.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        CommonSearchViewBody(),
        SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s16)),
        SearchViewBodyBuilder(),
        SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
      ],
    );
  }
}
