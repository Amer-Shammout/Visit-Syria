import 'package:flutter/widgets.dart';
import 'package:visit_syria/Core/widgets/history_tile.dart';

class HistorySearchViewBody extends StatelessWidget {
  const HistorySearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(top: 12),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => HistoryTile(onTap: () {}, title: 'text $index'),
          childCount: 6,
        ),
      ),
    );
  }
}
