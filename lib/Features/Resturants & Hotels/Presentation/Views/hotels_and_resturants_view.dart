import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/constants/tags_constants.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_app_bar_with_tab_bar.dart';
import 'package:visit_syria/Features/Places/Presentation/Manager/get_hotels_by_city_cubit/get_hotels_by_city_cubit.dart';
import 'package:visit_syria/Features/Places/Presentation/Manager/get_resturants_by_city_cubit/get_restruants_by_city_cubit.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/tags_list_view.dart';
import 'package:visit_syria/Features/Resturants%20&%20Hotels/Presentation/Views/widgets/hotels_grid_view_builder.dart';
import 'package:visit_syria/Features/Resturants%20&%20Hotels/Presentation/Views/widgets/resturants_grid_view_builder.dart';

class HotelsAndResturantsView extends StatefulWidget {
  const HotelsAndResturantsView({super.key,});

  @override
  State<HotelsAndResturantsView> createState() =>
      _HotelsAndResturantsViewState();
}

class _HotelsAndResturantsViewState extends State<HotelsAndResturantsView> {
  @override
  void initState() {
    BlocProvider.of<GetRestaurantsByCityCubit>(
      context,
    ).fetchRestaurants("دمشق");
    BlocProvider.of<GetHotelsByCityCubit>(context).fetchHotels("دمشق");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: CustomAppBarWithTabBar(),
        body: TabBarView(
          children: [
            CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s20)),
                PinnedHeaderSliver(
                  child: TagsListView(
                    data: kCitiesTags,
                    onTagSelected:
                        (value, index) =>
                            BlocProvider.of<GetRestaurantsByCityCubit>(
                              context,
                            ).fetchRestaurants(value),
                  ),
                ),
                ResturantGridViewBuilder(),
              ],
            ),
            CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(child: SizedBox(height: AppSpacing.s20)),
                PinnedHeaderSliver(
                  child: TagsListView(
                    data: kCitiesTags,
                    onTagSelected:
                        (value, index) => BlocProvider.of<GetHotelsByCityCubit>(
                          context,
                        ).fetchHotels(value),
                  ),
                ),
                HotelsGridViewBuilder(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
