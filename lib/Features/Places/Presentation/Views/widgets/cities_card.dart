import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/widgets/custom_image.dart';

class CitiesCard extends StatelessWidget {
  const CitiesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,
      child: AspectRatio(
        aspectRatio: 170 / 220,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            CustomImage(height: 220, borderRadius: 24),
            Positioned(
              bottom: 12,
              left: 12,
              right: 12,
              child: Text(
                "دمشق",
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
