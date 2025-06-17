import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';

class GeneralInfoItem extends StatelessWidget {
  const GeneralInfoItem({
    super.key,
    required this.icon,
    required this.title,
    this.color = AppColors.titleTextColor,
    this.iconSize = 16,
    this.fontSize = 12,
  });

  final String icon;
  final String title;
  final Color color;
  final double iconSize;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          height: iconSize,
          width: iconSize,
          colorFilter: ColorFilter.mode(color, BlendMode.srcATop),
        ),
        SizedBox(width: AppSpacing.s2),
        Text(
          title,
          style: AppStyles.fontsLight12(
            context,
            fontSize,
          ).copyWith(color: color),
        ),
      ],
    );
  }
}
