import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visit_syria/Core/utils/styles/app_colors.dart';
import 'package:visit_syria/Core/utils/styles/app_fonts.dart';
import 'package:visit_syria/Core/utils/styles/app_spacing.dart';

class PostandBlogTag extends StatelessWidget {
  const PostandBlogTag({
    super.key,
    required this.tag,
    this.textStyle,
    this.hasIcon = false,
    this.icon,
  });

  final String tag;
  final TextStyle? textStyle;
  final bool hasIcon;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Color(0xffE5F0F1),
      ),
      child: Row(
        children: [
          hasIcon
              ? SvgPicture.asset(
                icon!,
                width: 16,
                height: 16,
                colorFilter: ColorFilter.mode(
                  AppColors.primary,
                  BlendMode.srcATop,
                ),
              )
              : SizedBox.shrink(),
          hasIcon ? SizedBox(width: AppSpacing.s4) : SizedBox(),
          Text(
            tag,
            style:
                textStyle ??
                AppStyles.fontsRegular12(
                  context,
                ).copyWith(color: AppColors.primary),
          ),
        ],
      ),
    );
  }
}
