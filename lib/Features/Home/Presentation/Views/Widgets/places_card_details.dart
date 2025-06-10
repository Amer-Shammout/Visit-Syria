import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/widgets/custom_rating.dart';

class PlacesCardDetails extends StatelessWidget {
  const PlacesCardDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Text(
            "برج إسلام",
            style: AppStyles.fontsBold20(
              context,
            ).copyWith(color: AppColors.whiteColor),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        CustomRating(),
      ],
    );
  }
}