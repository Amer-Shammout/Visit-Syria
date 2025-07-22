import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Weather/Presentation/views/widgets/today_weather_card.dart';

class TodayWeatherCardsGridView extends StatefulWidget {
  const TodayWeatherCardsGridView({super.key});

  @override
  State<TodayWeatherCardsGridView> createState() =>
      _TodayWeatherCardsGridViewState();
}

class _TodayWeatherCardsGridViewState extends State<TodayWeatherCardsGridView> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      clipBehavior: Clip.antiAlias,
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 177 / 106,
        crossAxisSpacing: AppSpacing.s16,
        mainAxisSpacing: AppSpacing.s16,
        mainAxisExtent: 106,
      ),
      itemCount: 7,
      physics: BouncingScrollPhysics(),

      itemBuilder:
          (context, index) => GestureDetector(
            onTap:
                () => setState(() {
                  _currentIndex = index;
                }),
            child: TodayWeatherCard(isSelected: _currentIndex == index),
          ),
    );
  }
}
