import 'package:flutter/material.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/weather_cards_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: SizedBox(height: 16)),
        SliverToBoxAdapter(child: WeatherCardsListView()),
      ],
    );
  }
}
