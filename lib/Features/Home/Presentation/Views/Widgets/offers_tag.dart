import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/shadows.dart';

class OffersTag extends StatelessWidget {
  const OffersTag({super.key, required this.discount});
  final String discount;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [Shadows.shadow],
        color: AppColors.red,
      ),
      child: Text(
        "$discount%",
        style: AppStyles.fontsBold12(
          context,
        ).copyWith(color: AppColors.whiteColor),
        textDirection: TextDirection.ltr,
      ),
    );
  }
}
