import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';

class GeneralInfoItem extends StatelessWidget {
  const GeneralInfoItem({super.key, required this.icon, required this.title});

  final String icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          icon,
          height: 16,
          width: 16,
          colorFilter: ColorFilter.mode(
            AppColors.whiteColor,
            BlendMode.srcATop,
          ),
        ),
        SizedBox(width: AppSpacing.s2),
        Text(
          title,
          style: AppStyles.fontsLight12(
            context,
          ).copyWith(color: AppColors.whiteColor),
        ),
      ],
    );
  }
}
