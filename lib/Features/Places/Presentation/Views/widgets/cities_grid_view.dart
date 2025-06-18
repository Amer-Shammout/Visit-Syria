import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/constants/cities_constants.dart';
import 'package:visit_syria/Core/utils/app_router.dart';
import 'package:visit_syria/Features/Places/Presentation/Views/widgets/cities_card.dart';

class CitiesGridView extends StatelessWidget {
  const CitiesGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 177 / 220,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
      ),
      itemBuilder:
          (context, index) => GestureDetector(
            onTap:
                () => GoRouter.of(
                  context,
                ).pushNamed(AppRouter.kCityDetailsName, extra: kCities[index]),
            child: CitiesCard(cityModel: kCities[index]),
          ),
      itemCount: kCities.length,
      padding: EdgeInsets.only(right: 16, left: 16, bottom: 32, top: 16),
      physics: BouncingScrollPhysics(),
    );
  }
}
