import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/shadows.dart';

class OffersCardBackground extends StatelessWidget {
  const OffersCardBackground({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        boxShadow: [Shadows.shadow],
        color: AppColors.whiteColor,
      ),
    );
  }
}