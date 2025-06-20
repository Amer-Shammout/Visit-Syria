import 'package:flutter/widgets.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/utils/styles/shadows.dart';
import 'package:visit_syria/Core/widgets/custom_button.dart';
import 'package:visit_syria/Core/widgets/general_info_item.dart';
import 'package:visit_syria/Core/widgets/glass_effect.dart';

class EventsCardDetails extends StatelessWidget {
  const EventsCardDetails({super.key, this.isSmall = false});

  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    return GlassEffect(
      radius: isSmall ? 22 : 32,
      child: Container(
        padding: EdgeInsets.only(
          bottom: isSmall ? 4 : 12,
          top: isSmall ? 12 : 16,
          right: isSmall ? 12 : 16,
          left: isSmall ? 12 : 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'الحدث الخارق',
              style:
                  isSmall
                      ? AppStyles.fontsBold14(
                        context,
                      ).copyWith(color: AppColors.whiteColor)
                      : AppStyles.fontsBold20(
                        context,
                      ).copyWith(color: AppColors.whiteColor),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            SizedBox(height: AppSpacing.s0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GeneralInfoItem(
                      title: "15 أيار - 2025",
                      icon: Assets.iconsDate,
                      color: AppColors.whiteColor,
                      fontSize: isSmall ? 7 : 8,
                      iconSize: isSmall ? 11 : 12,
                    ),
                    SizedBox(width: AppSpacing.s4),
                    GeneralInfoItem(
                      icon: Assets.iconsDuration,
                      title: '5 ساعات',
                      color: AppColors.whiteColor,
                      fontSize: isSmall ? 7 : 8,
                      iconSize: isSmall ? 11 : 12,
                    ),
                  ],
                ),
                CustomButton(
                  onPressed: () {},
                  title: 'استكشاف',
                  textStyle:
                      isSmall
                          ? AppStyles.fontsRegular10(
                            context,
                          ).copyWith(color: AppColors.whiteColor)
                          : AppStyles.fontsBold12(
                            context,
                          ).copyWith(color: AppColors.whiteColor),
                  borderRadius: isSmall ? 10 : 16,
                  horPadding: 12,
                  verPadding: isSmall ? 5 : 8,
                  iconColor: AppColors.whiteColor,
                  shadow: Shadows.buttonShadow1,
                  size: isSmall ? 10 : 16,
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
