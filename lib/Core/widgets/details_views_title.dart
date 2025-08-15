import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/widgets/custom_rating.dart';

class DetailsViewsTitle extends StatelessWidget {
  const DetailsViewsTitle({
    super.key,
    required this.title,
    required this.hasRate,
    this.rate,
  });

  final String title;
  final bool hasRate;
  final dynamic rate;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Text(
            title,
            style: AppStyles.fontsBold32(
              context,
            ).copyWith(color: AppColors.whiteColor),
          ),
        ),
        hasRate ? CustomRating(rating: rate) : SizedBox.shrink(),
      ],
    );
  }
}
