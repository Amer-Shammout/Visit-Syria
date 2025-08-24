import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:visit_syria/Core/widgets/history_and_search_tile.dart';
import 'package:visit_syria/Features/Search/Presentation/Manager/search_cubit/search_cubit.dart';

class HistorySearchViewBody extends StatelessWidget {
  const HistorySearchViewBody({super.key, required this.history});

  final List<String> history;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(top: 12),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) => HistoryandSearchTile(
            onTap:
                () => BlocProvider.of<SearchCubit>(
                  context,
                ).pickFromHistory(history[index]),
            title: history[index],
          ),
          childCount: history.length,
        ),
      ),
    );
  }
}
