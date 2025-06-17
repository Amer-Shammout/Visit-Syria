import 'package:flutter/material.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_button.dart';
import 'package:visit_syria/Core/widgets/general_info_item.dart';

class OffersCardDetails extends StatelessWidget {
  const OffersCardDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppSpacing.s8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GeneralInfoItem(
                  icon: Assets.iconsDate,
                  title: '15 تموز - 2025',
                  fontSize: 10,
                  iconSize: 12,
                ),
                SizedBox(height: AppSpacing.s8),
                GeneralInfoItem(
                  icon: Assets.iconsTicket,
                  title: '100 تذكرة',
                  fontSize: 10,
                  iconSize: 12,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                GeneralInfoItem(
                  icon: Assets.iconsDuration,
                  title: '5 ساعات',
                  fontSize: 10,
                  iconSize: 12,
                ),
                SizedBox(height: AppSpacing.s8),
                GeneralInfoItem(
                  icon: Assets.iconsSeason,
                  title: 'صيف',
                  fontSize: 10,
                  iconSize: 12,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: AppSpacing.s8),
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
