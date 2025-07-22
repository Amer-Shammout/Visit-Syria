import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_rating.dart';
import 'package:visit_syria/Core/widgets/general_info_item.dart';
import 'package:visit_syria/Features/Tourism%20Companies/Presentation/Views/widgets/custom_company_logo.dart';

class TourismCompanyDetailsViewHeader extends StatelessWidget {
  const TourismCompanyDetailsViewHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          children: [
            CustomCompanyLogo(size: 80),
            SizedBox(width: AppSpacing.s8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "تيك أوف",
                    style: AppStyles.fontsBold20(
                      context,
                    ).copyWith(color: AppColors.titleTextColor),
                  ),
                  SizedBox(height: AppSpacing.s12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GeneralInfoItem(
                        icon: Assets.iconsMedal,
                        title: '10 سنوات خبرة',
                        iconSize: 18,
                      ),
                      GeneralInfoItem(
                        icon: Assets.iconsTripsInActive,
                        title: '10 رحلات',
                        iconSize: 18,
                      ),
                      CustomRating(textColor: AppColors.titleTextColor),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
