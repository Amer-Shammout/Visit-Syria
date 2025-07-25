import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/widgets/glass_effect.dart';

class CityTag extends StatelessWidget {
  const CityTag({super.key, this.isSmall = false, this.city});
  final bool isSmall;
  final String? city;

  @override
  Widget build(BuildContext context) {
    return GlassEffect(
      radius: isSmall ? 28 : 40,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isSmall ? 8 : 12,
          vertical: isSmall ? 4 : 6,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(isSmall ? 28 : 40),
          color: AppColors.primary.withValues(alpha: .2),
        ),
        child: Text(
          city ?? "دمشق",
          style:
              isSmall
                  ? AppStyles.fontsRegular10(
                    context,
                  ).copyWith(color: AppColors.whiteColor)
                  : AppStyles.fontsRegular14(
                    context,
                  ).copyWith(color: AppColors.whiteColor),
        ),
      ),
    );
  }
}
