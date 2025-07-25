import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Home/Data/Models/weather_model.dart';
import 'package:visit_syria/Features/Weather/Presentation/views/widgets/today_weather_card.dart';

class TodayWeatherCardsGridView extends StatelessWidget {
  const TodayWeatherCardsGridView({
    super.key,
    required this.weatherForWeek,
    required this.selectedIndex,
    required this.onDaySelected,
  });
  final List<WeatherModel> weatherForWeek;
  final int selectedIndex;
  final void Function(int) onDaySelected;
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
            onTap: () => onDaySelected(index),

            child: TodayWeatherCard(
              isSelected: selectedIndex == index,
              weather: weatherForWeek[index],
            ),
          ),
    );
  }
}
