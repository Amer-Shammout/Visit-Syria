import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/widgets/custom_loading_indicator.dart';
import 'package:visit_syria/Features/About%20Syria/Presentation/Views/Widgets/blogs_cards_list_view.dart';
import 'package:visit_syria/Features/Community/Presentation/Views/Widgets/posts_list_view.dart';
import 'package:visit_syria/Features/Events/Presentation/Views/widgets/all_events_list_view.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/places_grid_view.dart';
import 'package:visit_syria/Features/Search/Presentation/Manager/search_cubit/search_cubit.dart';
import 'package:visit_syria/Features/Search/Presentation/Manager/search_cubit/search_state.dart';
import 'package:visit_syria/Features/Search/Presentation/Views/Widgets/history_search_view_body.dart';
import 'package:visit_syria/Features/Search/Presentation/Views/Widgets/initial_search_view_body.dart';
import 'package:visit_syria/Features/Search/Presentation/Views/Widgets/no_results_search_view_body.dart';
import 'package:visit_syria/Features/Tourism%20Companies/Presentation/Views/widgets/tourism_companies_cards_grid_view.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/trips_cards_list_view.dart';

class SearchViewBodyBuilder extends StatelessWidget {
  const SearchViewBodyBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchHistoryState) {
          return HistorySearchViewBody(history: state.history);
        } else if (state is SearchFailure) {
          return ErrorSearchViewBody(message: state.errMessage, onTap: () {});
        } else if (state is SearchNoResults) {
          return NoResultsSearchViewBody();
        } else if (state is SearchInitial) {
          return InitialSearchViewBody();
        } else if (state is SearchSuccess) {
          switch (state.type!.name) {
            case "tourist" || "restaurant" || "hotel":
              return PlacesGridView(places: state.results);

            case "post":
              return PostsListView(posts: state.results, displayStatus: false);
            case "company":
              return TourismCompaniesCardsGridView(companies: state.results);
            case "article":
              return BlogsCardsListView(articles: state.results);
            case "event":
              return SliverFillRemaining(
                child: AllEventsListView(events: state.results),
              );
            case "trip":
              return SliverFillRemaining(
                child: TripsCardsListView(trips: state.results),
              );

            default:
              return const Center(child: Text("نوع غير مدعوم"));
          }
        } else {
          return SliverToBoxAdapter(
            child: Center(child: CustomLoadingIndicator()),
          );
        }
      },
    );
  }
}
