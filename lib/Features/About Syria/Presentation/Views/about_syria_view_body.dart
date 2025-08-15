import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/About%20Syria/Presentation/Manager/get_articles_by_tag_cubit/get_articles_by_tag_cubit.dart';
import 'package:visit_syria/Features/About%20Syria/Presentation/Views/Widgets/blogs_cards_list_view_builder.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/tags_list_view.dart';

class AboutSyriaViewBody extends StatelessWidget {
  const AboutSyriaViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    String? currentTag;
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        PinnedHeaderSliver(
          child: TagsListView(
            data: ['الكل', "دمشق", "حمص", "أماكن أثرية", "ساحل", "طبيعة"],
            onTagSelected: (value, index) {
              currentTag = value;
              BlocProvider.of<GetArticlesByTagCubit>(
                context,
              ).fetchArticles(value);
            },
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s12)),
        BlogsCardsListViewBuilder(tag: currentTag),
      ],
    );
  }
}
