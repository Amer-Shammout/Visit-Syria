import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/widgets/custom_rating.dart';

class DetailsViewsTitle extends StatelessWidget {
  const DetailsViewsTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyles.fontsBold32(
            context,
          ).copyWith(color: AppColors.whiteColor),
        ),
        CustomRating(),
      ],
    );
  }
}
