import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';

class CustomRating extends StatelessWidget {
  const CustomRating({
    super.key,
    this.textColor = AppColors.whiteColor,
    this.rating,
  });

  final Color textColor;
  final dynamic rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      textDirection: TextDirection.ltr,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          Assets.iconsRateStarFill,
          width: 12,
          height: 12,
          colorFilter: ColorFilter.mode(
            AppColors.goldSwatch,
            BlendMode.srcATop,
          ),
        ),
        SizedBox(width: AppSpacing.s2),
        Text(
          rating != null ? "$rating" : '4.5',
          style: AppStyles.fontsLight12(context, 12).copyWith(color: textColor),
        ),
      ],
    );
  }
}
