import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Tourism%20Companies/Presentation/Views/widgets/custom_company_logo.dart';

class TripsCardHeader extends StatelessWidget {
  const TripsCardHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCompanyLogo(size: 40),
        SizedBox(width: AppSpacing.s8),
        Text(
          "تيك أوف",
          style: AppStyles.fontsRegular16(
            context,
          ).copyWith(color: AppColors.titleTextColor),
        ),
      ],
    );
  }
}
