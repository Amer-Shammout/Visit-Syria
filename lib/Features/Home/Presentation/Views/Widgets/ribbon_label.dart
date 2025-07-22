import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';

class RibbonLabel extends StatelessWidget {
  final String text;

  const RibbonLabel({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 33,
      height: 46,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.iconsRank),
          fit: BoxFit.cover,
        ),
      ),
      child: Text(
        "#1",
        style: AppStyles.fontsBold16(
          context,
        ).copyWith(color: AppColors.whiteColor),
      ),
    );
  }
}
