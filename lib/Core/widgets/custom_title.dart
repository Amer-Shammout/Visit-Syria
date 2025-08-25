import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visit_syria/Core/constants/common_constants.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';
import 'package:visit_syria/Core/widgets/custom_text_button.dart';

class CustomTitle extends StatelessWidget {
  const CustomTitle({
    super.key,
    required this.title,
    this.icon,
    required this.hasSeeAll,
    this.seaAllAction,
    this.hasPoint = false,
    this.mainAxisAlignment,
  });

  final String title;
  final String? icon;
  final bool hasSeeAll;
  final bool hasPoint;
  final VoidCallback? seaAllAction;
  final MainAxisAlignment? mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Row(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.start,
            children: [
              hasPoint
                  ? const Text(
                    "• ",
                    style: TextStyle(fontSize: 20, height: 1.4),
                  )
                  : SizedBox.shrink(),
              Text(
                title,
                style: AppStyles.fontsBold22(
                  context,
                ).copyWith(color: AppColors.titleTextColor),
              ),

              icon == null ? SizedBox.shrink() : SizedBox(width: AppSpacing.s8),
              icon == null ? SizedBox.shrink() : SvgPicture.asset(icon!),
            ],
          ),
          hasSeeAll
              ? CustomTextButton(
                onPressed: seaAllAction!,
                title: 'مشاهدة الكل',
                textStyle: AppStyles.fontsRegular12(
                  context,
                ).copyWith(color: AppColors.gray),
              )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
