import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/tags_list_view.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/trips_cards_list_view.dart';

class MyTripsViewBody extends StatelessWidget {
  const MyTripsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        PinnedHeaderSliver(
          child: TagsListView(
            data: ["الكل", "تراثي", "ديني", "ترفيهي", "طبيعي", "ثقافي"],
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s12)),
        TripsCardsListView(),
      ],
    );
  }
}
