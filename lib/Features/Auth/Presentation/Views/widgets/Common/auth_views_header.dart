import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:visit_syria/Core/utils/assets.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';

class AuthViewsHeader extends StatelessWidget {
  const AuthViewsHeader({
    super.key,
    required this.title,
    required this.subTitle,
    required this.canPop,
  });

  final String title, subTitle;
  final bool canPop;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        canPop && GoRouter.of(context).canPop()
            ? Align(
              alignment: AlignmentDirectional.centerStart,
              child: IconButton(
                onPressed: () => GoRouter.of(context).pop(),
                icon: Transform.flip(
                  flipX: true,
                  child: SvgPicture.asset(
                    Assets.iconsArrow,
                    height: 32,
                    width: 32,
                    colorFilter: ColorFilter.mode(
                      AppColors.primary,
                      BlendMode.srcATop,
                    ),
                  ),
                ),
              ),
            )
            : SizedBox.shrink(),

        SvgPicture.asset(Assets.imagesLogo, height: 75, width: 160),
        SizedBox(height: AppSpacing.s48),
        Text(
          title,
          style: AppStyles.fontsBold32(
            context,
          ).copyWith(color: AppColors.titleTextColor),
        ),
        const SizedBox(height: AppSpacing.s16),
        Text(
          subTitle,
          textAlign: TextAlign.center,
          style: AppStyles.fontsRegular12(
            context,
          ).copyWith(color: AppColors.bodyTextColor),
        ),
      ],
    );
  }
}
