import 'package:flutter/material.dart';
import 'package:visit_syria/Core/data/models/city_model.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/widgets/custom_image.dart';

class CitiesCard extends StatelessWidget {
  const CitiesCard({super.key, required this.cityModel});

  final CityModel cityModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: AspectRatio(
        aspectRatio: 170 / 220,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            CustomImage(height: 220, borderRadius: 24, image: cityModel.image),
            Positioned(
              bottom: 12,
              left: 12,
              right: 12,
              child: Text(
                cityModel.title,
                style: AppStyles.fontsBold20(
                  context,
                ).copyWith(color: AppColors.whiteColor),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
