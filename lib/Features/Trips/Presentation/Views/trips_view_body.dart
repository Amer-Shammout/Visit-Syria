import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/tags_list_view.dart';
import 'package:visit_syria/Features/Trips/Presentation/Views/widgets/trips_cards_list_view_builder.dart';
import 'package:visit_syria/Features/Trips/Presentation/manager/get_trips_by_category_cubit/get_trips_by_category_cubit.dart';

class TripsViewBody extends StatefulWidget {
  const TripsViewBody({super.key});

  @override
  State<TripsViewBody> createState() => _TripsViewBodyState();
}

class _TripsViewBodyState extends State<TripsViewBody> {
  final List<String> category = [
    "الكل",
    "تراثي",
    "ديني",
    "ترفيهي",
    "طبيعي",
    "ثقافي",
  ];
  int selectedCategoryIndex = 0;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        PinnedHeaderSliver(
          child: TagsListView(
            data: category,
            onTagSelected: (value, index) async {
              selectedCategoryIndex = index;
              await BlocProvider.of<GetTripsByCategoryCubit>(
                context,
              ).getTripsByCategory(category[selectedCategoryIndex]);
            },
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s12)),
        SliverFillRemaining(
          child: TripsCardsListViewBuilder(
            category: category[selectedCategoryIndex],
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s32)),
      ],
    );
  }
}
