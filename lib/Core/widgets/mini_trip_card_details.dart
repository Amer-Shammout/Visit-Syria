import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_button.dart';
import 'package:visit_syria/Core/widgets/trip_general_info.dart';

class MiniTripCardDetails extends StatelessWidget {
  const MiniTripCardDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        MiniTripCardGeneralInfo(),
        SizedBox(height: AppSpacing.s16),
        CustomButton(
          onPressed: () {},
          title: 'استكشاف',
          textStyle: AppStyles.fontsBold14(
            context,
          ).copyWith(color: AppColors.whiteColor),
          borderRadius: 16,
          verPadding: 8,
          icon: Assets.iconsArrow,
          iconColor: AppColors.whiteColor,
          shadow: null,
          size: 16,
        ),
      ],
    );
  }
}
