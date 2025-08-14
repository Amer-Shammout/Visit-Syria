import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/widgets/custom_error_and_empty_state_body.dart';
import 'package:visit_syria/Core/widgets/custom_loading_indicator.dart';
import 'package:visit_syria/Features/About%20Syria/Presentation/Manager/get_similar_articles_by_id_cubit/get_similar_articles_by_id_cubit.dart';
import 'package:visit_syria/Features/About%20Syria/Presentation/Manager/get_similar_articles_by_id_cubit/get_similar_articles_by_id_state.dart';
import 'package:visit_syria/Features/About%20Syria/Presentation/Views/Widgets/similar_blogs_cards_list_view.dart';

class SimilarBlogsCardListViewBuilder extends StatelessWidget {
  const SimilarBlogsCardListViewBuilder({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<
      GetSimilarArticlesByIdCubit,
      GetSimilarArticlesByIdState
    >(
      builder: (context, state) {
        if (state is GetSimilarArticlesByIdSuccess) {
          return SimilarBlogsCardsListView(articles: state.articles);
        } else if (state is GetSimilarArticlesByIdFailure) {
          return CustomErrorAndEmptyStateBody(
            illustration: Assets.illustrationsFailure,
            text: state.message,
            buttonText: "إعادة المحاولة",
            onTap:
                () => BlocProvider.of<GetSimilarArticlesByIdCubit>(
                  context,
                ).fetchSimilarArticles(id),
          );
        } else {
          return Center(child: CustomLoadingIndicator());
        }
      },
    );
  }
}
