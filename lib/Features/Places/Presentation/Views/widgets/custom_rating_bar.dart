import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';

class CustomRatingBar extends StatelessWidget {
  final double initialRating;
  final void Function(double)? onRatingUpdate;

  const CustomRatingBar({
    super.key,
    this.initialRating = 1,
    this.onRatingUpdate,
  });

  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: initialRating,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: false,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 4),
      itemBuilder:
          (context, _) => SvgPicture.asset(
            Assets.iconsStar,
            colorFilter: ColorFilter.mode(AppColors.gold, BlendMode.srcATop),
            width: 22,
            height: 22,
          ),
      unratedColor: AppColors.graySwatch[300],
      onRatingUpdate: onRatingUpdate ?? (_) {},
      itemSize: 22,
    );
  }
}
