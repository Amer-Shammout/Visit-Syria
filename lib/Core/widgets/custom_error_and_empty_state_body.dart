import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_button.dart';

class CustomErrorAndEmptyStateBody extends StatelessWidget {
  const CustomErrorAndEmptyStateBody({
    super.key,
    required this.illustration,
    required this.text,
    this.onTap,
    this.buttonText,
  });

  final String illustration;
  final String text;
  final String? buttonText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(illustration, width: 200, height: 200),
        SizedBox(height: AppSpacing.s20),
        Text(
          text,
          style: AppStyles.fontsRegular16(
            context,
          ).copyWith(color: AppColors.titleTextColor),
        ),
        onTap != null ? SizedBox(height: AppSpacing.s12) : SizedBox.shrink(),
        onTap != null
            ? CustomButton(
              onPressed: onTap!,
              title: buttonText!,
              textStyle: AppStyles.fontsBold14(
                context,
              ).copyWith(color: AppColors.whiteColor),
              borderRadius: 16,
              verPadding: 8,
              horPadding: 20,
              icon: Assets.iconsArrow,
              iconColor: AppColors.whiteColor,
              size: 16,
            )
            : SizedBox.shrink(),
      ],
    );
  }
}
