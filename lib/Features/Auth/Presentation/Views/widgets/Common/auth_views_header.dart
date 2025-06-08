import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';

class AuthViewsHeader extends StatelessWidget {
  const AuthViewsHeader({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(Assets.imagesLogo, height: 75, width: 160),
        SizedBox(height: AppSpacing.s48),
        Text(
          title,
          style: AppStyles.fontsBold32(
            context,
          ).copyWith(color: AppColors.titleTextColor),
        ),
        const SizedBox(height: AppSpacing.s16),
        Text(
          subTitle,
          textAlign: TextAlign.center,
          style: AppStyles.fontsRegular12(
            context,
          ).copyWith(color: AppColors.bodyTextColor),
        ),
      ],
    );
  }
}
