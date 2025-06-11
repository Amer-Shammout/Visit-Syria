import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Home/Presentation/Views/Widgets/weather_card.dart';

class WeatherCardsListView extends StatelessWidget {
  const WeatherCardsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.separated(
        clipBehavior: Clip.none,
        physics: BouncingScrollPhysics(),
        itemBuilder:
            (context, index) => Padding(
              padding: EdgeInsetsDirectional.only(
                start: index == 0 ? 16 : 0,
                end: index == 13 ? 16 : 0,
              ),
              child: WeatherCard(),
            ),
        scrollDirection: Axis.horizontal,
        itemCount: 14,
        separatorBuilder: (context, index) => SizedBox(width: AppSpacing.s16),
      ),
    );
  }
}
