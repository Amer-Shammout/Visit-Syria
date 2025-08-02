import 'package:flutter/widgets.dart';
import 'package:visit_syria/Features/Search/Presentation/Views/Widgets/common_search_view_body.dart';
import 'package:visit_syria/Features/Search/Presentation/Views/Widgets/history_search_view_body.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        CommonSearchViewBody(),
        // ErrorSearchViewBody(),
        HistorySearchViewBody(),
        // InitialSearchViewBody()
      ],
    );
  }
}
