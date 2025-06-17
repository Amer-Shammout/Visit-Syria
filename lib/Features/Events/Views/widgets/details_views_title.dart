import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/widgets/custom_rating.dart';

class DetailsViewsTitle extends StatelessWidget {
  const DetailsViewsTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "الحدث الخارق",
          style: AppStyles.fontsBold32(
            context,
          ).copyWith(color: AppColors.whiteColor),
        ),
        CustomRating(),
      ],
    );
  }
}

