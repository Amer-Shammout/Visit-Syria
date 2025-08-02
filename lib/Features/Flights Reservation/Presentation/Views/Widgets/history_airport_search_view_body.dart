import 'package:flutter/material.dart';
import 'package:visit_syria/Core/widgets/history_and_search_tile.dart';

class HistoryAirportSearchViewBody extends StatelessWidget {
  const HistoryAirportSearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(top: 12),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) =>
              HistoryandSearchTile(onTap: () {}, title: 'text $index'),
          childCount: 6,
        ),
      ),
    );
  }
}
