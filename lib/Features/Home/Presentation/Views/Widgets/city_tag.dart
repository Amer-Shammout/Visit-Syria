import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/widgets/glass_effect.dart';

class CityTag extends StatelessWidget {
  const CityTag({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassEffect(
      radius: 40,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          color: AppColors.primary.withValues(alpha: .2),
        ),
        child: Text(
          'دمشق',
          style: AppStyles.fontsRegular14(
            context,
          ).copyWith(color: AppColors.whiteColor),
        ),
      ),
    );
  }
}