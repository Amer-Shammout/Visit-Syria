import 'package:flutter/widgets.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_button.dart';
import 'package:visit_syria/Core/widgets/custom_card_background.dart';
import 'package:visit_syria/Features/Tourism%20Companies/Presentation/Views/widgets/tourism_company_card_general_info.dart';
import 'package:visit_syria/Features/Tourism%20Companies/Presentation/Views/widgets/tourism_company_card_header.dart';

class TourismCompanyCard extends StatelessWidget {
  const TourismCompanyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 170,
      child: AspectRatio(
        aspectRatio: 177 / 170,
        child: CustomCardBackground(
          padding: 8,
          child: Column(
            children: [
              TourismCompanyCardHeader(),
              SizedBox(height: AppSpacing.s16),
              TourismCompanyCardGeneralInfo(),
              SizedBox(height: AppSpacing.s16),
              CustomButton(
                onPressed: () {},
                title: "استكشاف",
                textStyle: AppStyles.fontsBold12(
                  context,
                ).copyWith(color: AppColors.whiteColor),
                verPadding: 8,
                borderRadius: 10,
                icon: Assets.iconsArrow,
                iconColor: AppColors.whiteColor,
                size: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
