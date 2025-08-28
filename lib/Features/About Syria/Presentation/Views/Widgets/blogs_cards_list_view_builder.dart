import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/widgets/custom_error_and_empty_state_body.dart';
import 'package:visit_syria/Core/widgets/custom_loading_indicator.dart';
import 'package:visit_syria/Features/About%20Syria/Presentation/Manager/get_articles_by_tag_cubit/get_articles_by_tag_cubit.dart';
import 'package:visit_syria/Features/About%20Syria/Presentation/Manager/get_articles_by_tag_cubit/get_articles_by_tag_state.dart';
import 'package:visit_syria/Features/About%20Syria/Presentation/Views/Widgets/blogs_cards_list_view.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/places_card.dart';

class BlogsCardsListViewBuilder extends StatelessWidget {
  const BlogsCardsListViewBuilder({super.key, this.tag});

  final String? tag;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetArticlesByTagCubit, GetArticlesByTagState>(
      builder: (context, state) {
        if (state is GetArticlesByTagSuccess) {
          return CustomSaveMultiBlocListener(
            child: BlogsCardsListView(articles: state.articles),
          );
        } else if (state is GetArticlesByTagFailure) {
          return SliverFillRemaining(
            child: CustomErrorAndEmptyStateBody(
              illustration: Assets.illustrationsFailure,
              text: state.message,
              buttonText: "إعادة المحاولة",
              onTap:
                  () => BlocProvider.of<GetArticlesByTagCubit>(
                    context,
                  ).fetchArticles(tag ?? "الكل"),
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
