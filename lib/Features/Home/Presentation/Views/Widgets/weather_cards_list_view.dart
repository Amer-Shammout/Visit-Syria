import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Home/Data/Models/weather_model.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/weather_card.dart';

class WeatherCardsListView extends StatelessWidget {
  const WeatherCardsListView({super.key, required this.weatherCards});
  final List<WeatherModel> weatherCards;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 103,
      child: ListView.separated(
        clipBehavior: Clip.none,
        physics: BouncingScrollPhysics(),
        itemBuilder:
            (context, index) => Padding(
              padding: EdgeInsetsDirectional.only(
                start: index == 0 ? 16 : 0,
                end: index == 12 ? 16 : 0,
              ),
              child: WeatherCard(weatherModel: weatherCards[index]),
            ),
        scrollDirection: Axis.horizontal,
        itemCount: weatherCards.length,
        separatorBuilder: (context, index) => SizedBox(width: AppSpacing.s16),
      ),
    );
  }
}
