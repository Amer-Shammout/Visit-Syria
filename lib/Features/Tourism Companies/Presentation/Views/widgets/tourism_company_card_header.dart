import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_rating.dart';
import 'package:visit_syria/Features/Tourism%20Companies/Data/Models/company_model.dart';
import 'package:visit_syria/Features/Tourism%20Companies/Presentation/Views/widgets/custom_company_logo.dart';

class TourismCompanyCardHeader extends StatelessWidget {
  const TourismCompanyCardHeader({super.key, required this.company});

  final CompanyModel company;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomCompanyLogo(size: 48,image: company.image,),
        SizedBox(height: AppSpacing.s8),
        Text(
          company.nameOfCompany!,
          style: AppStyles.fontsBold14(
            context,
          ).copyWith(color: AppColors.titleTextColor),
        ),
        SizedBox(height: AppSpacing.s8),
        CustomRating(
          textColor: AppColors.titleTextColor,
          rating: company.rating,
        ),
      ],
    );
  }
}
