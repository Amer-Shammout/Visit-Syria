import 'package:flutter/widgets.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/utils/styles/shadows.dart';
import 'package:visit_syria/Core/utils/widgets/custom_button.dart';
import 'package:visit_syria/Core/utils/widgets/general_info_item.dart';
import 'package:visit_syria/Core/utils/widgets/glass_effect.dart';

class EventsCardDetails extends StatelessWidget {
  const EventsCardDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return GlassEffect(
      radius: 32,
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'الحدث الخارق',
              style: AppStyles.fontsBold22(
                context,
              ).copyWith(color: AppColors.whiteColor),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: AppSpacing.s8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GeneralInfoItem(
                      title: "15 أيار - 2025",
                      icon: Assets.iconsDate,
                      color: AppColors.whiteColor,
                      fontSize: 10,
                      iconSize: 12,
                    ),
                    SizedBox(width: AppSpacing.s8),
                    GeneralInfoItem(
                      icon: Assets.iconsDuration,
                      title: '5 ساعات',
                      color: AppColors.whiteColor,
                      fontSize: 10,
                      iconSize: 12,
                    ),
                  ],
                ),
                CustomButton(
                  onPressed: () {},
                  title: 'استكشاف',
                  textStyle: AppStyles.fontsBold14(
                    context,
                  ).copyWith(color: AppColors.whiteColor),
                  borderRadius: 16,
                  horPadding: 12,
                  verPadding: 8,
                  iconColor: AppColors.whiteColor,
                  shadow: Shadows.buttonShadow1,
                  size: 16,
                  icon: Assets.iconsArrow,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
