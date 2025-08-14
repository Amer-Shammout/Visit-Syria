import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/widgets/custom_rating.dart';
import 'package:visit_syria/Features/Places/Data/Models/place_model/place_model.dart';

class PlacesCardDetails extends StatelessWidget {
  const PlacesCardDetails({super.key, required this.place});

  final PlaceModel? place;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Text(
            place?.name ?? "برج إسلام",
            style: AppStyles.fontsBold20(
              context,
            ).copyWith(color: AppColors.whiteColor),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        CustomRating(rating: place?.rating),
      ],
    );
  }
}
