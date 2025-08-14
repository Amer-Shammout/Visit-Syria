import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Features/Tourism%20Companies/Presentation/Views/widgets/custom_company_logo.dart';
import 'package:visit_syria/Features/Trips/Data/Model/trip_model/company.dart';

class CustomTourismCompanyRow extends StatelessWidget {
  const CustomTourismCompanyRow({super.key, required this.company});
  final Company? company;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCompanyLogo(size: 40, image: company?.image.toString()),
        SizedBox(width: AppSpacing.s8),
        Text(
          company?.name ?? "تيك أوف",
          style: AppStyles.fontsRegular16(
            context,
          ).copyWith(color: AppColors.titleTextColor),
        ),
      ],
    );
  }
}
