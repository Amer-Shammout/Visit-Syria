import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/widgets/history_and_search_tile.dart';
import 'package:visit_syria/Features/Flights%20Reservation/Data/Models/airport_search_result_model.dart';

class ResultsAirportSearchViewBody extends StatelessWidget {
  const ResultsAirportSearchViewBody({super.key, required this.airports});

  final List<AirportSearchResultModel> airports;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(top: 12),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => HistoryandSearchTile(
            onTap: () {
              GoRouter.of(context).pop(airports[index]);
            },
            title: "(${airports[index].code}) ${airports[index].city}",
            icon: Assets.iconsAirplaneUp,
            country: airports[index].country,
          ),
          childCount: airports.length,
        ),
      ),
    );
  }
}
